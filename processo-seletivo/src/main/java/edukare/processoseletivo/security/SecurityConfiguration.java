package edukare.processoseletivo.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    @Override
    public void configure(WebSecurity web) {
        web.ignoring()
                .antMatchers("/h2-console/**")
                .antMatchers("/api/v1/professores/transparencia/total-aprovados")
                .antMatchers("/api/v1/professores/transparencia/total-encaminhados")
                .antMatchers("/api/v1/processos/transparencia/total-concluidos")
                .antMatchers("/api/v1/processos/todos-concluidos-ano");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/actuator/health").permitAll()
            .and()
            .authorizeRequests()
            .anyRequest()
            .authenticated()
            .and()
            .oauth2ResourceServer(oauth2 -> oauth2.jwt());
    }
}
