package edukare.escola.web.rest;

import edukare.escola.domain.Usuario;
import edukare.escola.services.UsuarioEscolaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/api/v1/usuarios-escola")
public class UsuarioEscolaResource {

    private final Logger log = LoggerFactory.getLogger(UsuarioEscolaResource.class);

    @Autowired
    private UsuarioEscolaService usuarioEscolaService;

    @GetMapping
    public ResponseEntity<Usuario> carregarUsuarioPorEmail(@RequestParam String email) {
        log.debug("REST para carregar usuario por email");

        Optional<Usuario> usuario = this.usuarioEscolaService.carregarUsuarioPorEmail(email );
        if (usuario.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(usuario.get());
    }
}
