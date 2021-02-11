package edukare.escola.repository;

import edukare.escola.domain.DemandaProfessores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DemandaProfessoresRepository extends JpaRepository<DemandaProfessores, Long> {

}
