package edukare.processoseletivo.domain;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Objects;

@Entity
public class Etapa {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "etapa_sequence")
    @SequenceGenerator(name = "etapa_sequence")
    private Long id;

    private String titulo;
    private String descricao;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "processo_seletivo_id")
    private ProcessoSeletivo processoSeletivo;
    /*private LocalDate data;
    private Candidato cadidato;
    private ProcessoSeletivo processoSeletivo;*/

    public Etapa() {
    }

    public Etapa(String titulo, String descricao) {
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

    public ProcessoSeletivo getProcessoSeletivo() {
        return processoSeletivo;
    }

    public void setProcessoSeletivo(ProcessoSeletivo processoSeletivo) {
        this.processoSeletivo = processoSeletivo;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Etapa etapa = (Etapa) o;
        return Objects.equals(id, etapa.id) &&
                Objects.equals(titulo, etapa.titulo) &&
                Objects.equals(descricao, etapa.descricao);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, titulo, descricao);
    }

    @Override
    public String toString() {
        return "Etapa{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", descricao='" + descricao + '\'' +
                '}';
    }
}
