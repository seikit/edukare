package edukare.escola.services;

import edukare.escola.domain.Disciplina;
import edukare.escola.repository.DisciplinaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DisciplinaService {

    @Autowired
    DisciplinaRepository disciplinaRepository;

    public List<Disciplina> carregarTodasDisciplinas() {
        return this.disciplinaRepository.findAllByAtiva("S");
    }
}
