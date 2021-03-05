package edukare.candidato.services;

import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Inscricao;
import edukare.candidato.domain.Titulo;
import edukare.candidato.domain.TituloInscricao;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.dto.ProcessoDto;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.feignClients.ProcessoSeletivoServiceClient;
import edukare.candidato.repository.InscricaoRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestHeader;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class InscricaoService {
    private final Logger log = LoggerFactory.getLogger(InscricaoService.class);

    @Autowired
    private InscricaoRepository inscricaoRepository;

    @Autowired
    private CandidatoService candidatoService;

    @Autowired
    private ProcessoSeletivoServiceClient processoSeletivoServiceClient;

    public Inscricao salvar(Inscricao inscricao) {
        log.debug("Request para salvar uma inscricao");
        return this.inscricaoRepository.save(inscricao);
    }

    public Optional<Inscricao> inscreverCandidato(InscricaoDto inscricaoDto) {
        log.debug("Request para inscrever um candidato");

        String emailUsuario = inscricaoDto.getEmailUsuario();
        Long processoId = inscricaoDto.getProcessoSeletivoId();

        if (emailUsuario != null && processoId != null) {
            Optional<Candidato> can = candidatoService.findByEmail(emailUsuario);

            if (can.isPresent() && verificarProcessoSeletivoAberto(processoId)) {
                Optional<Inscricao> insc = carregarCandidatoJaTemInscricaoAtivaNoProcesso(emailUsuario, processoId);

                if (insc.isPresent()) {
                    Inscricao i = insc.get();
                    i.setSituacao(Situacao.CANCELADA);
                    this.salvar(i);
                }

                Candidato c = can.get();
                Set<TituloInscricao> titulos = new HashSet<>();
                for (Titulo t: c.getEducacao().getTitulos()) {
                    TituloInscricao tituloInscricao = new TituloInscricao(t.getInstituicaoEnsino(),t.getTituloCurso(),t.getAnoConclusao());
                    titulos.add(tituloInscricao);
                }

                Inscricao inscricao = new Inscricao(processoId, emailUsuario, Situacao.ATIVA, LocalDateTime.now(), c.getNomeCompleto(), c.getCpf(), c.getFiliacao1(),
                        c.getFiliacao2(), c.getEmail(), c.getCelular(), c.getTelefoneFixo(), c.getNaturalidade(), c.getEndereco().getRua(),c.getEndereco().getNumero(), c.getEndereco().getBairro(),
                        c.getEndereco().getCidadeResidencia(), c.getEndereco().getEstadoResidencia(), c.getEducacao().getNivelEscolaridade(), titulos);

                Inscricao novaInscricao =  this.salvar(inscricao);
                if (novaInscricao.getId() != null) {
                    return Optional.of(novaInscricao);
                }
            }
            return Optional.empty();
        }
        return Optional.empty();
    }

    public Boolean verificarProcessoSeletivoAberto(Long processoId) {
        log.debug("Request para verificar se o processo seletivo está com inscrições abertas");
        // TODO Implementar endpoint no microservico de processo setivo que retorna o status do processo.
        return true;
    }

    public Set<Inscricao> carregarTodasInscricoesDoCandidato(String email) {
        log.debug("Request para carregar todas as inscrições um candidato");
        return inscricaoRepository.findAllByEmailUsuario(email);
    }

    public Optional<Inscricao> carregarInscricaoPorId(Long id) {
        log.debug("Request para carregar uma inscrição por ID");
        return inscricaoRepository.findById(id);
    }

    public void deletarInscricaoPorId(Long id) {
        log.debug("Request para deletar uma inscricao por ID");
        inscricaoRepository.deleteById(id);
    }

    public Optional<Inscricao> carregarCandidatoJaTemInscricaoAtivaNoProcesso(String email, Long processoId) {
        log.debug("Request para verificar se o candidato já tem inscricao neste processo seletivo");
        return inscricaoRepository.findInscricaoByEmailUsuarioAndProcessoSeletivoIdAndSituacaoEquals(email, processoId, Situacao.ATIVA);
    }

    public Optional<Inscricao> findById(Long inscricaoId) {
        log.debug("Request para carregar uma inscricao por Id");
        return inscricaoRepository.findById(inscricaoId);
    }

    public Optional<Inscricao> cancelar(Inscricao inscricao, String token) {
        log.debug("Request para cancelar uma inscricao");
        Optional<ProcessoDto> processo = processoSeletivoServiceClient.carregarProcessoPorId(token, inscricao.getProcessoSeletivoId());
        if (processo.isPresent()) {
            ProcessoDto p = processo.get();
            if (!p.getSituacao().equals("CANCELADO") && LocalDate.now().isBefore(p.getDtEncerramentoInscricao())) {
                inscricao.setSituacao(Situacao.CANCELADA);
                return Optional.of(this.salvar(inscricao));
            }
        }
        return Optional.empty();
    }

    public Set<Inscricao> carregarTodasInscricoesAtivasDoProcesso(Long id) {
        log.debug("Request para carregar todas inscrições ativas do processo seletivo: ${id}");
        return inscricaoRepository.findAllBySituacaoAndProcessoSeletivoId(Situacao.ATIVA, id);
    }

    public List<Inscricao> atualizarSituacaoInscricoes(List<Inscricao> inscricoes) {
        log.debug("Request para atualizar a situação da inscrição");

        List<Inscricao> atualizarInscricoes = new ArrayList<>();
        for (Inscricao i: inscricoes) {
            Optional<Inscricao> inscricaoCarregada = this.carregarInscricaoPorId(i.getId());
            if(inscricaoCarregada.isPresent()) {
                inscricaoCarregada.get().setSituacao(i.getSituacao());
                atualizarInscricoes.add(inscricaoCarregada.get());
            }
        }
        return this.inscricaoRepository.saveAll(atualizarInscricoes);
    }
}
