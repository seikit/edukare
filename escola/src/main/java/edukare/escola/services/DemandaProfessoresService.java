package edukare.escola.services;

import edukare.escola.domain.DemandaProfessores;
import edukare.escola.interfaces.IDemandaGrafico;
import edukare.escola.repository.DemandaProfessoresRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
public class DemandaProfessoresService {
    private final Logger log = LoggerFactory.getLogger(DemandaProfessoresService.class);

    @Autowired
    DemandaProfessoresRepository demandaProfessoresRepository;

    public List<DemandaProfessores> carregarTodasDemandas() {
        return this.demandaProfessoresRepository.findAll();
    }

    public Optional<DemandaProfessores> carregarDemandaPorId(Long id) {
        return this.demandaProfessoresRepository.findById(id);
    }

    public DemandaProfessores salvar(DemandaProfessores demanda) {
        return this.demandaProfessoresRepository.save(demanda);
    }

    public void deletar(Long id) {
        this.demandaProfessoresRepository.deleteById(id);
    }


    public Set<DemandaProfessores> carregarDemandasPorEscolaId(Long id) {
        return this.demandaProfessoresRepository.findDemandaProfessoresByEscolaId(id);
    }

    public List<IDemandaGrafico> carregarDadosDemandasGrafico() {
        log.debug("Request para carregar dados para o gráfico de demandas por escola");
        return this.demandaProfessoresRepository.carregarDadosDemandasGrafico();
    }

    public List<IDemandaGrafico> carregarDemandasPorDisciplina() {
        log.debug("Request para carregar dados para o gráfico de demandas por disciplina");
        return this.demandaProfessoresRepository.carregarDemandasPorDisciplina();

    }
}
