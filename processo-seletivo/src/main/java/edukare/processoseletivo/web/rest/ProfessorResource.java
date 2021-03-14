package edukare.processoseletivo.web.rest;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.interfaces.ISeriesGrafico;
import edukare.processoseletivo.relatorios.RelatorioProcessos;
import edukare.processoseletivo.relatorios.RelatorioProfessor;
import edukare.processoseletivo.services.ProfessorService;
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
import java.util.List;

@RestController
@RequestMapping("/api/v1/professores")
public class ProfessorResource {

    private final Logger log = LoggerFactory.getLogger(ProfessorResource.class);

    @Autowired
    private ProfessorService professorService;

    @PostMapping
    public ResponseEntity<List<Professor>> efetivarCandidatosEmProfessores(@RequestBody List<Professor> professores, @RequestHeader("Authorization") String token) {
        log.debug("REST para efetivar candidatos em professores");
        return ResponseEntity.ok(this.professorService.efetivarEmProfessor(professores, token));
    }

    @GetMapping
    public ResponseEntity<List<Professor>> carregarProfessores() {
        log.debug("REST para carregar todos professores");
        return ResponseEntity.ok(this.professorService.carregarTodosProfessores());
    }

    @GetMapping("/grafico/efetivados")
    public ResponseEntity<List<ISeriesGrafico>> carregarSeriesCandidatosEfetivados() {
        log.debug("REST para carregar series de candidatos efetivados em professores");
        return ResponseEntity.ok(this.professorService.carregarSeriesCandidatosEfetivados());
    }

    @GetMapping("/grafico/efetivados-encaminhados")
    public ResponseEntity<List<ISeriesGrafico>> carregarSeriesProfessoresEncaminhados() {
        log.debug("REST para carregar series de professores encaminhados");
        return ResponseEntity.ok(this.professorService.carregarSeriesProfessoresEncaminhados());
    }

    @PostMapping("/encaminhar")
    public ResponseEntity<List<Professor>> encaminharProfessores(@RequestBody List<Professor> professores) {
        log.debug("REST para atualizar vários professores");
        return ResponseEntity.ok(this.professorService.encaminharProfessores(professores));
    }

    @GetMapping(value = "/relatorio", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity carregarDadosRelatorioProfessor() throws IOException {
        List<Professor> professores = this.professorService.carregarTodosProfessores();
        if(!professores.isEmpty()) {
            ByteArrayInputStream bis = RelatorioProfessor.gerarRelatorio(professores);

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "inline; filename=professor.pdf");

            return ResponseEntity
                    .ok()
                    .headers(headers)
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(new InputStreamResource(bis));
        }
        return ResponseEntity.notFound().build();
    }
}
