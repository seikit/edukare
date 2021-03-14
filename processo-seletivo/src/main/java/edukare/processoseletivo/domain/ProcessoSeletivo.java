package edukare.processoseletivo.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import edukare.processoseletivo.enumeration.Situacao;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;
import java.util.Set;

@Entity
public class ProcessoSeletivo {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "processo_sequence")
    @SequenceGenerator(name = "processo_sequence")
    private Long id;

    private String titulo;
    private String descricao;

    @Enumerated(EnumType.STRING)
    private Situacao situacao;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate dtInicioInscricao;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate dtEncerramentoInscricao;

    @OneToMany(mappedBy = "processoSeletivo")
    private Set<Etapa> etapas;

    public ProcessoSeletivo() {}
    public ProcessoSeletivo(String titulo, String descricao) {
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Situacao getSituacao() {
        return situacao;
    }

    public void setSituacao(Situacao situacao) {
        this.situacao = situacao;
    }

    public LocalDate getDtInicioInscricao() {
        return dtInicioInscricao;
    }

    public void setDtInicioInscricao(LocalDate dtInicioInscricao) {
        this.dtInicioInscricao = dtInicioInscricao;
    }

    public LocalDate getDtEncerramentoInscricao() {
        return dtEncerramentoInscricao;
    }

    public void setDtEncerramentoInscricao(LocalDate dtEncerramentoInscricao) {
        this.dtEncerramentoInscricao = dtEncerramentoInscricao;
    }

    public Set<Etapa> getEtapas() {
        return etapas;
    }

    public void setEtapas(Set<Etapa> etapas) {
        this.etapas = etapas;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProcessoSeletivo that = (ProcessoSeletivo) o;
        return Objects.equals(id, that.id) &&
                Objects.equals(titulo, that.titulo) &&
                Objects.equals(descricao, that.descricao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, titulo, descricao);
    }

    @Override
    public String toString() {
        return "ProcessoSeletivo{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", descricao='" + descricao + '\'' +
                '}';
    }
}
