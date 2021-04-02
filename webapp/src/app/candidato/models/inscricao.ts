import { SituacaoInscricao } from "./situacao-inscricao.enum";

export interface IInscricao {
    id: number;
    situacao: SituacaoInscricao
    processoSeletivoId: number;
    candidatoId: number;
    dataInscricao: Date;
    nomeCompleto: string;
    cpf: string;
    filiacao1: string;
    filiacao2: string;
    email: string;
    celular: string;
    telefoneFixo: string;
    naturalidade: string;
    rua: string;
    numero: number;
    bairro: string;
    cidadeResidencia: string;
    estadoResidencia: string;
    nivelEscolaridade: string;
    titulos: ITituloInscricao[];
}

interface ITituloInscricao {
    id: number | null;
    instituicaoEnsino: string;
    tituloCurso: string;
    anoConclusao: number;
    inscricaoId: number;
}

export class Inscricao implements IInscricao {
    id!: number;
    situacao!: SituacaoInscricao;
    processoSeletivoId!: number;
    candidatoId!: number;
    dataInscricao!: Date;
    nomeCompleto!: string;
    cpf!: string;
    filiacao1!: string;
    filiacao2!: string;
    email!: string;
    celular!: string;
    telefoneFixo!: string;
    naturalidade!: string;
    rua!: string;
    numero!: number;
    bairro!: string;
    cidadeResidencia!: string;
    estadoResidencia!: string;
    nivelEscolaridade!: string;
    titulos!: ITituloInscricao[];    
}

