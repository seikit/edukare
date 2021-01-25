export interface IDadosCandidato {
    dadosPessoais: IDadosPessoais;
    endereco: IEndereco;
    educacao: IEducacao[];   
}

interface IDadosPessoais {
    nomeCompleto: string;
    cpf: string;
    filiacao1: string;
    filiacao2: string;
    email: string;
    celular: string;
    telefoneFixo: string;
    naturalidade: string;
}

interface IEndereco {
    rua: string;
    numero: number;
    bairro: string;
    cidadeResidencia: string;
    estadoResidencia: string;
}

interface IEducacao {
    nivelEscolaridade: string;
    titulos: ITitulo[];
}

interface ITitulo {
    instituicaoEnsino: string;
    tituloCurso: string;
    anoConclusao: Number;
}