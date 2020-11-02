package edukare.processoseletivo.web.rest;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.services.ProcessoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@RestController
@RequestMapping("/api")
public class ProcessoSeletivoResource {

    private final Logger log = LoggerFactory.getLogger(ProcessoSeletivo.class);

    @Autowired
    private ProcessoService processoService;

    @PostMapping("/processo")
    public ResponseEntity<ProcessoSeletivo> criarProcesso(@RequestBody ProcessoSeletivo processoSeletivo) throws URISyntaxException {
        log.debug("REST para criar um novo processo");
        if (processoSeletivo.getId() != null) {
            return ResponseEntity.badRequest().body(new ProcessoSeletivo());
        }

        ProcessoSeletivo processo = processoService.save(processoSeletivo);
        return ResponseEntity
                .created(new URI("/api/processo-seletivo/"+processo.getId()))
                .body(processo);
    }

    @GetMapping("/processos")
    public ResponseEntity<List<ProcessoSeletivo>> carregarTodosProcessos(Pageable pageable, UriComponentsBuilder uri) {
        log.debug("REST para carregar todos os processos.");
        Page<ProcessoSeletivo> page = processoService.findAll(pageable);
        return ResponseEntity
                .ok()
                .body(page.getContent());
    }
}
