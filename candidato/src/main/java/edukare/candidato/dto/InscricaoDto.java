package edukare.candidato.dto;

public class InscricaoDto {

    private Long processoSeletivoId;
    private Long candidatoId;

    public InscricaoDto(Long processoSeletivoId, Long candidatoId) {
        this.processoSeletivoId = processoSeletivoId;
        this.candidatoId = candidatoId;
    }

    public Long getProcessoSeletivoId() {
        return processoSeletivoId;
    }

    public void setProcessoSeletivoId(Long processoSeletivoId) {
        this.processoSeletivoId = processoSeletivoId;
    }

    public Long getCandidatoId() {
        return candidatoId;
    }

    public void setCandidatoId(Long candidatoId) {
        this.candidatoId = candidatoId;
    }

    @Override
    public String toString() {
        return "InscricaoDto{" +
                "processoSeletivoId=" + processoSeletivoId +
                ", candidatoId=" + candidatoId +
                '}';
    }
}
