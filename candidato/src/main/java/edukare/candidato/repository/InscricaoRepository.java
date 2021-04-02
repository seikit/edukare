package edukare.candidato.repository;

import edukare.candidato.domain.Inscricao;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.interfaces.ISeriesGrafico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Repository
public interface InscricaoRepository extends JpaRepository<Inscricao, Long> {

    Set<Inscricao> findAllByEmailUsuario(String email);
    Optional<Inscricao> findInscricaoByEmailUsuarioAndProcessoSeletivoIdAndSituacaoEquals(String email, Long processoSeletivoId, Situacao situacao);
    Set<Inscricao> findAllBySituacaoAndProcessoSeletivoId(Situacao situacao, Long id);

    @Query(value = "select processo_seletivo_id as name, count(id) as y from inscricao " +
            "group by processo_seletivo_id", nativeQuery = true)
    List<ISeriesGrafico> carregarSeriesGraficoInscricoes();

    Integer countAllByDataInscricaoBetweenAndSituacaoIn(LocalDateTime inicio, LocalDateTime fim, List<Situacao> situacoes);
}
