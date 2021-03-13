package edukare.escola;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.escola.domain.Escola;
import edukare.escola.domain.Usuario;
import edukare.escola.repository.EscolaRepository;
import edukare.escola.repository.UsuarioEscolaRepository;
import org.junit.jupiter.api.BeforeEach;
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

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = {EscolaApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class UsuarioEscolaIT {

    private static final Long ID = 1L;

    private static final String NOME = "Ana Maria";

    private static final String EMAIL = "ana@gmail.com";

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

    private Usuario usuario;

    public static Usuario criarEntidade(EntityManager em) {
        Usuario usuario = new Usuario();
        usuario.setEmail("ana@gmail.com");
        usuario.setNome("Ana Maria");
        usuario.setId(1L);
        return usuario;
    }

    @BeforeEach
    public void setup() {
        Escola escola = new Escola();
        escola.setId(1L);
        escola.setNome("Machado de Assis");
        escolaRepository.saveAndFlush(escola);

        usuario = criarEntidade(em);
        usuario.setEscola(escola);
    }

    @Test
    @Transactional
    void carregarUsuarioPorEmail() throws Exception {
        usuarioEscolaRepository.saveAndFlush(usuario);

        mockMvc.perform(get("/api/v1/usuarios-escola?email={email}", usuario.getEmail()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(usuario.getId().longValue()))
                .andExpect(jsonPath("$.nome").value((NOME)))
                .andExpect(jsonPath("$.email").value((EMAIL)));
    }
}
