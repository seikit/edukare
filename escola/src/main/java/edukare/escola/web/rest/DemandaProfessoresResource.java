package edukare.escola.web.rest;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.interfaces.IDemandaGrafico;
import edukare.escola.relatorios.RelatorioDemanda;
import edukare.escola.services.DemandaProfessoresService;
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
import java.util.List;
import java.util.Optional;
import java.util.Set;

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

    @GetMapping("/grafico")
    public ResponseEntity<List<IDemandaGrafico>> carregarDadosGraficoPizza() {
        log.debug("REST para carregar demandas para montar o gráfico de pizza");
        return ResponseEntity.ok(this.demandaProfessoresService.carregarDadosDemandasGrafico());
    }

    @GetMapping("/grafico/disciplinas")
    public ResponseEntity<List<IDemandaGrafico>> carregarDemandasPorDisciplina() {
        log.debug("REST para carregar demandas por disciplina");
        return ResponseEntity.ok(this.demandaProfessoresService.carregarDemandasPorDisciplina());
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

    @GetMapping("/escola/{id}")
    public ResponseEntity<Set<DemandaProfessores>> carregarDemandasPorEscolaId(@PathVariable Long id) {
        log.debug("REST para carregar demandas por id da escola");
        Set<DemandaProfessores> demandas = this.demandaProfessoresService.carregarDemandasPorEscolaId(id);
        if(demandas.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(demandas);
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

    @GetMapping(value = "/relatorio", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity relatorioDemanda(@RequestParam Long escolaId) throws IOException {
        Set<DemandaProfessores> damandas = this.demandaProfessoresService.carregarDemandasPorEscolaId(escolaId);

        ByteArrayInputStream bis = RelatorioDemanda.relatorioDemanda(damandas);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "inline; filename=demanda.pdf");

        return ResponseEntity
                .ok()
                .headers(headers)
                .contentType(MediaType.APPLICATION_PDF)
                .body(new InputStreamResource(bis));
    }
}
