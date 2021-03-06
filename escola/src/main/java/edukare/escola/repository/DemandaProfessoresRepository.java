package edukare.escola.repository;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.interfaces.IDemandaGrafico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface DemandaProfessoresRepository extends JpaRepository<DemandaProfessores, Long> {

    Set<DemandaProfessores> findDemandaProfessoresByEscolaId(Long id);

    @Query(value = " select escola as name, escola_id, sum(quantidade) as y from demanda_professores " +
            "group by escola_id, escola", nativeQuery = true)
    List<IDemandaGrafico> carregarDadosDemandasGrafico();
}
