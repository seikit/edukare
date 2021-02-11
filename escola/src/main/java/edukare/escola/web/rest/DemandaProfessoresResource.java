package edukare.escola.web.rest;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.services.DemandaProfessoresService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/demandas")
public class DemandaProfessoresResource {

    private final Logger log = LoggerFactory.getLogger(DemandaProfessores.class);

    @Autowired
    private DemandaProfessoresService demandaProfessoresService;

    @GetMapping
    public ResponseEntity<List<DemandaProfessores>> carregarTodasDemandas() {
        log.debug("REST para carregar todas as demandas");
        return ResponseEntity.ok(this.demandaProfessoresService.carregarTodasDemandas());
    }

    @GetMapping("/{id}")
    public ResponseEntity<DemandaProfessores> carregarDemandaPorId(@PathVariable Long id) {
        log.debug("REST para carregar uma demanda.");
        Optional<DemandaProfessores> demanda = this.demandaProfessoresService.carregarDemandaPorId(id);
        if (demanda.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(demanda.get());
    }

    @PostMapping
    public ResponseEntity<DemandaProfessores> salvarDemanda(@RequestBody DemandaProfessores demanda) {
        log.debug("REST para salvar uma demanda");
        DemandaProfessores demandaProfessores = this.demandaProfessoresService.salvar(demanda);

        return ResponseEntity
                .created(URI.create("/demandas/" + demandaProfessores.getId()))
                .body(demandaProfessores);
    }

    @PutMapping
    public ResponseEntity<DemandaProfessores> editarDemanda(@RequestBody DemandaProfessores demandaProfessores){
        log.debug("REST para editar uma demanda");
        Optional<DemandaProfessores> demanda = this.demandaProfessoresService.carregarDemandaPorId(demandaProfessores.getId());

        if (demanda.isPresent()) {
            return ResponseEntity.ok(this.demandaProfessoresService.salvar(demandaProfessores));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<DemandaProfessores> deletarDemanda(@PathVariable Long id) {
        log.debug("REST para deletar uma demanda");
        Optional<DemandaProfessores> demanda = this.demandaProfessoresService.carregarDemandaPorId(id);

        if (demanda.isPresent()) {
            this.demandaProfessoresService.deletar(id);
            return ResponseEntity.ok().build();
        }

        return ResponseEntity.notFound().build();
    }
}
