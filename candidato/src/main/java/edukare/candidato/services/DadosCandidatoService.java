package edukare.candidato.services;

import edukare.candidato.domain.DadosCandidato;
import edukare.candidato.repository.DadosCandidatoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class DadosCandidatoService {
    private final Logger log = LoggerFactory.getLogger(DadosCandidatoService.class);

    @Autowired
    private DadosCandidatoRepository dadosCandidatoRepository;

    public DadosCandidato save(DadosCandidato dadosCandidato) {
        log.debug("Request para salvar dados pessoais do candidato");
        return dadosCandidatoRepository.save(dadosCandidato);

    }
}
