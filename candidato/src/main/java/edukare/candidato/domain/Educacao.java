package edukare.candidato.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Educacao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "educacao_sequence")
    @SequenceGenerator(name = "educacao_sequence")
    private Long id;

    @Column(nullable = false)
    private String nivelEscolaridade;

    @Column(nullable = false, unique = true)
    @OneToMany(mappedBy = "educacao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Titulo> titulos = new HashSet<>();

//    @OneToOne(mappedBy = "educacao")
//    @JsonIgnore
//    private Candidato candidato;

    public Educacao() {
    }

    public Educacao(String nivelEscolaridade, Candidato candidato, Set<Titulo> titulos) {
        this.nivelEscolaridade = nivelEscolaridade;

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



    @Override
    public String toString() {
        return "Educacao{" +
                "id=" + id +
                ", nivelEscolaridade='" + nivelEscolaridade + '\'' +
                ", titulos=" + titulos +
                '}';
    }
}
