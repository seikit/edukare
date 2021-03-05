export interface IProfessor {
    processoSeletivoId: number;
    processoSeletivoTitulo: string;
    inscricaoId: number;

    nomeCompleto: string;
    cpf: string;
    celular: string;
    telefoneFixo: string;
    email: string;
    
    encaminhado: boolean;
    escolaIdEncaminhamento?: number | undefined;
    escolaEncaminhamento?: string | undefined;
}

export class Professor implements IProfessor {
    processoSeletivoId: number;
    processoSeletivoTitulo: string;
    inscricaoId: number;

    nomeCompleto: string;
    cpf: string;
    celular: string;
    telefoneFixo: string;
    email: string;
    
    encaminhado: boolean;
    escolaIdEncaminhamento: number | undefined;
    escolaEncaminhamento: string | undefined;

    constructor(processoSeletivoId: number, processoTitulo: string, inscricaoId: number, nomeCompleto: string, cpf: string, celular: string, telefoneFixo: string, email: string, encaminhado: boolean = false, escolaIdEncaminhamento?: number, escolaEncaminhamento?: string) {        
        this.processoSeletivoId = processoSeletivoId;
        this.processoSeletivoTitulo = processoTitulo;
        this.inscricaoId = inscricaoId;
        this.nomeCompleto = nomeCompleto;
        this.cpf = cpf;
        this.celular = celular;
        this.telefoneFixo = telefoneFixo;
        this.email = email;
        this.encaminhado = encaminhado;
        this.escolaIdEncaminhamento = escolaIdEncaminhamento != undefined ? escolaIdEncaminhamento : undefined;
        this.escolaEncaminhamento = escolaEncaminhamento != undefined ? escolaEncaminhamento : undefined;
    } 

}