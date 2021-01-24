package edukare.candidato.services;

import edukare.candidato.domain.Candidato;
import edukare.candidato.repository.CandidatoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class CandidatoService {
    private final Logger log = LoggerFactory.getLogger(CandidatoService.class);

    @Autowired
    private CandidatoRepository candidatoRepository;

    public Candidato save(Candidato candidato) {
        log.debug("Request para salvar dados pessoais do candidato");
            return candidatoRepository.save(candidato);
    }

    public Optional<Candidato> findById(Long id) {
        log.debug("Request para carregar o candidato por id");
        return candidatoRepository.findById(id);
    }

    public Candidato editar(Candidato candidato) {
        log.debug("Request para editar um candidato");
        return this.save(candidato);
    }
}
