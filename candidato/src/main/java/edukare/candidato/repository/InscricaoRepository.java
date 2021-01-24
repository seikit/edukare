package edukare.candidato.repository;

import edukare.candidato.domain.Inscricao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface InscricaoRepository extends JpaRepository<Inscricao, Long> {

    Set<Inscricao> findAllByCandidatoId(Long id);
}
