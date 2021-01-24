package edukare.candidato.repository;

import edukare.candidato.domain.Inscricao;
import edukare.candidato.enumeration.Situacao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.Set;

@Repository
public interface InscricaoRepository extends JpaRepository<Inscricao, Long> {

    Set<Inscricao> findAllByCandidatoId(Long id);
    Optional<Inscricao> findInscricaoByCandidatoIdAndProcessoSeletivoIdAndSituacaoEquals(Long candidatoId, Long processoSeletivoId, Situacao situacao);
}
