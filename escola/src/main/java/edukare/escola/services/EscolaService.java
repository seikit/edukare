package edukare.escola.services;

import edukare.escola.domain.Escola;
import edukare.escola.repository.EscolaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EscolaService {
    private final Logger log = LoggerFactory.getLogger(EscolaService.class);

    @Autowired
    private EscolaRepository escolaRepository;

    public Optional<Escola> carregarEscolaPorEmailUsuario(String email) {
        return this.escolaRepository.findEscolaByUsuarioEscola_Email(email);
    }

    public List<Escola> carregarTodasEscolas(){
        return this.escolaRepository.findAll();
    }
}
