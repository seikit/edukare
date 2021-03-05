package edukare.processoseletivo.enumeration;

public enum SituacaoInscricao {
    CANCELADA("CANCELADA"),
    ATIVA("ATIVA"),
    PROCESSADA("PROCESSADA");

    public final String situacao;

    SituacaoInscricao(String situacao) {
        this.situacao = situacao;
    }
}
