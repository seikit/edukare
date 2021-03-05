package edukare.candidato.enumeration;

public enum Situacao {
    CANCELADA("CANCELADA"),
    ATIVA("ATIVA"),
    PROCESSADA("PROCESSADA");

    public final String situacao;

    Situacao(String situacao) {
        this.situacao = situacao;
    }
}
