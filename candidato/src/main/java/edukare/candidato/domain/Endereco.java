package edukare.candidato.domain;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
public class Endereco {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "endereco_sequence")
    @SequenceGenerator(name = "endereco_sequence")
    private Long id;

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

    public Endereco() {
    }

    public Endereco(String rua, Long numero, String bairro, String cidadeResidencia, String estadoResidencia) {
        this.rua = rua;
        this.numero = numero;
        this.bairro = bairro;
        this.cidadeResidencia = cidadeResidencia;
        this.estadoResidencia = estadoResidencia;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    @Override
    public String toString() {
        return "Endereco{" +
                "id=" + id +
                ", rua='" + rua + '\'' +
                ", numero=" + numero +
                ", bairro='" + bairro + '\'' +
                ", cidadeResidencia='" + cidadeResidencia + '\'' +
                ", estadoResidencia='" + estadoResidencia + '\'' +
                '}';
    }
}
