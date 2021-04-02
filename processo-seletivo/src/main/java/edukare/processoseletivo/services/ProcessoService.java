package edukare.processoseletivo.services;

import edukare.processoseletivo.domain.ProcessoSeletivo;
import edukare.processoseletivo.domain.Professor;
import edukare.processoseletivo.enumeration.Situacao;
import edukare.processoseletivo.repository.ProcessoRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.Set;

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

    public ProcessoSeletivo atualizar(ProcessoSeletivo processoSeletivo) {
        log.debug("Request para atualizar um processo seletivo");
//        processoSeletivo.getEtapas().forEach(e -> e.setProcessoSeletivo(processoSeletivo));
        return processoRepository.saveAndFlush(processoSeletivo);
    }

    public Optional<ProcessoSeletivo> findById(Long id) {
        log.debug("Request para carregar um registro por ID");
        return processoRepository.findById(id);
    }

    public Boolean deletar(Long id) {
        log.debug("Request para deletar um processo seletivo");
        Boolean temProcesso = this.processoRepository.existsById(id);
        if (temProcesso) {
            processoRepository.deleteById(id);
            return true;
        }
        return false;
    }

    public Set<ProcessoSeletivo> carregarProcessosInscricoesAbertas() {
        return this.processoRepository.findAllBySituacao(Situacao.INSCRICAO);
    }

    public List<ProcessoSeletivo> carregarTodosProcessos() {
        log.debug("Request para carregar todos os processo");
        return this.processoRepository.findAll();
    }

    public List<ProcessoSeletivo> carregarTodosProcessosConcluidosDoAnoCorrente() {
        log.debug("Request para carregar todos os processo encerrados do ano corrente");
        return this.processoRepository.findAllBySituacaoAndAno(Situacao.CONCLUIDO, LocalDate.now().getYear());
    }

    public Integer carregarQuantitativoProcessosConcluidos() {
        log.debug("Request para carregar o quantitativo de processos realizados no ano corrente");
        return this.processoRepository.countAllBySituacaoAndAno(Situacao.CONCLUIDO, LocalDate.now().getYear());
    }

    public ProcessoSeletivo atualizarSituacaoProcesso(Long id, Situacao situacao) {
        log.debug("Request para atulizar a situação de um processo para uma situação");
        Optional<ProcessoSeletivo> p = this.findById(id);
        if(p.isPresent()) {
            p.get().setSituacao(situacao);
        }
        return processoRepository.save(p.get());
    }

    @Scheduled(cron = "@midnight")
    public void abrirInscricao() {
        log.debug("Rodando Cron para abrir a inscrição do processo");
        List<ProcessoSeletivo> processos = this.processoRepository.findAllBySituacaoAndAno(Situacao.NOVO, LocalDate.now().getYear());

        for(ProcessoSeletivo processo: processos) {
            if(processo.getSituacao().situacao.equals("NOVO") && LocalDate.now().isEqual(processo.getDtInicioInscricao())) {
                processo.setSituacao(Situacao.INSCRICAO);
            }
            this.processoRepository.save(processo);
        }

    }

    @Scheduled(cron = "59 23 * * * *")
    public void fecharInscricao() {
        log.debug("Rodando Cron para fechar a inscrição do processo");
        List<ProcessoSeletivo> processos = this.processoRepository.findAllBySituacaoAndAno(Situacao.INSCRICAO, LocalDate.now().getYear());

        for(ProcessoSeletivo processo: processos) {
            if(processo.getSituacao().situacao.equals("INSCRICAO") && LocalDate.now().isEqual(processo.getDtEncerramentoInscricao())) {
                processo.setSituacao(Situacao.SELECAO);
            }

            this.processoRepository.save(processo);
        }

    }


}
