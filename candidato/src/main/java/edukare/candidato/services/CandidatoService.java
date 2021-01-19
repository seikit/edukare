package edukare.candidato.services;

import edukare.candidato.domain.Candidato;
import edukare.candidato.repository.CandidatoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CandidatoService {
    private final Logger log = LoggerFactory.getLogger(CandidatoService.class);

    @Autowired
    private CandidatoRepository candidatoRepository;

    public Candidato save(Candidato candidato) {
        log.debug("Request para salvar dados pessoais do candidato");
        return candidatoRepository.save(candidato);
    }


}
