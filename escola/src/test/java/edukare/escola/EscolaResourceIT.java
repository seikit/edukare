package edukare.escola;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.escola.domain.DemandaProfessores;
import edukare.escola.domain.Escola;
import edukare.escola.domain.Usuario;
import edukare.escola.repository.DemandaProfessoresRepository;
import edukare.escola.repository.EscolaRepository;
import edukare.escola.repository.UsuarioEscolaRepository;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasItems;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@SpringBootTest(classes = {EscolaApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class EscolaResourceIT {
    private static final Long ID = 1L;

    private static final String NOME = "Machado de Assis";

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private EscolaRepository escolaRepository;

    @Autowired
    private UsuarioEscolaRepository usuarioEscolaRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Escola escola;

    public static Escola criarEntidade(EntityManager em) {
        Escola escola = new Escola();
        escola.setId(ID);
        escola.setNome(NOME);
        return escola;
    }

    @BeforeEach
    public void setup() {
        escola = criarEntidade(em);
        Usuario usuario = new Usuario();
        usuario.setId(1L);
        usuario.setNome("Ana Maria");
        usuario.setEmail("ana@gmail.com");
        usuario.setEscola(escola);
        usuarioEscolaRepository.saveAndFlush(usuario);
        Set<Usuario> usuarios = new HashSet<>();
        usuarios.add(usuario);
        escola.setUsuario(usuarios);
    }

    @Test
    @Transactional
    @DisplayName("Carregar escola do usuário logado")
    void carregarUsuarioPorEmail() throws Exception {
        escolaRepository.saveAndFlush(escola);

        mockMvc.perform(get("/api/v1/escolas?email={email}", "ana@gmail.com")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(1L))
                .andExpect(jsonPath("$.nome").value(NOME));
    }

    @Test
    @Transactional
    void carregarUsuarioPorEmailInexistente() throws Exception {
        escolaRepository.saveAndFlush(escola);

        mockMvc.perform(get("/api/v1/escolas?email={email}", "jose@gmail.com")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void carregarTodasEscola() throws Exception {
        escolaRepository.saveAndFlush(escola);

        Escola e = new Escola();
        e.setId(2L);
        e.setNome("Monteiro Lobato");
        escolaRepository.saveAndFlush(e);

        mockMvc.perform(get("/api/v1/escolas/todas")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(hasItems(1, 2)))
                .andExpect(jsonPath("$.[*].nome").value(hasItems(NOME, "Monteiro Lobato")));

        int registrosBanco = escolaRepository.findAll().size();
        assertThat(registrosBanco).isEqualTo(2);
    }
}
