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
  
  carregar() {    
    // const dadosTeste: IProcessoSeletivo[] = [
    //   {id: 1, dtInicioInscricao: '01/10/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 2, dtInicioInscricao: '15/07/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 3, dtInicioInscricao: '01/11/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 4, dtInicioInscricao: '01/06/2019',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 5, dtInicioInscricao: '01/10/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 6, dtInicioInscricao: '15/07/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 7, dtInicioInscricao: '01/11/2020',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    //   {id: 8, dtInicioInscricao: '01/06/2019',dtEncerramentoInscricao:'01/11/2020',titulo: 'Processo seletivo de professores temporários'},
    // ];

    // return dadosTeste;
  }

  deletar(processoId: number | undefined): number {
    throw new Error('Method not implemented.');
  }

  cancelar(processoId: any) {
    throw new Error('Method not implemented.');
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
