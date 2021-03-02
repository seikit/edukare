package edukare.escola.repository;

import edukare.escola.domain.DemandaProfessores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface DemandaProfessoresRepository extends JpaRepository<DemandaProfessores, Long> {

    Set<DemandaProfessores> findDemandaProfessoresByEscolaId(Long id);

}
