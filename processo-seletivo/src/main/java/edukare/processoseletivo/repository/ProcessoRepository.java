package edukare.processoseletivo.repository;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Set;

@Repository
public interface ProcessoRepository extends JpaRepository<ProcessoSeletivo, Long> {

    Set<ProcessoSeletivo> findProcessoSeletivoByDtInicioInscricaoLessThanAndDtEncerramentoInscricaoGreaterThan(LocalDate hoje, LocalDate hj);

}
