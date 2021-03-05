package edukare.processoseletivo.web.rest;

import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.services.ProfessorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;

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
}
