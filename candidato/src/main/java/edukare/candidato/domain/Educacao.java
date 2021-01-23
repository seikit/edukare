package edukare.candidato.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Educacao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "educacao_sequence")
    @SequenceGenerator(name = "educacao_sequence")
    private Long id;

    private String nivelEscolaridade;


    @OneToMany(mappedBy = "educacao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Titulo> titulos = new HashSet<>();

    @OneToOne(mappedBy = "educacao")
    private Candidato candidato;

    public Educacao() {
    }

    public Educacao(String nivelEscolaridade, Candidato candidato, Set<Titulo> titulos) {
        this.nivelEscolaridade = nivelEscolaridade;
        this.candidato = candidato;
        this.setTitulos(titulos);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNivelEscolaridade() {
        return nivelEscolaridade;
    }

    public void setNivelEscolaridade(String nivelEscolaridade) {
        this.nivelEscolaridade = nivelEscolaridade;
    }

    public Set<Titulo> getTitulos() {
        return titulos;
    }

    public void setTitulos(Set<Titulo> titulos) {
        this.titulos = titulos;

        for(Titulo b : titulos) {
            b.setEducacao(this);
        }
    }

    public Candidato getCandidato() {
        return candidato;
    }

    public void setCandidato(Candidato candidato) {
        this.candidato = candidato;
    }

    @Override
    public String toString() {
        return "Educacao{" +
                "id=" + id +
                ", nivelEscolaridade='" + nivelEscolaridade + '\'' +
                ", titulos=" + titulos +
                ", candidato=" + candidato +
                '}';
    }
}
