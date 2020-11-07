package edukare.processoseletivo.services;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.repository.ProcessoRepository;
import org.apache.tomcat.jni.Proc;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

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
        ProcessoSeletivo p = processoRepository.save(processoSeletivo);
        p.getEtapas().forEach(e -> e.setProcessoSeletivo(p));
        return processoRepository.save(p);
    }

    public ProcessoSeletivo atualizar(ProcessoSeletivo processoSeletivo) {
        log.debug("Request para atualizar um processo seletivo");
        processoSeletivo.getEtapas().forEach(e -> e.setProcessoSeletivo(processoSeletivo));
        return processoRepository.save(processoSeletivo);
    }

    public Optional<ProcessoSeletivo> findById(Long id) {
        log.debug("Request para carregar um registro por ID");
        return processoRepository.findById(id);
    }
}
