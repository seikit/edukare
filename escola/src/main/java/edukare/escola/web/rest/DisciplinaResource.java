package edukare.escola.web.rest;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.domain.Disciplina;
import edukare.escola.services.DisciplinaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/disciplinas")
public class DisciplinaResource {

    private final Logger log = LoggerFactory.getLogger(DisciplinaResource.class);

    @Autowired
    private DisciplinaService disciplinaService;

    @PostMapping
    public ResponseEntity<Disciplina> salvarDisciplina(@RequestBody Disciplina disciplina) {
        log.debug("REST para cadastrar uma disciplina");
        return ResponseEntity.ok(this.disciplinaService.salvar(disciplina));
    }

    @GetMapping("/{id}")
    public ResponseEntity<Disciplina> carregarDisciplinaPorId(@PathVariable Long id) {
        log.debug("REST para carregar uma disciplina por Id");
        Optional<Disciplina> disciplina = this.disciplinaService.findById(id);
        if(disciplina.isPresent()) {
            return ResponseEntity.ok(disciplina.get());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping
    public ResponseEntity<List<Disciplina>> carregarTodasDisciplinas() {
        log.debug("REST para carregar todas as disciplinas");
        return ResponseEntity.ok(this.disciplinaService.carregarTodasDisciplinas());
    }

    @PutMapping
    public ResponseEntity<Disciplina> editarDisciplina(@RequestBody Disciplina disciplina) {
        log.debug("REST para editar uma disciplina");
        Optional<Disciplina> disc = this.disciplinaService.findById(disciplina.getId());
        if(disc.isPresent()) {
            return ResponseEntity.ok(this.disciplinaService.editar(disciplina));
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletarDisciplina(@PathVariable Long id) {
        log.debug("REST para deletar uma disciplina");
        Optional<Disciplina> disc = this.disciplinaService.findById(id);
        if(disc.isPresent()) {
            this.disciplinaService.deletarPorId(id);
            return ResponseEntity.ok().build();
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/ativas")
    public ResponseEntity<List<Disciplina>> carregarTodasDisciplinasAtivas() {
        log.debug("REST para carregar todas as disciplinas ativas");
        return ResponseEntity.ok(this.disciplinaService.carregarTodasDisciplinasAtivas());
    }
}
