package edukare.candidato.web.rest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.candidato.CandidatoApplication;
import edukare.candidato.domain.*;
import edukare.candidato.dto.CandidatoDto;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.repository.CandidatoRepository;
import edukare.candidato.repository.InscricaoRepository;
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

import javax.persistence.*;
import javax.transaction.Transactional;
import java.time.LocalDateTime;
import java.util.*;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.in;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@SpringBootTest(classes = {CandidatoApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class InscricaoResourceIT {

    private static final Long ID = 1L;

    private static final String EMAIL_USUARIO = "ana@gmail.com";

    private static final Situacao SITUACAO = Situacao.ATIVA;

    private static final Long PROCESSO_SELETIVO_ID = 1L;

    private static final LocalDateTime DATA_INSCRICAO = LocalDateTime.now();

    private static final String NOME_COMPLETO = "Ana Maria";

    private static final String CPF = "123.456.789-12";

    private static final String FILIACAO1 = "Juliana Silva";

    private static final String FILIACAO2 = "Marcos Silva";

    private static final String EMAIL = "ana@gmail.com";

    private static final String CELULAR = "(12)91234-5678";

    private static final String TELEFONE_FIXO = "(12)12345-6789";

    private static final String NATURALIDADE = "Campo Grande/MS";

    private static final String RUA = "Rua da Paz";

    private static final Long NUMERO = 100L;

    private static final String BAIRRO = "Centro";

    private static final String CIDADE_RESIDENCIA = "São Paulo/SP";

    private static final String ESTADO_RESIDENCIA = "São Paulo";

    private static final String NIVEL_ESCOLARIDADE = "SUPERIOR_COMPLETO";

    // Titulos da inscricao
    private static final Long TIT_ID = 1L;
    private static final String TIT_INSTITUICAO = "PUC";
    private static final String TIT_CURSO = "Desenvolvimento web";
    private static final Integer TIT_ANO_CONCLUSAO = 2021;


    // Candidato

    private static final Long CAN_ID = 1L;

    private static final String CAN_EMAIL_USUARIO = "ana@gmail.com";

    private static final String CAN_NOME = "Ana Maria";

    private static final String CAN_CPF = "123.456.789-12";

    private static final String CAN_FILIACAO1 = "Juliana Silva";

    private static final String CAN_FILIACAO2 = "Marcos Pereira";

    private static final String CAN_EMAIL = "ana@gmail.com";

    private static final String CAN_CELULAR = "(12)92345-6789";

    private static final String CAN_TELEFONE_FIXO = "(12)12345-6789";

    private static final String CAN_NATURALIDADE = "Campo Grande/MS";

    // Campos Endereco

    private static final Long END_ID = 1L;

    private static final String END_RUA = "Rua da Paz";

    private static final Long END_NUMERO = 100L;

    private static final String END_BAIRRO = "Centro";

    private static final String END_CIDADE_RESIDENCIA = "São Paulo";

    private static final String END_ESTADO_RESIDENCIA = "SP";

    // Campos Educação

    private static final Long EDU_ID = 1L;

    private static final String EDU_NIVEL_ESCOLARIDADE = "SUPERIOR_COMPLETO";

    // Campos Titulo
    private Long id;

    private static final Long CAN_TIT_ID = 1L;

    private static final String CAN_TIT_INSTITUICAO = "PUC";

    private static final String CAN_TIT_CURSO = "Desenvolvimento web";

    private static final Integer CAN_TIT_ANO_CONCLUSAO = 2021;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private InscricaoRepository inscricaoRepository;

    @Autowired
    private CandidatoRepository candidatoRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Inscricao inscricao;
    private Candidato candidato;

    public static Inscricao criarEntidadeInscricao(EntityManager em) {
        Inscricao inscricao = new Inscricao();
        inscricao.setId(ID);
        inscricao.setEmailUsuario(EMAIL_USUARIO);
        inscricao.setSituacao(SITUACAO);
        inscricao.setNomeCompleto(NOME_COMPLETO);
        inscricao.setProcessoSeletivoId(PROCESSO_SELETIVO_ID);
        inscricao.setDataInscricao(DATA_INSCRICAO);
        inscricao.setCpf(CPF);
        inscricao.setFiliacao1(FILIACAO1);
        inscricao.setFiliacao2(FILIACAO2);
        inscricao.setEmail(EMAIL);
        inscricao.setCelular(CELULAR);
        inscricao.setTelefoneFixo(TELEFONE_FIXO);
        inscricao.setNaturalidade(NATURALIDADE);
        inscricao.setRua(RUA);
        inscricao.setNumero(NUMERO);
        inscricao.setBairro(BAIRRO);
        inscricao.setCidadeResidencia(CIDADE_RESIDENCIA);
        inscricao.setEstadoResidencia(ESTADO_RESIDENCIA);
        inscricao.setNivelEscolaridade(NIVEL_ESCOLARIDADE);

        TituloInscricao titulo = new TituloInscricao();
        titulo.setInscricao(inscricao);
        titulo.setId(TIT_ID);
        titulo.setInstituicaoEnsino(TIT_INSTITUICAO);
        titulo.setTituloCurso(TIT_CURSO);
        titulo.setAnoConclusao(TIT_ANO_CONCLUSAO);

        Set<TituloInscricao> titulos = new HashSet<>();
        titulos.add(titulo);
        inscricao.setTitulos(titulos);

        return inscricao;
    }

    public static Candidato criarEntidadeCandidato(EntityManager em) {
        Candidato candidato = new Candidato();
        candidato.setId(CAN_ID);
        candidato.setEmailUsuario(CAN_EMAIL_USUARIO);
        candidato.setNomeCompleto(CAN_NOME);
        candidato.setCpf(CAN_CPF);
        candidato.setFiliacao1(CAN_FILIACAO1);
        candidato.setFiliacao2(CAN_FILIACAO2);
        candidato.setEmail(CAN_EMAIL);
        candidato.setCelular(CAN_CELULAR);
        candidato.setTelefoneFixo(CAN_TELEFONE_FIXO);
        candidato.setNaturalidade(CAN_NATURALIDADE);

        Endereco endereco = new Endereco();
        endereco.setId(END_ID);
        endereco.setRua(END_RUA);
        endereco.setNumero(END_NUMERO);
        endereco.setBairro(END_BAIRRO);
        endereco.setCidadeResidencia(END_CIDADE_RESIDENCIA);
        endereco.setEstadoResidencia(END_ESTADO_RESIDENCIA);
        candidato.setEndereco(endereco);

        Educacao educacao = new Educacao();
        educacao.setId(EDU_ID);
        educacao.setNivelEscolaridade(EDU_NIVEL_ESCOLARIDADE);

        Titulo titulo = new Titulo();
        titulo.setId(CAN_TIT_ID);
        titulo.setInstituicaoEnsino(CAN_TIT_INSTITUICAO);
        titulo.setAnoConclusao(CAN_TIT_ANO_CONCLUSAO);
        titulo.setTituloCurso(CAN_TIT_CURSO);
        Set<Titulo> titulos = new HashSet<>();
        titulos.add(titulo);

        educacao.setTitulos(titulos);
        candidato.setEducacao(educacao);
        return candidato;
    }

    @BeforeEach
    public void setup() {
        inscricao = criarEntidadeInscricao(em);
        candidato = criarEntidadeCandidato(em);
        candidatoRepository.saveAndFlush(candidato);
    }

    @Test
    @Transactional
    void inscreverCandidato() throws Exception {
        InscricaoDto inscricaoDto = new InscricaoDto(inscricao.getProcessoSeletivoId(), inscricao.getEmailUsuario());

        int registrosBanco = inscricaoRepository.findAll().size();
        mockMvc.perform(post("/api/v1/inscricoes").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(inscricaoDto)))
                .andExpect(status().isCreated());

        List<Inscricao> inscricaoList = inscricaoRepository.findAll();
        assertThat(inscricaoList).hasSize(registrosBanco + 1);
        Inscricao testInscricao = inscricaoList.get(inscricaoList.size() - 1);
        assertThat(testInscricao.getId()).isEqualTo(ID);
    }

    @Test
    @Transactional
    void atualizarSituacaoInscricoes() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        int registrosBanco = inscricaoRepository.findAll().size();

        Optional<Inscricao> updateInscricao = inscricaoRepository.findById(inscricao.getId());

        em.detach(updateInscricao.get());
        updateInscricao.get().setSituacao(Situacao.CANCELADA);
        List<Inscricao> inscricoes = new ArrayList<>();
        inscricoes.add(updateInscricao.get());

        mockMvc.perform(put("/api/v1/inscricoes/atualizar-situacao").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(inscricoes)))
                .andExpect(status().isOk());

        List<Inscricao> listaInscricoes = inscricaoRepository.findAll();
        assertThat(listaInscricoes).hasSize(registrosBanco);
        Inscricao testInscricao = listaInscricoes.get(listaInscricoes.size() - 1);
        assertThat(testInscricao.getSituacao()).isEqualTo(Situacao.CANCELADA);
    }

    @Test
    @Transactional
    void carregarTodasInscricoesDoCandidato() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        mockMvc.perform(get("/api/v1/inscricoes/candidato?email={email}", inscricao.getEmailUsuario())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(1))
                .andExpect(jsonPath("$.[*].emailUsuario").value((EMAIL_USUARIO)))
                .andExpect(jsonPath("$.[*].nomeCompleto").value((NOME_COMPLETO)))
                .andExpect(jsonPath("$.[*].cpf").value((CPF)))
                .andExpect(jsonPath("$.[*].filiacao1").value((FILIACAO1)))
                .andExpect(jsonPath("$.[*].filiacao2").value((FILIACAO2)))
                .andExpect(jsonPath("$.[*].email").value((EMAIL)))
                .andExpect(jsonPath("$.[*].celular").value((CELULAR)))
                .andExpect(jsonPath("$.[*].telefoneFixo").value((TELEFONE_FIXO)))
                .andExpect(jsonPath("$.[*].naturalidade").value((NATURALIDADE)));

    }

    @Test
    @Transactional
    void relatorioInscricao() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        mockMvc.perform(get("/api/v1/inscricoes/relatorio?email={email}", inscricao.getEmailUsuario()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=inscricao.pdf"));
    }

    @Test
    @Transactional
    void carregarInscricaoPorId() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        mockMvc.perform(get("/api/v1/inscricoes/{id}", inscricao.getId())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.emailUsuario").value((EMAIL_USUARIO)))
                .andExpect(jsonPath("$.nomeCompleto").value((NOME_COMPLETO)))
                .andExpect(jsonPath("$.cpf").value((CPF)))
                .andExpect(jsonPath("$.filiacao1").value((FILIACAO1)))
                .andExpect(jsonPath("$.filiacao2").value((FILIACAO2)))
                .andExpect(jsonPath("$.email").value((EMAIL)))
                .andExpect(jsonPath("$.celular").value((CELULAR)))
                .andExpect(jsonPath("$.telefoneFixo").value((TELEFONE_FIXO)))
                .andExpect(jsonPath("$.naturalidade").value((NATURALIDADE)));

    }

    @Test
    @Transactional
    void carregarInscricaoAtivaNoProcesso() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        mockMvc.perform(get("/api/v1/inscricoes/ativas/candidato?email={email}&processoSeletivoId={id}", inscricao.getEmailUsuario(), inscricao.getProcessoSeletivoId())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.id").value(1))
                .andExpect(jsonPath("$.situacao").value(("ATIVA")));
    }

    @Test
    @Transactional
    @DisplayName("Carregar inscrições ativas de um processo seletivo")
    void carregarInscricoesAtivasDoProcessoSeletivo() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        mockMvc.perform(get("/api/v1/inscricoes/processo/{id}", inscricao.getProcessoSeletivoId())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.[*].id").value(1))
                .andExpect(jsonPath("$.[*].situacao").value(("ATIVA")));
    }

    @Test
    @Transactional
    void deletarInscricao() throws Exception {
        inscricaoRepository.saveAndFlush(inscricao);

        int registrosAntesDeDeletar = inscricaoRepository.findAll().size();

        mockMvc.perform(delete("/api/v1/inscricoes/{id}", inscricao.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        List<Inscricao> listaDemanda = inscricaoRepository.findAll();
        assertThat(listaDemanda).hasSize(registrosAntesDeDeletar - 1);
    }
}
