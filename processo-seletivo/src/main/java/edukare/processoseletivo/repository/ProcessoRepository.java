package edukare.processoseletivo.repository;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.enumeration.Situacao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Repository
public interface ProcessoRepository extends JpaRepository<ProcessoSeletivo, Long> {

    Set<ProcessoSeletivo> findAllBySituacao(Situacao situacao);
    List<ProcessoSeletivo> findAllBySituacaoAndAno(Situacao situacao, Integer ano);
    Integer countAllBySituacaoAndAno(Situacao situacao, Integer ano);

}
