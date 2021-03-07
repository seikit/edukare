package edukare.processoseletivo.web.rest;

import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.interfaces.ISeriesGrafico;
import edukare.processoseletivo.services.ProfessorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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
}
