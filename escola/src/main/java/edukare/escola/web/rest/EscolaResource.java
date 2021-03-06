package edukare.escola.web.rest;

import edukare.escola.domain.Escola;
import edukare.escola.services.EscolaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/escolas")
public class EscolaResource {

    private final Logger log = LoggerFactory.getLogger(EscolaResource.class);

    @Autowired
    private EscolaService escolaService;

    @GetMapping
    public ResponseEntity<Escola> carregarUsuarioPorEmail(@RequestParam String email) {
        log.debug("REST para carregar usuario por email");

        Optional<Escola> escola = this.escolaService.carregarEscolaPorEmailUsuario(email);
        if (escola.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(escola.get());
    }

    @GetMapping("/todas")
    public ResponseEntity<List<Escola>> carregarTodasEscola() {
        log.debug("REST para carregar todas escolas");
        return ResponseEntity.ok(this.escolaService.carregarTodasEscolas());
    }
}
