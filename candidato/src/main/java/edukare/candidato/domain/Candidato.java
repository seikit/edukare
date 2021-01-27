package edukare.candidato.domain;

import javax.persistence.*;

@Entity
public class Candidato {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "candidato_sequence")
    @SequenceGenerator(name = "candidato_sequence")
    private Long id;

    @Column(nullable = false)
    private String nomeCompleto;

    @Column(nullable = false)
    private String cpf;

    @Column(nullable = false)
    private String filiacao1;

    @Column(nullable = false)
    private String filiacao2;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String celular;

    private String telefoneFixo;

    @Column(nullable = false)
    private String naturalidade;

    @OneToOne
    @JoinColumn(name = "endereco_id", referencedColumnName = "id", nullable = false)
    private Endereco endereco;

    @OneToOne
    @JoinColumn(name = "educacao_id", referencedColumnName = "id", nullable = false)
    private Educacao educacao;

    public Candidato() {
    }

    public Candidato(String nomeCompleto, String cpf, String filiacao1, String filiacao2, String email, String celular, String telefoneFixo, String naturalidade, Endereco endereco, Educacao educacao) {
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.filiacao1 = filiacao1;
        this.filiacao2 = filiacao2;
        this.email = email;
        this.celular = celular;
        this.telefoneFixo = telefoneFixo;
        this.naturalidade = naturalidade;
        this.endereco = endereco;
        this.educacao = educacao;
    }

    public Candidato(Long id, String nomeCompleto, String cpf, String filiacao1, String filiacao2, String email, String celular, String telefoneFixo, String naturalidade, Endereco endereco, Educacao educacao) {
        this.id = id;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.filiacao1 = filiacao1;
        this.filiacao2 = filiacao2;
        this.email = email;
        this.celular = celular;
        this.telefoneFixo = telefoneFixo;
        this.naturalidade = naturalidade;
        this.endereco = endereco;
        this.educacao = educacao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public Educacao getEducacao() {
        return educacao;
    }

    public void setEducacao(Educacao educacao) {
        this.educacao = educacao;
    }

    @Override
    public String toString() {
        return "Candidato{" +
                "id=" + id +
                ", nomeCompleto='" + nomeCompleto + '\'' +
                ", cpf='" + cpf + '\'' +
                ", filiacao1='" + filiacao1 + '\'' +
                ", filiacao2='" + filiacao2 + '\'' +
                ", email='" + email + '\'' +
                ", celular='" + celular + '\'' +
                ", telefoneFixo='" + telefoneFixo + '\'' +
                ", naturalidade='" + naturalidade + '\'' +
                ", endereco=" + endereco +
                ", educacao=" + educacao +
                '}';
    }
}
