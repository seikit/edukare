import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, pipe } from 'rxjs';
import { IProcessoSeletivo } from '../models/processo-seletivo';
import { env } from '../../../environments/environment';

type ResponseType = HttpResponse<IProcessoSeletivo>;
type ArrayResponseType = HttpResponse<IProcessoSeletivo[]>;

@Injectable({
  providedIn: 'root'
})
export class ProcessoSeletivoService {
  API_URL = env.apiUrl + 'processo-seletivo';

  constructor(private http: HttpClient) { }

  criarSalvar(processo: IProcessoSeletivo): Observable<ResponseType> {
    return this.http.post<IProcessoSeletivo>(this.API_URL, processo, { observe: 'response'});
  }
  
  carregar(): IProcessoSeletivo[] {
    const dadosTeste: IProcessoSeletivo[] = [
      {id: 1, dtAberturaProcesso: '01/10/2020'},
      {id: 2, dtAberturaProcesso: '15/07/2020'},
      {id: 3, dtAberturaProcesso: '01/11/2020'},
      {id: 4, dtAberturaProcesso: '01/06/2019'},
      {id: 5, dtAberturaProcesso: '01/10/2020'},
      {id: 6, dtAberturaProcesso: '15/07/2020'},
      {id: 7, dtAberturaProcesso: '01/11/2020'},
      {id: 8, dtAberturaProcesso: '01/06/2019'},
    ];

    return dadosTeste;
  }

  deletar(processoId: number): number {
    throw new Error('Method not implemented.');
  }

  cancelar(processoId: any) {
    throw new Error('Method not implemented.');
  }

  
}
