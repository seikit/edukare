package edukare.candidato.web.rest;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.candidato.CandidatoApplication;
import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Educacao;
import edukare.candidato.domain.Endereco;
import edukare.candidato.domain.Titulo;
import edukare.candidato.dto.CandidatoDto;
import edukare.candidato.repository.CandidatoRepository;
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

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.hamcrest.Matchers.hasItems;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;

@SpringBootTest(classes = {CandidatoApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class CandidatoResourceIT {

    private static final Long ID = 1L;

    private static final String EMAIL_USUARIO = "ana@gmail.com";

    private static final String NOME = "Ana Maria";

    private static final String CPF = "123.456.789-12";

    private static final String FILIACAO1 = "Juliana Silva";

    private static final String FILIACAO2 = "Marcos Pereira";

    private static final String EMAIL = "ana@gmail.com";

    private static final String CELULAR = "(12)92345-6789";

    private static final String TELEFONE_FIXO = "(12)12345-6789";

    private static final String NATURALIDADE = "Campo Grande/MS";

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

    private static final Long TIT_ID = 1L;

    private static final String TIT_INSTITUICAO = "PUC";

    private static final String TIT_CURSO = "Desenvolvimento web";

    private static final Integer TIT_ANO_CONCLUSAO = 2021;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private CandidatoRepository candidatoRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Candidato candidato;

    public static Candidato criarEntidade(EntityManager em) {
        Candidato candidato = new Candidato();
        candidato.setId(ID);
        candidato.setEmailUsuario(EMAIL_USUARIO);
        candidato.setNomeCompleto(NOME);
        candidato.setCpf(CPF);
        candidato.setFiliacao1(FILIACAO1);
        candidato.setFiliacao2(FILIACAO2);
        candidato.setEmail(EMAIL);
        candidato.setCelular(CELULAR);
        candidato.setTelefoneFixo(TELEFONE_FIXO);
        candidato.setNaturalidade(NATURALIDADE);

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
        titulo.setId(TIT_ID);
        titulo.setInstituicaoEnsino(TIT_INSTITUICAO);
        titulo.setAnoConclusao(TIT_ANO_CONCLUSAO);
        titulo.setTituloCurso(TIT_CURSO);
        Set<Titulo> titulos = new HashSet<>();
        titulos.add(titulo);

        educacao.setTitulos(titulos);
        candidato.setEducacao(educacao);
        return candidato;
    }

    @BeforeEach
    public void setup() {
        candidato = criarEntidade(em);
    }

    @Test
    @Transactional
    void salvarDadosPessoais() throws Exception {
        int registrosBanco = candidatoRepository.findAll().size();
        CandidatoDto candidatoDto = new CandidatoDto().candidatoToCandidatoDto(candidato);

        mockMvc.perform(post("/api/v1/candidatos").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(candidatoDto)))
                .andExpect(status().isCreated());

        List<Candidato> candidatoList = candidatoRepository.findAll();
        assertThat(candidatoList).hasSize(registrosBanco + 1);
        Candidato testCandidato = candidatoList.get(candidatoList.size() - 1);
        assertThat(testCandidato.getId()).isEqualTo(ID);
    }

    @Test
    @Transactional
    void carregarDadosPessoais() throws Exception {
        candidatoRepository.saveAndFlush(candidato);
        // Dados pessoais é o DTO que retorna para o client.
        mockMvc.perform(get("/api/v1/candidatos/{id}", candidato.getId().longValue()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.dadosPessoais.id").value(candidato.getId().longValue()))
                .andExpect(jsonPath("$.dadosPessoais.emailUsuario").value((EMAIL_USUARIO)))
                .andExpect(jsonPath("$.dadosPessoais.nomeCompleto").value((NOME)))
                .andExpect(jsonPath("$.dadosPessoais.cpf").value((CPF)))
                .andExpect(jsonPath("$.dadosPessoais.filiacao1").value((FILIACAO1)))
                .andExpect(jsonPath("$.dadosPessoais.filiacao2").value((FILIACAO2)))
                .andExpect(jsonPath("$.dadosPessoais.email").value((EMAIL)))
                .andExpect(jsonPath("$.dadosPessoais.celular").value((CELULAR)))
                .andExpect(jsonPath("$.dadosPessoais.telefoneFixo").value((TELEFONE_FIXO)))
                .andExpect(jsonPath("$.dadosPessoais.naturalidade").value((NATURALIDADE)));
    }

    @Test
    @Transactional
    @DisplayName("Relatório de candidato")
    void relatorioDemanda() throws Exception {
        candidatoRepository.saveAndFlush(candidato);

        mockMvc.perform(get("/api/v1/candidatos/relatorio?email={id}", candidato.getEmailUsuario()))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_PDF_VALUE))
                .andExpect(header().string("Content-Disposition", "inline; filename=candidato.pdf"));
    }

    @Test
    @Transactional
    void carregarDadosPessoaisPorEmail() throws Exception {
        candidatoRepository.saveAndFlush(candidato);

        mockMvc.perform(get("/api/v1/candidatos?email={email}", candidato.getEmailUsuario())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(content().contentType(MediaType.APPLICATION_JSON_VALUE))
                .andExpect(jsonPath("$.dadosPessoais.id").value(candidato.getId().longValue()))
                .andExpect(jsonPath("$.dadosPessoais.emailUsuario").value((EMAIL_USUARIO)))
                .andExpect(jsonPath("$.dadosPessoais.nomeCompleto").value((NOME)))
                .andExpect(jsonPath("$.dadosPessoais.cpf").value((CPF)))
                .andExpect(jsonPath("$.dadosPessoais.filiacao1").value((FILIACAO1)))
                .andExpect(jsonPath("$.dadosPessoais.filiacao2").value((FILIACAO2)))
                .andExpect(jsonPath("$.dadosPessoais.email").value((EMAIL)))
                .andExpect(jsonPath("$.dadosPessoais.celular").value((CELULAR)))
                .andExpect(jsonPath("$.dadosPessoais.telefoneFixo").value((TELEFONE_FIXO)))
                .andExpect(jsonPath("$.dadosPessoais.naturalidade").value((NATURALIDADE)));
    }

    @Test
    @Transactional
    void carregarDadosPessoaisPorEmailInexistente() throws Exception {
        candidatoRepository.saveAndFlush(candidato);

        mockMvc.perform(get("/api/v1/candidatos?email={email}", "email@gmail.com")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    void editarCandidato() throws Exception {
        candidatoRepository.saveAndFlush(candidato);

        int registrosBanco = candidatoRepository.findAll().size();

        Optional<Candidato> updateCandidato = candidatoRepository.findById(candidato.getId());

        em.detach(updateCandidato.get());
        updateCandidato.get().setNomeCompleto("Maria Silva");
        CandidatoDto candidatoDtoAtualizado = new CandidatoDto().candidatoToCandidatoDto(updateCandidato.get());

        mockMvc.perform(put("/api/v1/candidatos").with(csrf())
                .contentType(MediaType.APPLICATION_JSON)
                .content(mapper.writeValueAsBytes(candidatoDtoAtualizado)))
                .andExpect(status().isOk());

        List<Candidato> listaCandidatos = candidatoRepository.findAll();
        assertThat(listaCandidatos).hasSize(registrosBanco);
        Candidato testCandidato = listaCandidatos.get(listaCandidatos.size() - 1);
        assertThat(testCandidato.getNomeCompleto()).isEqualTo("Maria Silva");
    }
}
