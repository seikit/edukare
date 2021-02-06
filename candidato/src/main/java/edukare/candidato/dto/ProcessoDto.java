package edukare.candidato.dto;

import java.time.LocalDate;

public class ProcessoDto {

    private Long id;
    private String titulo;
    private String descricao;
    private String situacao;
    private LocalDate dtInicioInscricao;
    private LocalDate dtEncerramentoInscricao;

    public ProcessoDto(Long id, String titulo, String descricao, String situacao, LocalDate dtInicioInscricao, LocalDate dtEncerramentoInscricao) {
        this.id = id;
        this.titulo = titulo;
        this.descricao = descricao;
        this.situacao = situacao;
        this.dtInicioInscricao = dtInicioInscricao;
        this.dtEncerramentoInscricao = dtEncerramentoInscricao;
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

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
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

    @Override
    public String toString() {
        return "ProcessoDto{" +
                "id=" + id +
                ", titulo='" + titulo + '\'' +
                ", descricao='" + descricao + '\'' +
                ", situacao='" + situacao + '\'' +
                ", dtInicioInscricao=" + dtInicioInscricao +
                ", dtEncerramentoInscricao=" + dtEncerramentoInscricao +
                '}';
    }
}
