package edukare.processoseletivo.repository;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProcessoRepository extends JpaRepository<ProcessoSeletivo, Long> {

}
