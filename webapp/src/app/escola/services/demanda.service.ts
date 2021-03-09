import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UtilService } from 'src/app/shared/util.service';
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
  
  constructor(private http: HttpClient, private util: UtilService) { }

  carregarDemandasDaEscola(id: number | undefined): Observable<ArrayResponseType> {
    return this.http.get<IDemanda[]>(this.ESCOLA_URL + `/v1/demandas/escola/${id}`, { observe: 'response' } );
  } 
  
  carregar(): Observable<ArrayResponseType> {       
    return this.http.get<IDemanda[]>(this.ESCOLA_URL + '/v1/demandas', { observe: 'response' });
  }
  
  criar(demanda: IDemanda): Observable<ResponseType> {    
    return this.http.post<IDemanda>(this.ESCOLA_URL + '/v1/demandas', demanda, {observe: 'response'});
  }

  carregarDisciplinasAtivas() {
    return this.http.get<IDisciplina[]>(this.ESCOLA_URL + '/v1/disciplinas/ativas', {observe: 'response'});
  }

  deletar(demandaId: number) {
    return this.http.delete<IDemanda>(this.ESCOLA_URL + `/v1/demandas/${demandaId}`, {observe: 'response'});
  }

  editar(demanda: IDemanda) {
    return this.http.put<IDemanda>(this.ESCOLA_URL + '/v1/demandas', demanda, {observe: 'response'});
  }

  carregarRelatorio(escolaId: number | undefined) {
    const parametro = this.util.criarParametrosUrl({'escolaId': escolaId});
    return this.http.get(this.ESCOLA_URL + `/v1/demandas/relatorio`, {params:  parametro, responseType: 'arraybuffer', observe: 'body' } ).subscribe( res => {        
      const file = new Blob([res], {type: 'application/pdf'});
      const fileURL = URL.createObjectURL(file);
      window.open(fileURL, '_blank');
    });;
  }
}
