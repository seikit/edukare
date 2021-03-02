import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from 'src/environments/environment';
import { IDemanda  } from '../models/demanda';
import { IDisciplina  } from '../models/disciplina';

type ResponseType = HttpResponse<IDemanda>;
type ArrayResponseType = HttpResponse<IDemanda[]>;

@Injectable({
  providedIn: 'root'
})
export class DemandaService {  
  ESCOLA_URL = env.GATEWAY_URL + env.ESCOLA_MS_URL;
  
  constructor(private http: HttpClient) { }

  carregarDemandasDaEscola(id: number | undefined): Observable<ArrayResponseType> {
    return this.http.get<IDemanda[]>(this.ESCOLA_URL + `/v1/demandas/escola/${id}`, { observe: 'response' } );
  } 
  
  carregar(): Observable<ArrayResponseType> {       
    return this.http.get<IDemanda[]>(this.ESCOLA_URL + '/v1/demandas', { observe: 'response' });
  }
  
  criar(demanda: IDemanda): Observable<ResponseType> {    
    return this.http.post<IDemanda>(this.ESCOLA_URL + '/v1/demandas', demanda, {observe: 'response'});
  }

  carregarDisciplinas() {
    return this.http.get<IDisciplina[]>(this.ESCOLA_URL + '/v1/disciplinas', {observe: 'response'});
  }

  deletar(demandaId: number) {
    return this.http.delete<IDemanda>(this.ESCOLA_URL + `/v1/demandas/${demandaId}`, {observe: 'response'});
  }

  editar(demanda: IDemanda) {
    return this.http.put<IDemanda>(this.ESCOLA_URL + '/v1/demandas', demanda, {observe: 'response'});
  }
}
