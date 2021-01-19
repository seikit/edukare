package edukare.candidato.repository;

import edukare.candidato.domain.DadosCandidato;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DadosCandidatoRepository extends JpaRepository<DadosCandidato, Long> {
}
