package edukare.processoseletivo.web.rest;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.processoseletivo.ProcessoSeletivoApplication;
import edukare.processoseletivo.domain.Etapa;
import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.enumeration.Situacao;
import edukare.processoseletivo.repository.ProcessoRepository;
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
import org.springframework.test.web.servlet.MvcResult;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@SpringBootTest(classes = {ProcessoSeletivoApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class ProcessoSeletivoResourceIT {

    private static final Long ID = 1L;

    private static final String TITULO = "Processo seletivo 2021";

    private static final String DESCRICAO = "Processo seletivo para professores temporários";

    private static final Situacao SITUACAO = Situacao.NOVO;

    private static final LocalDate DATA_INICIO_INSCRICAO = LocalDate.now().minusDays(1);

    private static final LocalDate DATA_FIM_INSCRICAO = LocalDate.now().plusWeeks(1);

    //Etapa
    private static final Long ET_ID = 1L;

    private static final String ET_TITULO = "Prova de títulos";

    private static final String ET_DESCRICAO = "Etapa destina a avaliação dos título informados pelo candidato";

    private static final LocalDate ET_DATA = LocalDate.now().plusWeeks(2);

    private static final Long ET_PROCESSO = 1L;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private ProcessoRepository processoRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private ProcessoSeletivo processoSeletivo;

    public static ProcessoSeletivo criarEntidade(EntityManager em) {
        ProcessoSeletivo processo = new ProcessoSeletivo();
        processo.setTitulo(TITULO);
        processo.setDescricao(DESCRICAO);
        processo.setSituacao(SITUACAO);
        processo.setDtInicioInscricao(DATA_INICIO_INSCRICAO);
        processo.setDtEncerramentoInscricao(DATA_FIM_INSCRICAO);

        Etapa etapa = new Etapa();
        etapa.setId(ET_ID);
        etapa.setTitulo(ET_TITULO);
        etapa.setDescricao(ET_DESCRICAO);
        etapa.setData(ET_DATA);

        Set<Etapa> etapas = new HashSet<>();
        etapas.add(etapa);
        processo.setEtapas(etapas);
        return processo;
    }

    @BeforeEach
    public void setup() {
        processoSeletivo = criarEntidade(em);
    }

    @Test
    @Transactional
    void criarProcesso() throws Exception {
        int registrosBanco = processoRepository.findAll().size();

        mockMvc.perform(post("/api/v1/processos").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(processoSeletivo)))
                .andExpect(status().isCreated());

        List<ProcessoSeletivo> processoList = processoRepository.findAll();
        assertThat(processoList).hasSize(registrosBanco + 1);
        ProcessoSeletivo testProcesso = processoList.get(processoList.size() - 1);
        assertThat(testProcesso.getId()).isEqualTo(ID);
    }

    @Test
    @Transactional
    @Disabled
    void atualizarProcesso() throws Exception {
    // TODO Fix não encontra a etapa para atualizar - relação OneToMany
        processoRepository.saveAndFlush(processoSeletivo);

        int registrosBanco = processoRepository.findAll().size();

        Optional<ProcessoSeletivo> updateProcesso = processoRepository.findById(processoSeletivo.getId());

        em.detach(updateProcesso.get());
        updateProcesso.get().getEtapas().forEach(e -> e.setTitulo("ETAPA EDITADA"));

        mockMvc.perform(put("/api/v1/processos").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(updateProcesso)))
                .andExpect(status().isOk());

        List<ProcessoSeletivo> listaProcessos = processoRepository.findAll();
        assertThat(listaProcessos).hasSize(registrosBanco);
        ProcessoSeletivo testProcesso = listaProcessos.get(listaProcessos.size() - 1);
        assertThat(List.copyOf(testProcesso.getEtapas()).get(0).getTitulo()).isEqualTo("Maria Silva");
    }

    @Test
    @Transactional
    void carregarTodosProcessos() throws Exception {
        processoRepository.saveAndFlush(processoSeletivo);

        mockMvc.perform(get("/api/v1/processos")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(1))
                .andExpect(jsonPath("$.[*].titulo").value((TITULO)))
                .andExpect(jsonPath("$.[*].dtInicioInscricao").value((DATA_INICIO_INSCRICAO.toString())))
                .andExpect(jsonPath("$.[*].dtEncerramentoInscricao").value((DATA_FIM_INSCRICAO.toString())));
    }

    @Test
    @Transactional
    void deletarProcesso() throws Exception {
        processoRepository.saveAndFlush(processoSeletivo);

        int registrosBanco = processoRepository.findAll().size();
        assertThat(registrosBanco).isEqualTo(1);

        mockMvc.perform(delete("/api/v1/processos/{id}", processoSeletivo.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        int registroBancoPosDelete = processoRepository.findAll().size();
        assertThat(registroBancoPosDelete).isEqualTo(0);
    }

    @Test
    @Transactional
    void carregarProcessosInscricoesAbertas() throws Exception {
        processoRepository.saveAndFlush(processoSeletivo);

        MvcResult result = mockMvc.perform(get("/api/v1/processos/abertos").with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(1))
                .andReturn();

        String jsonResponse = result.getResponse().getContentAsString();
        ProcessoSeletivo[] p = mapper.readValue(jsonResponse, ProcessoSeletivo[].class);
        assertThat(p[0].getDtInicioInscricao().isBefore(LocalDate.now())).isTrue();
        assertThat(p[0].getDtEncerramentoInscricao().isAfter(LocalDate.now())).isTrue();
    }

    @Test
    @Transactional
    void carregarProcessoPorId() throws Exception {
        processoRepository.saveAndFlush(processoSeletivo);

        mockMvc.perform(get("/api/v1/processos/{id}", processoSeletivo.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.titulo").value((TITULO)))
                .andExpect(jsonPath("$.dtInicioInscricao").value((DATA_INICIO_INSCRICAO.toString())))
                .andExpect(jsonPath("$.dtEncerramentoInscricao").value((DATA_FIM_INSCRICAO.toString())));
    }

    @Test
    @Transactional
    void carregarProcessosRelatorio() throws Exception {
        processoRepository.saveAndFlush(processoSeletivo);

        mockMvc.perform(get("/api/v1/processos/relatorio"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=processos.pdf"));
    }
}
