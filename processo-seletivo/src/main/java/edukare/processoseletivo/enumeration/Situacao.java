package edukare.processoseletivo.enumeration;

public enum Situacao {
    NOVO("NOVO"),
    CANCELADO("CANCELADO"),
    SUSPENSO("SUSPENSO");

    public final String situacao;

    Situacao(String situacao) {
        this.situacao = situacao;
    }
}
