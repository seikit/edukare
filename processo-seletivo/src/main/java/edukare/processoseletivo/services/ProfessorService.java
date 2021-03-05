package edukare.processoseletivo.services;

import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.dto.InscricaoDto;
import edukare.processoseletivo.enumeration.SituacaoInscricao;
import edukare.processoseletivo.feignClients.*;
import edukare.processoseletivo.repository.ProfessorRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
            InscricaoDto i = new InscricaoDto(p.getInscricaoId(), SituacaoInscricao.PROCESSADA);
            inscricoes.add(i);
        }

        this.candidatoClient.atualizarSituacaoInscricao(inscricoes, token);

        return this.professorRepository.saveAll(professores);
    }

}
