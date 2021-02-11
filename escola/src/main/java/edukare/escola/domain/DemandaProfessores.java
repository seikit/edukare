package edukare.escola.domain;

import javax.persistence.*;

@Entity
public class DemandaProfessores {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "demanda_professores_sequence")
    @SequenceGenerator(name = "demanda_sequence")
    private Long id;

    @Column(nullable = false)
    private Integer ano;

    @Column(nullable = false)
    private String disciplina;

    @Column(nullable = false)
    private Integer semestre;


    @Column(nullable = false)
    private String escola;

    @Column(nullable = false)
    private Integer quantidade;


    public DemandaProfessores() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getAno() {
        return ano;
    }

    public void setAno(Integer ano) {
        this.ano = ano;
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

    public String getEscola() {
        return escola;
    }

    public void setEscola(String escola) {
        this.escola = escola;
    }

    public Integer getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(Integer quantidade) {
        this.quantidade = quantidade;
    }

    @Override
    public String toString() {
        return "DemandaProfessores{" +
                "id=" + id +
                ", ano=" + ano +
                ", disciplina='" + disciplina + '\'' +
                ", semestre=" + semestre +
                ", escola='" + escola + '\'' +
                ", quantidade=" + quantidade +
                '}';
    }
}
