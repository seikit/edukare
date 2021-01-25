package edukare.candidato.dto;

public class DadosPessoaisDto {

    private String nomeCompleto;
    private String cpf;
    private String filiacao1;
    private String filiacao2;
    private String email;
    private String celular;
    private String telefoneFixo;
    private String naturalidade;

    public DadosPessoaisDto(String nomeCompleto, String cpf, String filiacao1, String filiacao2, String email, String celular, String telefoneFixo, String naturalidade) {
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.filiacao1 = filiacao1;
        this.filiacao2 = filiacao2;
        this.email = email;
        this.celular = celular;
        this.telefoneFixo = telefoneFixo;
        this.naturalidade = naturalidade;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getFiliacao1() {
        return filiacao1;
    }

    public void setFiliacao1(String filiacao1) {
        this.filiacao1 = filiacao1;
    }

    public String getFiliacao2() {
        return filiacao2;
    }

    public void setFiliacao2(String filiacao2) {
        this.filiacao2 = filiacao2;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getTelefoneFixo() {
        return telefoneFixo;
    }

    public void setTelefoneFixo(String telefoneFixo) {
        this.telefoneFixo = telefoneFixo;
    }

    public String getNaturalidade() {
        return naturalidade;
    }

    public void setNaturalidade(String naturalidade) {
        this.naturalidade = naturalidade;
    }

    @Override
    public String toString() {
        return "DadosPessoaisDto{" +
                ", nomeCompleto='" + nomeCompleto + '\'' +
                ", cpf='" + cpf + '\'' +
                ", filiacao1='" + filiacao1 + '\'' +
                ", filiacao2='" + filiacao2 + '\'' +
                ", email='" + email + '\'' +
                ", celular='" + celular + '\'' +
                ", telefoneFixo='" + telefoneFixo + '\'' +
                ", naturalidade='" + naturalidade + '\'' +
                '}';
    }
}
