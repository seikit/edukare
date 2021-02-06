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
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/api/v1/processos")
public class ProcessoSeletivoResource {

    private final Logger log = LoggerFactory.getLogger(ProcessoSeletivo.class);

    @Autowired
    private ProcessoService processoService;

    @PostMapping
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

    @PutMapping
    public ResponseEntity<ProcessoSeletivo> atualizarProcesso(@RequestBody ProcessoSeletivo processoSeletivo) throws URISyntaxException {
        log.debug("REST para atualizar um processo seletivo");
        if (processoSeletivo.getId() != null) {
            Boolean temProcessoSeletivo = processoService.findById(processoSeletivo.getId()).isPresent();
            if (temProcessoSeletivo) {
                return ResponseEntity.ok().body(this.processoService.atualizar(processoSeletivo));
            }
        }
        return ResponseEntity
                .badRequest()
                .build();
    }

    @GetMapping
    public ResponseEntity<List<ProcessoSeletivo>> carregarTodosProcessos(Pageable pageable, UriComponentsBuilder uri) {
        log.debug("REST para carregar todos os processos.");
        Page<ProcessoSeletivo> page = processoService.findAll(pageable);
        return ResponseEntity
                .ok()
                .body(page.getContent());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletarProcesso(@PathVariable(value = "id") Long id) {
        log.debug("REST para deletar um processo seletivo");
        Boolean isDeletado = this.processoService.deletar(id);
        if (!isDeletado) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().build();
    }

    @GetMapping("/abertos")
    public ResponseEntity<Set<ProcessoSeletivo>> carregarProcessosInscricoesAbertas() {
        log.debug("REST para carregar processos abertos");
        Set<ProcessoSeletivo> processos = this.processoService.carregarProcessosInscricoesAbertas();
        if (!processos.isEmpty()) {
            return ResponseEntity.ok(processos);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/{id}")
    public ResponseEntity<ProcessoSeletivo> carregarProcessoPorId(@PathVariable Long id) {
        log.debug("REST para carregar um processo seletivo por ID");
        Optional<ProcessoSeletivo> processo = this.processoService.findById(id);
        if (processo.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(processo.get());
    }


}
