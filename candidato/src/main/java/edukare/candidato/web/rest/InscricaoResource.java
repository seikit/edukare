package edukare.candidato.web.rest;

import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Inscricao;
import edukare.candidato.dto.CandidatoDto;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.services.CandidatoService;
import edukare.candidato.services.InscricaoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/api/v1/inscricoes")
public class InscricaoResource {

    private final Logger log = LoggerFactory.getLogger(Inscricao.class);

    @Autowired
    private InscricaoService inscricaoService;

    @Autowired
    private CandidatoService candidatoService;

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

    @GetMapping("/candidato/{id}")
    private ResponseEntity<Set<Inscricao>> carregarTodasInscricoesDoCandidato(@PathVariable Long id) {
        log.debug("REST para carregar todas as inscrições de um candidato");

        Optional<Candidato> can = candidatoService.findById(id);
        if (can.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Set<Inscricao> inscricoes = inscricaoService.carregarTodasInscricoesDoCandidato(id);
        if (!inscricoes.isEmpty()) {
            return ResponseEntity.ok(inscricoes);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/{id}")
    private ResponseEntity<Inscricao> carregarInscricaoPorId(@PathVariable Long id) {
        log.debug("REST para carregar uma inscricão por ID");

        Optional<Inscricao> insc = inscricaoService.carregarInscricaoPorId(id);
        if (insc.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(insc.get());
    }

    @GetMapping("/ativas/candidato")
    private ResponseEntity<Inscricao> carregarInscricaoAtivaNoProcesso(@RequestParam Long candidatoId, @RequestParam Long processoSeletivoId) {
        log.debug("REST para carregar inscrições ativas do candidato no processo");

        Optional<Inscricao> insc = inscricaoService.carregarCandidatoJaTemInscricaoAtivaNoProcesso(candidatoId, processoSeletivoId);
        if (insc.isPresent()) {
            return ResponseEntity.ok(insc.get());
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletarInscricao(@PathVariable Long id) {
        log.debug("REST para deletar uma inscricao");
        if (inscricaoService.carregarInscricaoPorId(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        inscricaoService.deletarInscricaoPorId(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping
    public ResponseEntity<Inscricao> cancelarInscricao(@RequestBody Inscricao inscricao) {
        log.debug("REST para cancelar uma inscrição");
        if (inscricaoService.findById(inscricao.getId()).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Optional<Inscricao> insc = inscricaoService.cancelar(inscricao);
        if (insc.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(insc.get());
    }
}
