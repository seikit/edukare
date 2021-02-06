package edukare.candidato;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class CandidatoApplication {

	public static void main(String[] args) {
		SpringApplication.run(CandidatoApplication.class, args);
	}

}
