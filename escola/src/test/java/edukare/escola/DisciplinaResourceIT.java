package edukare.escola;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.escola.domain.Disciplina;
import edukare.escola.repository.DisciplinaRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = {EscolaApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
public class DisciplinaResourceIT {

    private static final Long ID = 1L;

    private static final String NOME = "Matemática";

    private static final String ATIVA = "S";

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private DisciplinaRepository disciplinaRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Disciplina disciplina;

    public static Disciplina criarEntidade(EntityManager em) {
        Disciplina disciplina = new Disciplina();
        disciplina.setId(ID);
        disciplina.setNome(NOME);
        disciplina.setAtiva(ATIVA);
        return disciplina;
    }

    @BeforeEach
    public void setup() {
        disciplina = criarEntidade(em);
    }

    @Test
    @Transactional
    public void carregarDisciplinaPorId() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        mockMvc.perform(get("/api/v1/disciplinas/{id}", disciplina.getId().longValue()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(disciplina.getId().longValue()))
                .andExpect(jsonPath("$.nome").value(NOME))
                .andExpect(jsonPath("$.ativa").value("S"));
    }

    @Test
    @Transactional
    public void criarDisciplina() throws Exception {
        int registrosBanco = disciplinaRepository.findAll().size();

        mockMvc.perform(post("/api/v1/disciplinas").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(disciplina)))
                .andExpect(status().isCreated());

        List<Disciplina> disciplinaList = disciplinaRepository.findAll();
        assertThat(disciplinaList).hasSize(registrosBanco + 1);
        Disciplina testDisciplina = disciplinaList.get(disciplinaList.size() - 1);
        assertThat(testDisciplina.getNome()).isEqualTo(NOME);
    }

    @Test
    @Transactional
    public void carregarDisciplinaInexistente() throws Exception {
        mockMvc.perform(get("/api/v1/disciplinas/{id}", Long.MAX_VALUE))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void carregarTodasDisciplinas() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        mockMvc.perform(get("/api/v1/disciplinas")
            .accept(MediaType.APPLICATION_JSON))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
            .andExpect(jsonPath("$.[*].id").value(disciplina.getId().intValue()))
            .andExpect(jsonPath("$.[*].nome").value(hasItem(NOME)))
            .andExpect(jsonPath("$.[*].ativa").value(hasItem(ATIVA)));
    }

    @Test
    @Transactional
    public void atualizarDisciplina() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        int registrosBanco = disciplinaRepository.findAll().size();

        Optional<Disciplina> updatedDisciplina = disciplinaRepository.findById(disciplina.getId());

        em.detach(updatedDisciplina.get());
        updatedDisciplina.get().setNome("Informática");

        mockMvc.perform(put("/api/v1/disciplinas").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(updatedDisciplina)))
                .andExpect(status().isOk());

        List<Disciplina> listaDisciplinas = disciplinaRepository.findAll();
        assertThat(listaDisciplinas).hasSize(registrosBanco);
        Disciplina testDisciplina = listaDisciplinas.get(listaDisciplinas.size() - 1);
        assertThat(testDisciplina.getNome()).isEqualTo("Informática");
    }

    @Test
    @Transactional
    public void atualizarDisciplinaInexistente() throws Exception {
        int registroBanco = disciplinaRepository.findAll().size();
        Disciplina d = disciplina;

        mockMvc.perform(put("/api/v1/disciplinas").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(d)))
                .andExpect(status().isNotFound());

        List<Disciplina> listaDisciplina = disciplinaRepository.findAll();
        assertThat(listaDisciplina).hasSize(registroBanco);
    }

    @Test
    @Transactional
    public void deletarDisciplina() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        int registrosAntesDeDeletar = disciplinaRepository.findAll().size();

        mockMvc.perform(delete("/api/v1/disciplinas/{id}", disciplina.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        List<Disciplina> listaDisciplina = disciplinaRepository.findAll();
        assertThat(listaDisciplina).hasSize(registrosAntesDeDeletar - 1);
    }

    @Test
    @Transactional
    public void deletarDisciplinaInexistente() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);
        int registrosAntesDeDeletar = disciplinaRepository.findAll().size();

        mockMvc.perform(delete("/api/v1/disciplinas/{id}", disciplina.getId() + 1).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());

        List<Disciplina> listaDisciplina = disciplinaRepository.findAll();
        assertThat(listaDisciplina).hasSize(registrosAntesDeDeletar);
    }

    @Test
    @Transactional
    public void carregarDisciplinaAtivas() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        Disciplina d = disciplina;
        d.setId(2L);
        d.setNome("Informática");
        d.setAtiva("N");
        disciplinaRepository.saveAndFlush(d);

        MvcResult result = mockMvc.perform(get("/api/v1/disciplinas/ativas")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].ativa").value(hasItem(ATIVA)))
                .andReturn();

        String res = result.getResponse().getContentAsString();
        List<Disciplina> disciplinas = Arrays.asList(mapper.readValue(res, Disciplina[].class));

        assertThat(disciplinas).hasSize(1);
        assertThat(disciplinas.get(0).getAtiva()).isEqualTo("S");
    }

    @Test
    @Transactional
    public void gerarRelatorio() throws Exception {
        disciplinaRepository.saveAndFlush(disciplina);

        mockMvc.perform(get("/api/v1/disciplinas/relatorio"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=disciplinas.pdf"));
    }
}
