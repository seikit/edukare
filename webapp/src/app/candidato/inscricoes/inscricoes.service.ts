import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { observable } from "rxjs";
import { UtilService } from "src/app/shared/util.service";
import { env } from "src/environments/environment";
import { IInscricao } from "../models/inscricao";

@Injectable({
    providedIn: 'root'
})
export class InscricoesService {
    CANDIDATO_URL = env.GATEWAY_URL + env.CANDIDATO_MS_URL;
    
    constructor(private http: HttpClient, private utilService: UtilService) { }

    inscrever(processoId: number, candidatoId: number) {
        const inscricao: IInscricao = {'processoSeletivoId': processoId, 'candidatoId': candidatoId}
        return this.http.post(this.CANDIDATO_URL + `/v1/inscricoes/`, inscricao, {observe: 'response'});        
    }

    carregarInscricoesAtivas(processoId: number, candidatoId: number) {
        const params = this.utilService.criarParametrosUrl({'processoSeletivoId': processoId, 'candidatoId': candidatoId})        
        return this.http.get(this.CANDIDATO_URL + `/v1/inscricoes/ativas/candidato`, {params: params, observe: 'response'});
    }
    
}