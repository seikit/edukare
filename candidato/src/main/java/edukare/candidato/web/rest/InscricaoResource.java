package edukare.candidato.web.rest;

import edukare.candidato.domain.Inscricao;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.services.InscricaoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.URI;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/inscricoes")
public class InscricaoResource {

    private final Logger log = LoggerFactory.getLogger(Inscricao.class);

    @Autowired
    private InscricaoService inscricaoService;

    @PostMapping
    private ResponseEntity<Inscricao> inscreverCandidato(@RequestBody InscricaoDto inscricaoDto) {
        log.debug("REST para realizar uma inscrição");
        Optional<Inscricao> insc = this.inscricaoService.inscreverCandidato(inscricaoDto);

        if (insc.isPresent()) {
            return ResponseEntity
                    .created(URI.create("/candidatos/" + insc.get().getCandidatoId() + "/inscricoes/" + insc.get().getId()))
                    .body(insc.get());
        }
        return ResponseEntity.badRequest().build();
    }



}
