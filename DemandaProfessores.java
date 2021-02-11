package edukare.escola.domain;

import javax.persistence.*;

@Entity
public class DemandaProfessores {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demanda_professores_sequence")
    @SequenceGenerator(name = "demanda_sequence")
    private Long id;

    @Column(nullable = false)
    private String disciplina;

    @Column(nullable = false)
    private Integer semestre;

    @Column(nullable = false)
    private Integer serie;

    @Column(nullable = false)
    private Long escolaId;

    public DemandaProfessores() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDisciplina() {
        return disciplina;
    }

    public void setDisciplina(String disciplina) {
        this.disciplina = disciplina;
    }

    public Integer getSemestre() {
        return semestre;
    }

    public void setSemestre(Integer semestre) {
        this.semestre = semestre;
    }

    public Integer getSerie() {
        return serie;
    }

    public void setSerie(Integer serie) {
        this.serie = serie;
    }

    public Long getEscolaId() {
        return escolaId;
    }

    public void setEscolaId(Long escolaId) {
        this.escolaId = escolaId;
    }

    @Override
    public String toString() {
        return "DemandaProfessores{" +
                "id=" + id +
                ", disciplina='" + disciplina + '\'' +
                ", semestre=" + semestre +
                ", serie=" + serie +
                ", escolaId=" + escolaId +
                '}';
    }
}
