import { HttpClient, HttpResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, observable } from "rxjs";
import { UtilService } from "src/app/shared/util.service";
import { env } from "src/environments/environment";
import { IInscricao } from "../models/inscricao";

type ResponseType = HttpResponse<IInscricao>;
type ArrayResponseType = HttpResponse<IInscricao[]>;

@Injectable({
    providedIn: 'root'
})
export class InscricoesService {
    CANDIDATO_URL = env.GATEWAY_URL + env.CANDIDATO_MS_URL;
    
    constructor(private http: HttpClient, private utilService: UtilService) { }

    inscrever(processoId: number, email: string | undefined) {
        const inscricao: any = {'processoSeletivoId': processoId, 'emailUsuario': email}
        return this.http.post(this.CANDIDATO_URL + `/v1/inscricoes/`, inscricao, {observe: 'response'});        
    }

    carregarInscricoesAtivas(processoId: number, email: string | undefined) {
        const params = this.utilService.criarParametrosUrl({'processoSeletivoId': processoId, 'email': email})        
        return this.http.get(this.CANDIDATO_URL + `/v1/inscricoes/ativas/candidato`, {params: params, observe: 'response'});
    }

    carregarTodasInscricoes(email: string | undefined): Observable<ArrayResponseType> {
        const parametros = this.utilService.criarParametrosUrl({'email': email});
        return this.http.get<IInscricao[]>(this.CANDIDATO_URL + `/v1/inscricoes/candidato`, {params: parametros, observe: 'response'});
    }

    cancelarInscricao(inscricao: IInscricao): Observable<ResponseType> {
        return this.http.put<IInscricao>(this.CANDIDATO_URL + `/v1/inscricoes/`,inscricao, {observe: 'response'});
    }
    
}