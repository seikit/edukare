import * as _moment from 'moment';

export interface IDadosCandidato {    
    dadosPessoais: IDadosPessoais;
    endereco: IEndereco;
    educacao: IEducacao;   
}

interface IDadosPessoais {  
    id: number | null; 
    emailUsuario: string;     
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
    id: number | null;
    rua: string;
    numero: number;
    bairro: string;
    cidadeResidencia: string;
    estadoResidencia: string;
}

interface IEducacao {
    id: number | null;
    nivelEscolaridade: string;
    titulos: ITitulo[];
}

interface ITitulo {
    id: number | null;
    instituicaoEnsino: string;
    tituloCurso: string;
    anoConclusao: number;
}