import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UtilService } from 'src/app/shared/util.service';
import { env } from 'src/environments/environment';
import { IProcessoSeletivo } from '../models/processo-seletivo';

type ResponseType = HttpResponse<IProcessoSeletivo>;
type ArrayResponseType = HttpResponse<IProcessoSeletivo[]>;

@Injectable({
  providedIn: 'root'
})
export class ProcessoSeletivoService {
  PROCESSO_URL = env.GATEWAY_URL + env.PROCESSO_MS_URL;

  constructor(private http: HttpClient, private util: UtilService) { }

  criar(processo: IProcessoSeletivo): Observable<ResponseType> {
    const obj = this.converterDataParaDataServidor(processo);
    return this.http.post<IProcessoSeletivo>( this.PROCESSO_URL + '/processo', obj, { observe: 'response'});
  }
  
  carregar(): Observable<ArrayResponseType> {    
    return this.http.get<IProcessoSeletivo[]>(this.PROCESSO_URL + '/processos', { observe: 'response' });
  }

  deletar(processoId: number | undefined): number {
    throw new Error('Method not implemented.');
  }

  cancelar(processoId: any) {
    throw new Error('Method not implemented.');
  }

  atualizar(processo: IProcessoSeletivo): Observable<ResponseType> { 
    const obj = this.converterDataParaDataServidor(processo);
    return this.http.put<IProcessoSeletivo>(this.PROCESSO_URL + '/processo', obj, {observe: 'response'});
  }

  converterDataParaDataServidor(processo: IProcessoSeletivo): IProcessoSeletivo | undefined {
    if (processo == undefined) return undefined;
    
    processo.dtInicioInscricao = this.util.converterDataTimeParaData(processo.dtInicioInscricao);
    processo.dtEncerramentoInscricao = this.util.converterDataTimeParaData(processo.dtEncerramentoInscricao);

    processo.etapas.forEach(e => {
      e.data = this.util.converterDataTimeParaData(e.data);
    })
    return processo;
  }

}
