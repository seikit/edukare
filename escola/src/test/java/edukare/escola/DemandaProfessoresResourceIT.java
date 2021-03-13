package edukare.escola;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.escola.domain.DemandaProfessores;
import edukare.escola.domain.Disciplina;
import edukare.escola.repository.DemandaProfessoresRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
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

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = {EscolaApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class DemandaProfessoresResourceIT {

    private static final Long ID = 1L;

    private static final Integer ANO = 2021;

    private static final String DISCIPLINA = "Portugês";

    private static final Integer SEMESTRE = 1;

    private static final String ESCOLA = "Machado de Assis";

    private static final Long ESCOLAID = 1L;

    private static final Integer QUANTIDADE = 1;

    private static final String JUSTIFICATIVA = "Docentes afastados para estudo";

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private DemandaProfessoresRepository demandaProfessorRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private DemandaProfessores demandaProfessor;



    public static DemandaProfessores criarEntidade(EntityManager em) {
        DemandaProfessores demandaProfessor = new DemandaProfessores();
        demandaProfessor.setId(ID);
        demandaProfessor.setAno(ANO);
        demandaProfessor.setDisciplina(DISCIPLINA);
        demandaProfessor.setEscola(ESCOLA);
        demandaProfessor.setEscolaId(ESCOLAID);
        demandaProfessor.setJustificativa(JUSTIFICATIVA);
        demandaProfessor.setQuantidade(QUANTIDADE);
        demandaProfessor.setSemestre(SEMESTRE);
        return demandaProfessor;
    }

    @BeforeEach
    public void setup() {
        demandaProfessor = criarEntidade(em);
    }

    @Test
    @Transactional
    void carregarTodasDemandas() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);

        mockMvc.perform(get("/api/v1/demandas")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(demandaProfessor.getId().intValue()))
                .andExpect(jsonPath("$.[*].ano").value(hasItem(ANO)))
                .andExpect(jsonPath("$.[*].disciplina").value(hasItem(DISCIPLINA)))
                .andExpect(jsonPath("$.[*].escola").value(hasItem(ESCOLA)))
                .andExpect(jsonPath("$.[*].justificativa").value(hasItem(JUSTIFICATIVA)))
                .andExpect(jsonPath("$.[*].quantidade").value(hasItem(QUANTIDADE)))
                .andExpect(jsonPath("$.[*].semestre").value(hasItem(SEMESTRE)));
    }

    @Test
    @Transactional
    void carregarDemandaPorId() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);

        mockMvc.perform(get("/api/v1/demandas/{id}", demandaProfessor.getId().longValue()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(demandaProfessor.getId().longValue()))
                .andExpect(jsonPath("$.ano").value((ANO)))
                .andExpect(jsonPath("$.disciplina").value((DISCIPLINA)))
                .andExpect(jsonPath("$.escola").value((ESCOLA)))
                .andExpect(jsonPath("$.justificativa").value((JUSTIFICATIVA)))
                .andExpect(jsonPath("$.quantidade").value((QUANTIDADE)))
                .andExpect(jsonPath("$.semestre").value((SEMESTRE)));
    }

    @Test
    @Transactional
    void carregarDemandasPorEscolaId() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);
        DemandaProfessores d = new DemandaProfessores();
        d.setAno(2021);
        d.setDisciplina("Informática");
        d.setSemestre(2);
        d.setQuantidade(1);
        d.setJustificativa("Docente atual está de licença médica");
        d.setEscolaId(1L);
        d.setEscola("Machado de Assis");
        demandaProfessorRepository.saveAndFlush(d);

        mockMvc.perform(get("/api/v1/demandas/escola/{id}", demandaProfessor.getEscolaId().longValue())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(hasItems(1,2)))
                .andExpect(jsonPath("$.[*].ano").value(hasItem(ANO)))
                .andExpect(jsonPath("$.[*].disciplina").value(hasItem(DISCIPLINA)))
                .andExpect(jsonPath("$.[*].escola").value(hasItem(ESCOLA)))
                .andExpect(jsonPath("$.[*].justificativa").value(hasItem(JUSTIFICATIVA)))
                .andExpect(jsonPath("$.[*].quantidade").value(hasItem(QUANTIDADE)))
                .andExpect(jsonPath("$.[*].semestre").value(hasItem(SEMESTRE)));

        int quantidadeDemandasPorEscola = demandaProfessorRepository.findDemandaProfessoresByEscolaId(1L).size();
        assertThat(quantidadeDemandasPorEscola).isEqualTo(2);
    }

    @Test
    @Transactional
    void salvarDemanda() throws Exception {
        int registrosBanco = demandaProfessorRepository.findAll().size();

        mockMvc.perform(post("/api/v1/demandas").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(demandaProfessor)))
                .andExpect(status().isCreated());

        List<DemandaProfessores> demandaList = demandaProfessorRepository.findAll();
        assertThat(demandaList).hasSize(registrosBanco + 1);
        DemandaProfessores testDemanda = demandaList.get(demandaList.size() - 1);
        assertThat(testDemanda.getEscolaId()).isEqualTo(ESCOLAID);
    }

    @Test
    @Transactional
    void editarDemanda() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);

        int registrosBanco = demandaProfessorRepository.findAll().size();

        Optional<DemandaProfessores> updateDemanda = demandaProfessorRepository.findById(demandaProfessor.getId());

        em.detach(updateDemanda.get());
        updateDemanda.get().setDisciplina("Informática");

        mockMvc.perform(put("/api/v1/demandas").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(updateDemanda)))
                .andExpect(status().isOk());

        List<DemandaProfessores> listaDemandas = demandaProfessorRepository.findAll();
        assertThat(listaDemandas).hasSize(registrosBanco);
        DemandaProfessores testDemanda = listaDemandas.get(listaDemandas.size() - 1);
        assertThat(testDemanda.getDisciplina()).isEqualTo("Informática");
    }

    @Test
    @Transactional
    void deletarDemanda() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);

        int registrosAntesDeDeletar = demandaProfessorRepository.findAll().size();

        mockMvc.perform(delete("/api/v1/demandas/{id}", demandaProfessor.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        List<DemandaProfessores> listaDemanda = demandaProfessorRepository.findAll();
        assertThat(listaDemanda).hasSize(registrosAntesDeDeletar - 1);
    }

    @Test
    @Transactional
    void relatorioDemanda() throws Exception {
        demandaProfessorRepository.saveAndFlush(demandaProfessor);

        mockMvc.perform(get("/api/v1/demandas/relatorio?escolaId={id}",demandaProfessor.getEscolaId()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=demanda.pdf"));
    }
}
