package edukare.candidato.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;

@Entity
public class Titulo {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "titulo_sequence")
    @SequenceGenerator(name = "titulo_sequence")
    private Long id;

    @Column(nullable = false)
    private String instituicaoEnsino;

    @Column(nullable = false)
    private String tituloCurso;

    @Column(nullable = false)
    private Integer anoConclusao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "educacao_id")
    @JsonIgnore
    private Educacao educacao;

    public Titulo() {
    }

    public Titulo(String instituicaoEnsino, String tituloCurso, Integer anoConclusao) {
        this.instituicaoEnsino = instituicaoEnsino;
        this.tituloCurso = tituloCurso;
        this.anoConclusao = anoConclusao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getInstituicaoEnsino() {
        return instituicaoEnsino;
    }

    public void setInstituicaoEnsino(String instituicaoEnsino) {
        this.instituicaoEnsino = instituicaoEnsino;
    }

    public String getTituloCurso() {
        return tituloCurso;
    }

    public void setTituloCurso(String tituloCurso) {
        this.tituloCurso = tituloCurso;
    }

    public Integer getAnoConclusao() {
        return anoConclusao;
    }

    public void setAnoConclusao(Integer anoConclusao) {
        this.anoConclusao = anoConclusao;
    }

    public Educacao getEducacao() {
        return educacao;
    }

    public void setEducacao(Educacao educacao) {
        this.educacao = educacao;
    }

    @Override
    public String toString() {
        return "Titulo{" +
                "id=" + id +
                ", instituicaoEnsino='" + instituicaoEnsino + '\'' +
                ", tituloCurso='" + tituloCurso + '\'' +
                ", anoConclusao=" + anoConclusao +
                ", educacao=" + educacao +
                '}';
    }
}
