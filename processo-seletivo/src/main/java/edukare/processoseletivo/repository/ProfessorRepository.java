package edukare.processoseletivo.repository;

import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.enumeration.Situacao;
import edukare.processoseletivo.interfaces.ISeriesGrafico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface ProfessorRepository extends JpaRepository<Professor, Long> {

    @Query(value = "select processo_seletivo_id, processo_seletivo_titulo as name, count(id) as y from professor " +
            "where data_efetivacao between :dtIncio and :dtFim " +
            "group by processo_seletivo_id, processo_seletivo_titulo", nativeQuery = true)
    List<ISeriesGrafico> carregarSeriesCandidatosEfetivados(@Param("dtIncio") LocalDateTime dtIncio, @Param("dtFim") LocalDateTime dtFim);

    @Query(value = "select p.escola_encaminhamento as name, count(p.id) as y from professor p " +
            "where p.data_efetivacao between :dtIncio and :dtFim " +
            "and p.encaminhado = true " +
            "group by p.escola_id_encaminhamento, p.escola_encaminhamento", nativeQuery = true)
    List<ISeriesGrafico> carregarSeriesProfessoresEncaminhados(@Param("dtIncio") LocalDateTime dtIncio, @Param("dtFim") LocalDateTime dtFim);


    List<Professor> findAllByProcessoSeletivoId(Long id);

    Integer countAllByDataEfetivacaoBetween(LocalDateTime dtIncio, LocalDateTime dtFim);
    Integer countAllByDataEfetivacaoBetweenAndEncaminhado(LocalDateTime dtIncio, LocalDateTime dtFim, Boolean encaminhado);
}
