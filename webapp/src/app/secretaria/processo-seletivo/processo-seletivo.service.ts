import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { UtilService } from 'src/app/shared/util.service';
import { env } from 'src/environments/environment';
import { IProcessoSeletivo } from '../models/processo-seletivo';
import { Situacao } from '../models/situacao.enum';

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
    return this.http.post<IProcessoSeletivo>( this.PROCESSO_URL + '/v1/processos', obj, { observe: 'response'});
  }
  
  carregar(): Observable<ArrayResponseType> {    
    return this.http.get<IProcessoSeletivo[]>(this.PROCESSO_URL + '/v1/processos/abertos', { observe: 'response' });
  }

  deletar(id: number | undefined): Observable<ResponseType> {
    return this.http.delete<IProcessoSeletivo>(this.PROCESSO_URL + `/v1/processos/${id}`, {observe: 'response'});
  }

  cancelar(processo: IProcessoSeletivo): Observable<ResponseType> {
    processo.situacao = Situacao.CANCELADO;
    return this.atualizar(processo);
  }

  atualizar(processo: IProcessoSeletivo): Observable<ResponseType> { 
    const obj = this.converterDataParaDataServidor(processo);
    return this.http.put<IProcessoSeletivo>(this.PROCESSO_URL + '/v1/processos', obj, {observe: 'response'});
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

  carregarProcessoPorId(processoId: number): Observable<ResponseType> {
    return this.http.get<IProcessoSeletivo>(this.PROCESSO_URL + `/v1/processos/${processoId}`, {observe: 'response'});
  }

  exportarDadosProcesso() {
    return this.http.get(this.PROCESSO_URL + '/v1/processos/relatorio', { responseType: 'arraybuffer', observe: 'body'}).subscribe( res => {
      const file = new Blob([res], {type: 'application/pdf'});
      const fileURL = URL.createObjectURL(file);
      window.open(fileURL, '_blank');
    });
  }
}
