import { ICandidatos } from './candidatos.model';
import { IProcessoSeletivo } from './processo-seletivo';

export interface IEtapa {
    id: number;
    titulo: string;
    descricao: string;
    data: string;
    candidatos: ICandidatos[];
    processoSeletivo: IProcessoSeletivo;
}
