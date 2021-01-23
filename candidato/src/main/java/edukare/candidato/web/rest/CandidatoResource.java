package edukare.candidato.web.rest;

import edukare.candidato.domain.Candidato;
import edukare.candidato.services.CandidatoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.net.URISyntaxException;

@RestController
@RequestMapping("/api")
public class CandidatoResource {

    private final Logger log = LoggerFactory.getLogger(Candidato.class);

    @Autowired
    private CandidatoService candidatoService;

    @PostMapping("/dados-pessoais")
    public ResponseEntity<Candidato> salvarDadosPessoais(@RequestBody Candidato candidato) throws URISyntaxException {
        log.debug("REST para salvar o dados pessoais do candidato");

        Candidato c = candidatoService.save(candidato);
        return ResponseEntity
                .created(new URI("/api/candidato/"+c))
                .body(c);
    }
}
