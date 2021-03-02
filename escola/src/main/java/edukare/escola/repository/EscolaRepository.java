package edukare.escola.repository;

import edukare.escola.domain.Escola;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EscolaRepository extends JpaRepository<Escola, Long> {

    Optional<Escola> findEscolaByUsuarioEscola_Email(String email);

}
