package edukare.candidato.repository;

import edukare.candidato.domain.Titulo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface TituloRepository extends JpaRepository<Titulo, Long> {



}
