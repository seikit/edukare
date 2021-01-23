package edukare.candidato.web.rest;

import edukare.candidato.domain.DadosCandidato;
import edukare.candidato.services.DadosCandidatoService;
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
public class DadosCandidatoResource {

    private final Logger log = LoggerFactory.getLogger(DadosCandidato.class);

    @Autowired
    private DadosCandidatoService dadosCandidatoService;

    @PostMapping("/dados-pessoais")
    public ResponseEntity<DadosCandidato> salvar(@RequestBody DadosCandidato dadosCandidato) throws URISyntaxException {
        log.debug("REST para salvar dados pessoais do candidato");

        DadosCandidato dados = dadosCandidatoService.save(dadosCandidato);
        return ResponseEntity
                .created(new URI("/api/dados-pessoais/"))
                .body(dadosCandidato);
    }
}
