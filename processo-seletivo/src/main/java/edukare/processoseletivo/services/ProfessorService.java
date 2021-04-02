package edukare.processoseletivo.services;

import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.dto.InscricaoDto;
import edukare.processoseletivo.enumeration.Situacao;
import edukare.processoseletivo.enumeration.SituacaoInscricao;
import edukare.processoseletivo.feignClients.*;
import edukare.processoseletivo.interfaces.ISeriesGrafico;
import edukare.processoseletivo.repository.ProfessorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ProfessorService {

    private final Logger log = LoggerFactory.getLogger(ProfessorService.class);

    @Autowired
    private ProfessorRepository professorRepository;

    @Autowired
    private CandidatoClient candidatoClient;

    public List<Professor> efetivarEmProfessor(List<Professor> professores, String token) {
        log.debug("Request para efetiva o candidato em professor");
        List<InscricaoDto> inscricoes = new ArrayList<>();
        for (Professor p: professores) {
            p.setDataEfetivacao(LocalDateTime.now());
            InscricaoDto i = new InscricaoDto(p.getInscricaoId(), SituacaoInscricao.PROCESSADA);
            inscricoes.add(i);
        }

        this.candidatoClient.atualizarSituacaoInscricao(inscricoes, token);

        return this.professorRepository.saveAll(professores);
    }

    public List<Professor> carregarTodosProfessores() {
        log.debug("Resquest para carregar todos os professores");
        return this.professorRepository.findAll();
    }

    public List<Professor> carregarTodosProfessoresDoProcesso(Long id) {
        log.debug("Request para carregar todos os professores de um processo");
        return this.professorRepository.findAllByProcessoSeletivoId(id);
    }

    public List<Professor> encaminharProfessores(List<Professor> professores) {
        log.debug("Request para encaminhar professores para escola.");
        List<Professor> prfAtualizar = new ArrayList<>();
        for (Professor professor : professores) {
            Optional<Professor> p = this.carregarProfessorPorId(professor.getId());
            if(p.isPresent()) {
                p.get().setEscolaEncaminhamento(professor.getEscolaEncaminhamento());
                p.get().setEscolaIdEncaminhamento(professor.getEscolaIdEncaminhamento());
                p.get().setEncaminhado(true);
                prfAtualizar.add(p.get());
            }
        }
        return this.professorRepository.saveAll(prfAtualizar);
    }

    public Optional<Professor> carregarProfessorPorId(Long id) {
        log.debug("Request para carregar um professor por id");
        return this.professorRepository.findById(id);
    }

    public List<ISeriesGrafico> carregarSeriesCandidatosEfetivados() {
        log.debug("Request para carregar series de candidatos efetivados em professores");
        LocalDateTime inicio = LocalDateTime.of(LocalDate.now().getYear(), Month.JANUARY, 1, 0,0);
        LocalDateTime fim = LocalDateTime.of(LocalDate.now().getYear(), Month.DECEMBER, Month.DECEMBER.maxLength(),23,59);

        return this.professorRepository.carregarSeriesCandidatosEfetivados(inicio, fim);
    }

    public List<ISeriesGrafico> carregarSeriesProfessoresEncaminhados() {
        log.debug("Request para carregar series de professores encaminhados");
        LocalDateTime inicio = LocalDateTime.of(LocalDate.now().getYear(), Month.JANUARY, 1, 0,0);
        LocalDateTime fim = LocalDateTime.of(LocalDate.now().getYear(), Month.DECEMBER, Month.DECEMBER.maxLength(),23,59);

        return this.professorRepository.carregarSeriesProfessoresEncaminhados(inicio, fim);
    }

    public Integer carregarQuantitativoAprovadosNoAno() {
        log.debug("Request para carregar o quantitativo de aprovados no ano corrente");
        LocalDateTime inicio = LocalDateTime.of(LocalDate.now().getYear(), Month.JANUARY, 1, 0,0);
        LocalDateTime fim = LocalDateTime.of(LocalDate.now().getYear(), Month.DECEMBER, Month.DECEMBER.maxLength(),23,59);
        return this.professorRepository.countAllByDataEfetivacaoBetween(inicio, fim);
    }

    public Integer carregarQuantitativoAEncaminhadosNoAno() {
        log.debug("Request para carregar o quantitativo de encaminhados no ano corrente");
        LocalDateTime inicio = LocalDateTime.of(LocalDate.now().getYear(), Month.JANUARY, 1, 0,0);
        LocalDateTime fim = LocalDateTime.of(LocalDate.now().getYear(), Month.DECEMBER, Month.DECEMBER.maxLength(),23,59);
        return this.professorRepository.countAllByDataEfetivacaoBetweenAndEncaminhado(inicio, fim, true);
    }
}
