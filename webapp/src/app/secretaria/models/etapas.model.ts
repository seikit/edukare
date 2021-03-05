import { ICandidato } from './candidato.model';
import { IProcessoSeletivo } from './processo-seletivo';

export interface IEtapa {
    id: number;
    titulo: string;
    descricao: string;
    data: string;
    candidatos: ICandidato[];
    processoSeletivo: IProcessoSeletivo;
}
