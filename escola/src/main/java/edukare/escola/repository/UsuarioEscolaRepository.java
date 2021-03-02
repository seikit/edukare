package edukare.escola.repository;

import edukare.escola.domain.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UsuarioEscolaRepository extends JpaRepository<Usuario, Long> {

    Optional<Usuario> findUsuarioEscolaByEmail(String email);

}
