import { ITitulos } from "./titulos.model";

export interface IInscrito {
    id: number;
    nomeCompleto: string;
    processoSeletivoId: number;
    cpf: string;
    telefoneFixo: string;
    celular: string;
    email: string;
    rua: string;
    bairro: string;
    numero: number;
    titulos: ITitulos[];
}