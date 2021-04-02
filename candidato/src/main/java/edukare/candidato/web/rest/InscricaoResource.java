package edukare.candidato.web.rest;

import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Inscricao;
import edukare.candidato.dto.InscricaoDto;
import edukare.candidato.enumeration.Situacao;
import edukare.candidato.interfaces.ISeriesGrafico;
import edukare.candidato.relatorios.RelatorioCandidato;
import edukare.candidato.relatorios.RelatorioInscricoes;
import edukare.candidato.services.CandidatoService;
import edukare.candidato.services.InscricaoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@RestController
@RequestMapping("/api/v1/inscricoes")
public class InscricaoResource {

    private final Logger log = LoggerFactory.getLogger(Inscricao.class);

    @Autowired
    private InscricaoService inscricaoService;

    @Autowired
    private CandidatoService candidatoService;

    @PostMapping
    private ResponseEntity<Inscricao> inscreverCandidato(@RequestBody InscricaoDto inscricaoDto) {
        log.debug("REST para realizar uma inscrição");
        Optional<Inscricao> insc = this.inscricaoService.inscreverCandidato(inscricaoDto);

        if (insc.isPresent()) {
            return ResponseEntity
                    .created(URI.create("/inscricoes/" + insc.get().getId()))
                    .body(insc.get());
        }
        return ResponseEntity.badRequest().build();
    }

    @PutMapping("/atualizar-situacao")
    private ResponseEntity<List<Inscricao>> atualizarSituacaoInscricoes(@RequestBody List<Inscricao> inscricoes) {
        log.debug("REST para atualizar a situação da inscrição");
        return ResponseEntity.ok(this.inscricaoService.atualizarSituacaoInscricoes(inscricoes));
    }

    @GetMapping("/candidato")
    private ResponseEntity<Set<Inscricao>> carregarTodasInscricoesDoCandidato(@RequestParam String email) {
        log.debug("REST para carregar todas as inscrições de um candidato");

        Optional<Candidato> can = candidatoService.findByEmail(email);
        if (can.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Set<Inscricao> inscricoes = inscricaoService.carregarTodasInscricoesDoCandidato(email);
        if (!inscricoes.isEmpty()) {
            return ResponseEntity.ok(inscricoes);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping(value = "/relatorio", produces = MediaType.APPLICATION_PDF_VALUE)
    public ResponseEntity relatorioInscricao(@RequestParam String email) throws IOException {
        Set<Inscricao> inscricoes = this.inscricaoService.carregarTodasInscricoesDoCandidato(email);
        if(!inscricoes.isEmpty()) {
            ByteArrayInputStream bis = RelatorioInscricoes.relatorioInscricao(inscricoes);

            HttpHeaders headers = new HttpHeaders();
            headers.add("Content-Disposition", "inline; filename=inscricao.pdf");

            return ResponseEntity
                    .ok()
                    .headers(headers)
                    .contentType(MediaType.APPLICATION_PDF)
                    .body(new InputStreamResource(bis));
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/{id}")
    private ResponseEntity<Inscricao> carregarInscricaoPorId(@PathVariable Long id) {
        log.debug("REST para carregar uma inscricão por ID");

        Optional<Inscricao> insc = inscricaoService.carregarInscricaoPorId(id);
        if (insc.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(insc.get());
    }

    @GetMapping("/grafico")
    private ResponseEntity<List<ISeriesGrafico>> carregarSeriesGraficoInscricoes() {
        log.debug("REST para carregar séries para montar gráfico de inscrições");
        return ResponseEntity.ok(this.inscricaoService.carregarSeriesGraficoInscricoes());

    }

    @GetMapping("/ativas/candidato")
    private ResponseEntity<Inscricao> carregarInscricaoAtivaNoProcesso(@RequestParam String email, @RequestParam Long processoSeletivoId) {
        log.debug("REST para carregar inscrições ativas do candidato no processo");

        Optional<Inscricao> insc = inscricaoService.carregarCandidatoJaTemInscricaoAtivaNoProcesso(email, processoSeletivoId);
        if (insc.isPresent()) {
            return ResponseEntity.ok(insc.get());
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("processo/{id}")
    private ResponseEntity<Set<Inscricao>> carregarInscricoesAtivasDoProcessoSeletivo(@PathVariable Long id) {
        log.debug("REST para carregar inscrições ativas do processo seletivo.");

        Set<Inscricao> inscricoes = inscricaoService.carregarTodasInscricoesAtivasDoProcesso(id);
        if (inscricoes.isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(inscricoes);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletarInscricao(@PathVariable Long id) {
        log.debug("REST para deletar uma inscricao");
        if (inscricaoService.carregarInscricaoPorId(id).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        inscricaoService.deletarInscricaoPorId(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping
    public ResponseEntity<Inscricao> cancelarInscricao(@RequestBody Inscricao inscricao, @RequestHeader("Authorization") String token) {
        log.debug("REST para cancelar uma inscrição");
        if (inscricaoService.findById(inscricao.getId()).isEmpty()) {
            return ResponseEntity.notFound().build();
        }
        Optional<Inscricao> insc = inscricaoService.cancelar(inscricao, token);
        if (insc.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(insc.get());
    }

    @GetMapping("/transparencia/total-inscritos")
    public ResponseEntity<Integer> carregarQuantitativoInscritosAnoCorrente(){
        log.debug("REST para carregar o quantitativo de inscritos no ano corrente");
        return ResponseEntity.ok().body(this.inscricaoService.carregarQuantitativoInscritosAnoCorrente());
    }
}
