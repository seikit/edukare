import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from '../../../environments/environment';
import { IProcessoSeletivo } from '../models/processo-seletivo';

type ResponseType = HttpResponse<IProcessoSeletivo>;
type ArrayResponseType = HttpResponse<IProcessoSeletivo[]>;

@Injectable({
  providedIn: 'root'
})
export class ProcessoSeletivoService {
  API_URL = env.apiUrl + 'processo-seletivo';

  constructor(private http: HttpClient) { }

  criar(processo: IProcessoSeletivo): Observable<ResponseType> {
    return this.http.post<IProcessoSeletivo>(this.API_URL, processo, { observe: 'response'});
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

  deletar(processoId: number): number {
    throw new Error('Method not implemented.');
  }

  cancelar(processoId: any) {
    throw new Error('Method not implemented.');
  }

  
}
