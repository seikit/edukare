package edukare.processoseletivo.feignClients;

import edukare.processoseletivo.dto.InscricaoDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.List;

@FeignClient(value = "candidato", path = "api/v1/inscricoes")
public interface CandidatoClient {

    @PutMapping("/atualizar-situacao")
    List<InscricaoDto> atualizarSituacaoInscricao(List<InscricaoDto> inscricaoDtos, @RequestHeader("Authorization") String token);

    @GetMapping("processo/{id}")
    List<InscricaoDto> carregarTodasInscricoesAtivas(@PathVariable Long id, @RequestHeader("Authorization") String token);

}
