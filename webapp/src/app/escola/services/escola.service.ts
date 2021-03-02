import { HttpClient, HttpResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject, Observable } from "rxjs";
import { UtilService } from "src/app/shared/util.service";
import { env } from "src/environments/environment";
import { Escola } from "../models/escola";

type ResponseType = HttpResponse<Escola>;
type ArrayResponseType = HttpResponse<Escola[]>;

@Injectable({
    providedIn: 'root'
})
export class EscolaService {
    ESCOLA_URL = env.GATEWAY_URL + env.ESCOLA_MS_URL;
    escola$ = new BehaviorSubject<Escola>(new Escola());    
  
    constructor(private http: HttpClient, private utilService: UtilService) { }
    
    carregarEscolaDoUsuarioLogado(email: string | undefined): Observable<ResponseType> {
        const parametros = this.utilService.criarParametrosUrl({'email': email});
        return this.http.get<Escola>(this.ESCOLA_URL + '/v1/escolas', {params: parametros, observe: 'response'});
    }
}