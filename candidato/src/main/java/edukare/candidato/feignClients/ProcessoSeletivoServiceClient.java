package edukare.candidato.feignClients;

import edukare.candidato.dto.ProcessoDto;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.Optional;

@FeignClient(value = "processo-seletivo", path = "api/v1/processos")
public interface ProcessoSeletivoServiceClient {

    @GetMapping("/{id}")
    Optional<ProcessoDto> carregarProcessoPorId(@RequestHeader("Authorization") String token, @PathVariable Long id);

}
