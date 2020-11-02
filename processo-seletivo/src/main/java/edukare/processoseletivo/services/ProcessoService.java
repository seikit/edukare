package edukare.processoseletivo.services;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.repository.ProcessoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class ProcessoService {
    private final Logger log = LoggerFactory.getLogger(ProcessoService.class);

    @Autowired
    private ProcessoRepository processoRepository;

    public Page<ProcessoSeletivo> findAll(Pageable pageable) {
        log.debug("Request para carregar todos os processos.");
        return processoRepository.findAll(pageable);
    }

    public ProcessoSeletivo save(ProcessoSeletivo processoSeletivo) {
        log.debug("Request para criar um novo processo seletivo.");
        return processoRepository.save(processoSeletivo);
    }
}
