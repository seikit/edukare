package edukare.candidato.repository;

import edukare.candidato.domain.Candidato;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CandidatoRepository extends JpaRepository<Candidato, Long> {

    Optional<Candidato> findCandidatoByEmailUsuario(String email);
}
