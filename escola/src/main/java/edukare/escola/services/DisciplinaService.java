package edukare.escola.services;

import edukare.escola.domain.Disciplina;
import edukare.escola.repository.DisciplinaRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DisciplinaService {

    private final Logger log = LoggerFactory.getLogger(Disciplina.class);

    @Autowired
    DisciplinaRepository disciplinaRepository;

    public List<Disciplina> carregarTodasDisciplinas() {
        log.debug("Request para carregar todas as disciplinas");
        return this.disciplinaRepository.findAll();
    }

    public List<Disciplina> carregarTodasDisciplinasAtivas() {
        log.debug("Request para carregar todas as disciplinas ativas");
        return this.disciplinaRepository.findAllByAtiva("S");
    }

    public Disciplina salvar(Disciplina disciplina) {
        log.debug("Request para salvar uma disciplina");
        return this.disciplinaRepository.save(disciplina);
    }

    public Optional<Disciplina> findById(Long id) {
        log.debug("Request para carregar uma disciplina por id");
        return this.disciplinaRepository.findById(id);
    }

    public Disciplina editar(Disciplina disciplina) {
        log.debug("Request para editar uma disciplina");
        return this.salvar(disciplina);
    }

    public void deletarPorId(Long id) {
        log.debug("Request para deletar uma disciplina");
        this.disciplinaRepository.deleteById(id);
    }
}
