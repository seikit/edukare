package edukare.candidato.web.rest;

import edukare.candidato.domain.Titulo;
import edukare.candidato.services.TituloService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/api/v1/titulos")
public class TituloResource {

    @Autowired
    private TituloService tituloService;

    @DeleteMapping("/{id}")
    public ResponseEntity excluirTitulo(@PathVariable Long id) {
        if (id != null) {
            Optional<Titulo> titulo = tituloService.carregarTituloPorId(id);
            if (titulo.isPresent()) {
                tituloService.excluirPorId(id);
                return ResponseEntity.ok().build();
            }
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.badRequest().build();
    }
}
