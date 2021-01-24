package edukare.candidato.web.rest;

import edukare.candidato.domain.Candidato;
import edukare.candidato.services.CandidatoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/candidatos")
public class CandidatoResource {

    private final Logger log = LoggerFactory.getLogger(Candidato.class);

    @Autowired
    private CandidatoService candidatoService;

    @PostMapping
    public ResponseEntity<Candidato> salvarDadosPessoais(@RequestBody Candidato candidato) throws URISyntaxException {
        log.debug("REST para salvar o dados pessoais do candidato");

        Candidato can = candidatoService.save(candidato);
        return ResponseEntity
                .created(new URI("/api/v1/candidatos/" + can.getId()))
                .body(can);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Candidato> carregarDadosPessoais(@PathVariable Long id) {
        log.debug("REST para carregar o candidato por id");
        Optional<Candidato> optionalCandidato = candidatoService.findById(id);
        if (optionalCandidato.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(optionalCandidato.get());
    }

    @PutMapping
    public ResponseEntity<Candidato> editarCandidato(@RequestBody Candidato candidato) throws URISyntaxException {
        log.debug("REST para editar os dados do candidato");
        if (candidatoService.findById(candidato.getId()).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Candidato can = candidatoService.editar(candidato);
        return ResponseEntity.ok(can);
    }
}
