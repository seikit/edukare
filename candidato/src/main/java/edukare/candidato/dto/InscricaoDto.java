package edukare.candidato.dto;

public class InscricaoDto {

    private Long processoSeletivoId;
    private String emailUsuario;

    public InscricaoDto(Long processoSeletivoId, String emailUsuario) {
        this.processoSeletivoId = processoSeletivoId;
        this.emailUsuario = emailUsuario;
    }

    public Long getProcessoSeletivoId() {
        return processoSeletivoId;
    }

    public void setProcessoSeletivoId(Long processoSeletivoId) {
        this.processoSeletivoId = processoSeletivoId;
    }

    public String getEmailUsuario() {
        return emailUsuario;
    }

    public void setEmailUsuario(String emailUsuario) {
        this.emailUsuario = emailUsuario;
    }

    @Override
    public String toString() {
        return "InscricaoDto{" +
                "processoSeletivoId=" + processoSeletivoId +
                ", emailUsuario=" + emailUsuario +
                '}';
    }
}
