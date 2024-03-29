import { FormGroup } from '@angular/forms';
import { ICandidato } from './candidato.model';
import { IEtapa } from './etapas.model';
import { Situacao } from './situacao.enum';

export interface IProcessoSeletivo {
    id?: number | undefined;
    titulo: string;
    descricao: string;
    situacao: string;
    dtInicioInscricao: string;
    dtEncerramentoInscricao: string;
    candidatos: ICandidato[];
    etapas: IEtapa[];
}

export class ProcessoSeletivo implements IProcessoSeletivo {
    titulo: string;
    descricao: string;
    situacao: Situacao;
    dtInicioInscricao: string;
    dtEncerramentoInscricao: string;
    candidatos: ICandidato[];
    etapas: IEtapa[];
    
    constructor(titulo?: string, descricao?: string, situacao: Situacao = Situacao.NOVO, dtInicioInscricao?: string, dtEncerramentoInscricao?: string, etapas?: IEtapa[], candidatos?: ICandidato[]) {
        this.titulo = titulo != undefined ? titulo : "";
        this.descricao = descricao != undefined ? descricao : "";
        this.situacao = situacao;
        this.dtInicioInscricao = dtInicioInscricao != undefined ? dtInicioInscricao : "";
        this.dtEncerramentoInscricao = dtEncerramentoInscricao != undefined ? dtEncerramentoInscricao : "";
        this.candidatos = candidatos != undefined && candidatos.length > 0  ? candidatos : [];
        this.etapas = etapas != undefined && etapas.length > 0 ? etapas : [];
    }

    construirNovoProcesso(formDescricao: FormGroup, formData: FormGroup, etapas: IEtapa[]): ProcessoSeletivo | null {
        if (formDescricao == undefined || formData == undefined  || etapas.length == 0 ) return null;
        
        return new ProcessoSeletivo(
            formDescricao.get('titulo')?.value,
            formDescricao.get('descricao')?.value,
            Situacao.NOVO,
            formData.get('dtInicioInscricao')?.value,
            formData.get('dtEncerramentoInscricao')?.value,
            etapas);
    }
}
