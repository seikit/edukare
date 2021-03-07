package edukare.candidato.web.rest;

import edukare.candidato.domain.Candidato;
import edukare.candidato.dto.CandidatoDto;
import edukare.candidato.relatorios.RelatorioCandidato;
import edukare.candidato.services.CandidatoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/api/v1/candidatos")
public class CandidatoResource {

    private final Logger log = LoggerFactory.getLogger(Candidato.class);

    @Autowired
    private CandidatoService candidatoService;

    @PostMapping
    public ResponseEntity<Candidato> salvarDadosPessoais(@RequestBody CandidatoDto candidatoDto) throws URISyntaxException {
        log.debug("REST para salvar o dados pessoais do candidato");
        Candidato can = candidatoService.save(candidatoDto.candidatoDtoToCandidato(candidatoDto));
        return ResponseEntity
            .created(new URI("/candidatos/" + can.getId()))
            .body(can);
    }

    @GetMapping("/{id}")
    public ResponseEntity<CandidatoDto> carregarDadosPessoais(@PathVariable Long id) {
        log.debug("REST para carregar o candidato por id");
        Optional<Candidato> optionalCandidato = candidatoService.findById(id);
        if (optionalCandidato.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(new CandidatoDto().candidatoToCandidatoDto(optionalCandidato.get()));
    }

    @GetMapping(value = "/relatorio", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity relatorioDemanda(@RequestParam String email) throws IOException {
        Optional<Candidato> candidato = this.candidatoService.findByEmail(email);
        if(candidato.isPresent()) {
            ByteArrayInputStream bis = RelatorioCandidato.relatorioCandidato(candidato.get());

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "inline; filename=candidato.pdf");

            return ResponseEntity
                    .ok()
                    .headers(headers)
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(new InputStreamResource(bis));
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping()
    public ResponseEntity<CandidatoDto> carregarDadosPessoaisPorEmail(@RequestParam String email) {
        log.debug("REST para carregar dados do candidato por email");
        Optional<Candidato> can = candidatoService.findByEmail(email);
        if (can.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(new CandidatoDto().candidatoToCandidatoDto(can.get()));
    }

    @PutMapping
    public ResponseEntity<Candidato> editarCandidato(@RequestBody CandidatoDto candidatoDto) throws URISyntaxException {
        log.debug("REST para editar os dados do candidato");
        Candidato candidato = new CandidatoDto().candidatoDtoToCandidato(candidatoDto);
        if (candidatoService.findById(candidato.getId()).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Candidato can = candidatoService.editar(candidato);
        return ResponseEntity.ok(can);
    }
}
