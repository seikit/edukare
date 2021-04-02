package edukare.processoseletivo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableFeignClients
@SpringBootApplication
@EnableScheduling
public class ProcessoSeletivoApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProcessoSeletivoApplication.class, args);
	}



}


