package edukare.candidato.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class TituloInscricao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "titulo_inscricao_sequence")
    @SequenceGenerator(name = "titulo_inscricao_sequence")
    private Long id;

    @Column(nullable = false)
    private String instituicaoEnsino;

    @Column(nullable = false)
    private String tituloCurso;

    @Column(nullable = false)
    private Integer anoConclusao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inscricao_id")
    @JsonIgnore
    private Inscricao inscricao;

    public TituloInscricao() {
    }

    public TituloInscricao(String instituicaoEnsino, String tituloCurso, Integer anoConclusao) {
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

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }

    @Override
    public String toString() {
        return "TituloInscricao{" +
                "id=" + id +
                ", instituicaoEnsino='" + instituicaoEnsino + '\'' +
                ", tituloCurso='" + tituloCurso + '\'' +
                ", anoConclusao=" + anoConclusao +
                ", inscricao=" + inscricao +
                '}';
    }
}
