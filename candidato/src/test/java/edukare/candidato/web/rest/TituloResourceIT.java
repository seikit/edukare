package edukare.candidato.web.rest;

import com.fasterxml.jackson.databind.ObjectMapper;
import edukare.candidato.CandidatoApplication;
import edukare.candidato.domain.*;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.repository.CandidatoRepository;
import edukare.candidato.repository.InscricaoRepository;
import edukare.candidato.repository.TituloRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.web.servlet.MockMvc;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest(classes = {CandidatoApplication.class})
@AutoConfigureMockMvc
@WithMockUser
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_EACH_TEST_METHOD)
class TituloResourceIT {

    private static final Long ID = 1L;

    private static final String INSTITUICAO_ENSINO = "PUC";

    private static final String TITULO_CURSO = "Desenvolvimento web";

    private static final Integer ANO_CONCLUSAO = 2021;

    @Autowired
    private ObjectMapper mapper;

    @Autowired
    private TituloRepository tituloRepository;

    @Autowired
    private EntityManager em;

    @Autowired
    private MockMvc mockMvc;

    private Titulo titulo;

    public static Titulo criarEntidade(EntityManager em) {
        Titulo titulo = new Titulo();
        titulo.setId(ID);
        titulo.setInstituicaoEnsino(INSTITUICAO_ENSINO);
        titulo.setTituloCurso(TITULO_CURSO);
        titulo.setAnoConclusao(ANO_CONCLUSAO);
        return titulo;
    }

    @BeforeEach
    public void setup() {
        titulo = criarEntidade(em);
    }

    @Test
    void excluirTitulo() throws Exception {
        tituloRepository.saveAndFlush(titulo);

        int registrosAntesDeDeletar = tituloRepository.findAll().size();

        mockMvc.perform(delete("/api/v1/titulos/{id}", titulo.getId()).with(csrf())
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk());

        List<Titulo> listTitulo = tituloRepository.findAll();
        assertThat(listTitulo).hasSize(registrosAntesDeDeletar - 1);
    }
}
