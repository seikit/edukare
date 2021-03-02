package edukare.escola.services;

import edukare.escola.domain.Usuario;
import edukare.escola.repository.UsuarioEscolaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UsuarioEscolaService {
    private final Logger log = LoggerFactory.getLogger(Usuario.class);

    @Autowired
    private UsuarioEscolaRepository usuarioEscolaRepository;

    public Optional<Usuario> carregarUsuarioPorEmail(String email) {
        return this.usuarioEscolaRepository.findUsuarioEscolaByEmail(email);
    }
}
