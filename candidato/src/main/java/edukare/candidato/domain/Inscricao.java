package edukare.candidato.domain;

import edukare.candidato.enumeration.Situacao;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Inscricao {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "inscricao_sequence")
    @SequenceGenerator(name = "inscricao_sequence")
    private Long id;

    @Enumerated(EnumType.STRING)
    private Situacao situacao;

    @Column(nullable = false)
    private Long processoSeletivoId;

    @Column(nullable = false)
    private Long candidatoId;

    @Column(nullable = false)
    private LocalDateTime dataInscricao;

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

    @Column(nullable = false)
    private String rua;

    @Column(nullable = false)
    private Long numero;

    @Column(nullable = false)
    private String bairro;

    @Column(nullable = false)
    private String cidadeResidencia;

    @Column(nullable = false)
    private String estadoResidencia;

    @Column(nullable = false)
    private String nivelEscolaridade;

    @Column(nullable = false)
    @OneToMany(mappedBy = "inscricao", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Set<Titulo> titulos = new HashSet<>();

    public Inscricao() {
    }

    public Inscricao(Long processoSeletivoId, Situacao situacao, Long candidatoId, LocalDateTime dataInscricao, String nomeCompleto, String cpf, String filiacao1, String filiacao2, String email, String celular,
                     String telefoneFixo, String naturalidade, String rua, Long numero, String bairro, String cidadeResidencia, String estadoResidencia, String nivelEscolaridade, Set<Titulo> titulos) {
        this.processoSeletivoId = processoSeletivoId;
        this.situacao = situacao;
        this.candidatoId = candidatoId;
        this.dataInscricao = dataInscricao;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.filiacao1 = filiacao1;
        this.filiacao2 = filiacao2;
        this.email = email;
        this.celular = celular;
        this.telefoneFixo = telefoneFixo;
        this.naturalidade = naturalidade;
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.cidadeResidencia = cidadeResidencia;
        this.estadoResidencia = estadoResidencia;
        this.nivelEscolaridade = nivelEscolaridade;
        this.setTitulos(titulos);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Situacao getSituacao() {
        return situacao;
    }

    public void setSituacao(Situacao situacao) {
        this.situacao = situacao;
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

    public LocalDateTime getDataInscricao() {
        return dataInscricao;
    }

    public void setDataInscricao(LocalDateTime dataInscricao) {
        this.dataInscricao = dataInscricao;
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

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public Long getNumero() {
        return numero;
    }

    public void setNumero(Long numero) {
        this.numero = numero;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidadeResidencia() {
        return cidadeResidencia;
    }

    public void setCidadeResidencia(String cidadeResidencia) {
        this.cidadeResidencia = cidadeResidencia;
    }

    public String getEstadoResidencia() {
        return estadoResidencia;
    }

    public void setEstadoResidencia(String estadoResidencia) {
        this.estadoResidencia = estadoResidencia;
    }

    public String getNivelEscolaridade() {
        return nivelEscolaridade;
    }

    public void setNivelEscolaridade(String nivelEscolaridade) {
        this.nivelEscolaridade = nivelEscolaridade;
    }

    public Set<Titulo> getTitulos() {
        return titulos;
    }

    public void setTitulos(Set<Titulo> titulos) {
        this.titulos = titulos;

        for(Titulo t : titulos) {
            t.setInscricao(this);
        }
    }

    @Override
    public String toString() {
        return "Inscricao{" +
                "id=" + id +
                ", processoSeletivoId=" + processoSeletivoId +
                ", candidatoId=" + candidatoId +
                ", dataInscricao=" + dataInscricao +
                ", nomeCompleto='" + nomeCompleto + '\'' +
                ", cpf='" + cpf + '\'' +
                ", filiacao1='" + filiacao1 + '\'' +
                ", filiacao2='" + filiacao2 + '\'' +
                ", email='" + email + '\'' +
                ", celular='" + celular + '\'' +
                ", telefoneFixo='" + telefoneFixo + '\'' +
                ", naturalidade='" + naturalidade + '\'' +
                ", rua='" + rua + '\'' +
                ", numero=" + numero +
                ", bairro='" + bairro + '\'' +
                ", cidadeResidencia='" + cidadeResidencia + '\'' +
                ", estadoResidencia='" + estadoResidencia + '\'' +
                ", nivelEscolaridade='" + nivelEscolaridade + '\'' +
                ", titulos=" + titulos +
                '}';
    }
}
