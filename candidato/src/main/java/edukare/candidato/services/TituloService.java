package edukare.candidato.services;

import edukare.candidato.domain.Titulo;
import edukare.candidato.repository.TituloRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class TituloService {

    @Autowired
    TituloRepository tituloRepository;

    public void excluirPorId(Long id) {
       tituloRepository.deleteById(id);
    }

    public Optional<Titulo> carregarTituloPorId(Long id) {
        return tituloRepository.findById(id);
    }
}
