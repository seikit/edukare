package edukare.escola.domain;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Escola {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "escola_sequence")
    @SequenceGenerator(name = "escola_sequence", initialValue = 1, allocationSize = 1)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL, mappedBy = "escola")
    private Set<Usuario> usuario;

    public Escola() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nomeEscola) {
        this.nome = nomeEscola;
    }

    public Set<Usuario> getUsuario() {
        return usuario;
    }

    public void setUsuario(Set<Usuario> usuarios) {
        this.usuario = usuario;

        for(Usuario b : usuarios) {
            b.setEscola(this);
        }
    }

    @Override
    public String toString() {
        return "Escola{" +
                "id=" + id +
                ", nomeEscola='" + nome + '\'' +
                ", usuario=" + usuario +
                '}';
    }
}
