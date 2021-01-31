package edukare.candidato.services;

import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Inscricao;
import edukare.candidato.domain.Titulo;
import edukare.candidato.domain.TituloInscricao;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.repository.InscricaoRepository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@Service
public class InscricaoService {
    private final Logger log = LoggerFactory.getLogger(InscricaoService.class);

    @Autowired
    private InscricaoRepository inscricaoRepository;

    @Autowired
    private CandidatoService candidatoService;

    public Inscricao salvar(Inscricao inscricao) {
        log.debug("Request para salvar uma inscricao");
        return this.inscricaoRepository.save(inscricao);
    }

    public Optional<Inscricao> inscreverCandidato(InscricaoDto inscricaoDto) {
        log.debug("Request para inscrever um candidato");

        Long candidatoId = inscricaoDto.getCandidatoId();
        Long processoId = inscricaoDto.getProcessoSeletivoId();

        if (candidatoId != null && processoId != null) {
            Optional<Candidato> can = candidatoService.findById(candidatoId);

            if (can.isPresent() && verificarProcessoSeletivoAberto(processoId)) {
                Optional<Inscricao> insc = carregarCandidatoJaTemInscricaoAtivaNoProcesso(candidatoId, processoId);

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

                Inscricao inscricao = new Inscricao(processoId, Situacao.ATIVA, candidatoId, LocalDateTime.now(), c.getNomeCompleto(), c.getCpf(), c.getFiliacao1(),
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

    public Set<Inscricao> carregarTodasInscricoesDoCandidato(Long candidatoId) {
        log.debug("Request para carregar todas as inscrições um candidato");
        return inscricaoRepository.findAllByCandidatoId(candidatoId);
    }

    public Optional<Inscricao> carregarInscricaoPorId(Long id) {
        log.debug("Request para carregar uma inscrição por ID");
        return inscricaoRepository.findById(id);
    }

    public void deletarInscricaoPorId(Long id) {
        log.debug("Request para deletar uma inscricao por ID");
        inscricaoRepository.deleteById(id);
    }

    public Optional<Inscricao> carregarCandidatoJaTemInscricaoAtivaNoProcesso(Long candidatoId, Long processoId) {
        log.debug("Request para verificar se o candidato já tem inscricao neste processo seletivo");
        return inscricaoRepository.findInscricaoByCandidatoIdAndProcessoSeletivoIdAndSituacaoEquals(candidatoId, processoId, Situacao.ATIVA);
    }
}
