package edukare.escola.web.rest;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.domain.Disciplina;
import edukare.escola.services.DemandaProfessoresService;
import edukare.escola.services.DisciplinaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/v1/disciplinas")
public class DisciplinaResource {

    private final Logger log = LoggerFactory.getLogger(DemandaProfessores.class);

    @Autowired
    private DisciplinaService disciplinaService;

    @GetMapping
    public ResponseEntity<List<Disciplina>> carregarTodasDisciplinasAtivas() {
        log.debug("REST para carregar todas as demandas");
        return ResponseEntity.ok(this.disciplinaService.carregarTodasDisciplinas());
    }
}
