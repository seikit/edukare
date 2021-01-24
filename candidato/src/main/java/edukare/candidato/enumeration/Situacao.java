package edukare.candidato.enumeration;

public enum Situacao {
    CANCELADA("CANCELADA"),
    ATIVA("ATIVA");

    public final String situacao;

    Situacao(String situacao) {
        this.situacao = situacao;
    }
}
