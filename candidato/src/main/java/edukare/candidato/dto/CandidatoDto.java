package edukare.candidato.dto;

import edukare.candidato.domain.Candidato;
import edukare.candidato.domain.Educacao;
import edukare.candidato.domain.Endereco;

public class CandidatoDto {

    private DadosPessoaisDto dadosPessoais;
    private Endereco endereco;
    private Educacao educacao;

    public CandidatoDto(DadosPessoaisDto dadosPessoais, Endereco endereco, Educacao educacao) {
        this.dadosPessoais = dadosPessoais;
        this.endereco = endereco;
        this.educacao = educacao;
    }

    public CandidatoDto() {
    }

    public DadosPessoaisDto getDadosPessoais() {
        return dadosPessoais;
    }

    public void setDadosPessoais(DadosPessoaisDto dadosPessoais) {
        this.dadosPessoais = dadosPessoais;
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
        return "CandidatoDto{" +
                "dadosPessoais=" + dadosPessoais +
                ", endereco=" + endereco +
                ", educacao=" + educacao +
                '}';
    }

    public Candidato candidatoDtoToCandidato(CandidatoDto c) {
        DadosPessoaisDto d = c.getDadosPessoais();
        Candidato candidato = new Candidato(d.getId(), d.getNomeCompleto(), d.getCpf(), d.getFiliacao1(), d.getFiliacao2(), d.getEmail(), d.getCelular(), d.getTelefoneFixo(), d.getNaturalidade(), c.getEndereco(), c.getEducacao(), c.getDadosPessoais().getEmailUsuario());
        return candidato;
    }

    public CandidatoDto candidatoToCandidatoDto(Candidato candidato) {
        DadosPessoaisDto d = new DadosPessoaisDto(
                candidato.getId(),candidato.getNomeCompleto(), candidato.getCpf(), candidato.getFiliacao1(), candidato.getFiliacao2(), candidato.getEmail(), candidato.getCelular(), candidato.getTelefoneFixo(), candidato.getNaturalidade(),
                candidato.getEmailUsuario()
        );
        return new CandidatoDto(d, candidato.getEndereco(), candidato.getEducacao());
    }
}
