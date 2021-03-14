package edukare.processoseletivo.web.rest;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.processoseletivo.ProcessoSeletivoApplication;
import edukare.processoseletivo.domain.Etapa;
import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.enumeration.Situacao;
import edukare.processoseletivo.repository.ProcessoRepository;
import edukare.processoseletivo.repository.ProfessorRepository;
import net.bytebuddy.asm.Advice;
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

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@SpringBootTest(classes = {ProcessoSeletivoApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class ProfessorResourceIT {

    private static final Long ID = 1L;

    private static final Long PROCESSO_SELETIVO_ID = 1L;

    private static final String PROCESSO_SELETIVO_TITULO = "Processo seletivo para professores temporários";

    private static final LocalDateTime DATA_EFETIVACAO = LocalDateTime.now();

    private static final Long INSCRICAO_ID = 1L;

    private static final String NOME_COMPLETO = "Ana Silva";

    private static final String CPF = "123.456.789-12";

    private static final String EMAIL = "ana@gmail.com";

    private static final String CELULAR = "(12)92345-6789";

    private static final String TELEFONE_FIXO = "(12)12345-6789";

    private static final Boolean ENCAMINHADO = false;

    private static final Long ESCOLA_ID_ENCAMINHAMENTO = null;

    private static final String ESCOLA_ENCAMINHAMENTO = null;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private ProfessorRepository professorRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Professor professor;

    public static Professor criarEntidade(EntityManager em) {
        Professor professor = new Professor();
        professor.setProcessoSeletivoId(PROCESSO_SELETIVO_ID);
        professor.setProcessoSeletivoTitulo(PROCESSO_SELETIVO_TITULO);
        professor.setDataEfetivacao(DATA_EFETIVACAO);
        professor.setInscricaoId(INSCRICAO_ID);
        professor.setNomeCompleto(NOME_COMPLETO);
        professor.setCpf(CPF);
        professor.setEmail(EMAIL);
        professor.setCelular(CELULAR);
        professor.setTelefoneFixo(TELEFONE_FIXO);
        professor.setEncaminhado(ENCAMINHADO);
        return professor;
    }

    @BeforeEach
    public void setup() {
        professor = criarEntidade(em);
    }

    @Test
    @Transactional
    @Disabled
    // TODO contornar a necessidade de extrair o token para acessar microservico do candidato no processo de efetivação.
    void efetivarCandidatosEmProfessores() throws Exception {
        int registrosBanco = professorRepository.findAll().size();

        professor.setEncaminhado(true);
        professor.setEscolaIdEncaminhamento(1L);
        professor.setEscolaEncaminhamento("Machado de Assis");

        List<Professor> professores = new ArrayList<>();
        professores.add(professor);

        mockMvc.perform(post("/api/v1/professores").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(professores)))
                .andExpect(status().isOk());

        List<Professor> processoList = professorRepository.findAll();
        Professor p = processoList.get(0);
        assertThat(p.getEncaminhado()).isTrue();
    }

    @Test
    @Transactional
    void carregarProfessores() throws Exception {
        professorRepository.saveAndFlush(professor);

        mockMvc.perform(get("/api/v1/professores")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(1))
                .andExpect(jsonPath("$.[*].processoSeletivoId").value(1))
                .andExpect(jsonPath("$.[*].dataEfetivacao").value(DATA_EFETIVACAO.toString()))
                .andExpect(jsonPath("$.[*].cpf").value(CPF));
    }

    @Test
    @Transactional
    void encaminharProfessores() throws Exception {
        professorRepository.saveAndFlush(professor);

        professor.setEscolaIdEncaminhamento(1L);
        professor.setEscolaEncaminhamento("Machado de Assis");

        List<Professor> professores = new ArrayList<>();
        professores.add(professor);

        mockMvc.perform(post("/api/v1/professores/encaminhar").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(professores)))
                .andExpect(status().isOk());

        List<Professor> processoList = professorRepository.findAll();
        Professor p = processoList.get(0);
        assertThat(p.getEncaminhado()).isTrue();
    }

    @Test
    @Transactional
    void carregarDadosRelatorioProfessor() throws Exception {
        professorRepository.saveAndFlush(professor);

        mockMvc.perform(get("/api/v1/professores/relatorio"))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=professor.pdf"));
    }
}
