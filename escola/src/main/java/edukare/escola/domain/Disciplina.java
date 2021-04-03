package edukare.escola.domain;

import javax.persistence.*;

@Entity
public class Disciplina {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "disciplina_sequence")
    @SequenceGenerator(name = "disciplina_sequence", initialValue = 1, allocationSize = 1)
    private Long id;

    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String ativa;

    public Disciplina() {
    }

    public Disciplina(Long id, String nome, String ativa) {
        this.id = id;
        this.nome = nome;
        this.ativa = ativa;
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

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAtiva() {
        return ativa;
    }

    public void setAtiva(String ativa) {
        this.ativa = ativa;
    }

    @Override
    public String toString() {
        return "Disciplina{" +
                "id=" + id +
                ", nome='" + nome + '\'' +
                ", ativa='" + ativa + '\'' +
                '}';
    }
}
