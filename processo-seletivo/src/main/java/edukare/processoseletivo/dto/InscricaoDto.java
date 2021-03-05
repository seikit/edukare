package edukare.processoseletivo.dto;

import edukare.processoseletivo.enumeration.SituacaoInscricao;

public class InscricaoDto {

    private Long id;
    private SituacaoInscricao situacao;

    public InscricaoDto(Long id, SituacaoInscricao situacao) {
        this.id = id;
        this.situacao = situacao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public SituacaoInscricao getSituacao() {
        return situacao;
    }

    public void setSituacao(SituacaoInscricao situacao) {
        this.situacao = situacao;
    }

    @Override
    public String toString() {
        return "InscricaoDto{" +
                "id=" + id +
                ", situacao=" + situacao +
                '}';
    }
}
