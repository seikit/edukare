import { ICandidatos } from './candidatos.model';

export interface IEtapa {
    id: number;
    titulo: string;
    descricao: string;
    data: string;
    candidatos: ICandidatos[];
    processoSeletivo: number
}
