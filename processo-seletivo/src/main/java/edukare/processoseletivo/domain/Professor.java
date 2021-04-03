package edukare.processoseletivo.domain;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
public class Professor {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "professor_sequence")
    @SequenceGenerator(name = "professor_sequence", initialValue = 1, allocationSize = 1)
    private Long id;

    @Column(nullable = false)
    private Long processoSeletivoId;

    @Column(nullable = false)
    private String processoSeletivoTitulo;

    @Column(nullable = false)
    private LocalDateTime dataEfetivacao;

    @Column(nullable = false)
    private Long inscricaoId;

    @Column(nullable = false)
    private String nomeCompleto;

    @Column(nullable = false)
    private String cpf;

    @Column(nullable = false)
    private String celular;

    @Column(nullable = false)
    private String telefoneFixo;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private Boolean encaminhado;

    @Column(nullable = true)
    private Long escolaIdEncaminhamento;

    @Column(nullable = true)
    private String escolaEncaminhamento;

    public Professor() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProcessoSeletivoId() {
        return processoSeletivoId;
    }

    public void setProcessoSeletivoId(Long processoSeletivoId) {
        this.processoSeletivoId = processoSeletivoId;
    }

    public String getProcessoSeletivoTitulo() {
        return processoSeletivoTitulo;
    }

    public void setProcessoSeletivoTitulo(String processoSeletivoTitulo) {
        this.processoSeletivoTitulo = processoSeletivoTitulo;
    }

    public LocalDateTime getDataEfetivacao() {
        return dataEfetivacao;
    }

    public void setDataEfetivacao(LocalDateTime dataEfetivacao) {
        this.dataEfetivacao = dataEfetivacao;
    }

    public Long getInscricaoId() {
        return inscricaoId;
    }

    public void setInscricaoId(Long inscricaoId) {
        this.inscricaoId = inscricaoId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getEncaminhado() {
        return encaminhado;
    }

    public void setEncaminhado(Boolean encaminhado) {
        this.encaminhado = encaminhado;
    }

    public Long getEscolaIdEncaminhamento() {
        return escolaIdEncaminhamento;
    }

    public void setEscolaIdEncaminhamento(Long escolaIdEncaminhamento) {
        this.escolaIdEncaminhamento = escolaIdEncaminhamento;
    }

    public String getEscolaEncaminhamento() {
        return escolaEncaminhamento;
    }

    public void setEscolaEncaminhamento(String escolaEncaminhamento) {
        this.escolaEncaminhamento = escolaEncaminhamento;
    }

    @Override
    public String toString() {
        return "Professor{" +
                "id=" + id +
                ", processoSeletivoId=" + processoSeletivoId +
                ", processoSeletivoTitulo='" + processoSeletivoTitulo + '\'' +
                ", dataEfetivação='" + dataEfetivacao + '\'' +
                ", inscricaoId=" + inscricaoId +
                ", nomeCompleto='" + nomeCompleto + '\'' +
                ", cpf='" + cpf + '\'' +
                ", celular='" + celular + '\'' +
                ", telefoneFixo='" + telefoneFixo + '\'' +
                ", email='" + email + '\'' +
                ", encaminhado=" + encaminhado +
                ", escolaIdEncaminhamento=" + escolaIdEncaminhamento +
                ", escolaEncaminhamento='" + escolaEncaminhamento + '\'' +
                '}';
    }
}
