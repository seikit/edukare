package edukare.processoseletivo.enumeration;

public enum Situacao {
    NOVO("NOVO"),
    INSCRICAO("INSCRICAO"),
    CANCELADO("CANCELADO"),
    CONCLUIDO("CONCLUIDO");

    public final String situacao;

    Situacao(String situacao) {
        this.situacao = situacao;
    }
}
