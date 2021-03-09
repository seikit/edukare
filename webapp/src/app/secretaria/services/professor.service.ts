import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from 'src/environments/environment';
import { IProfessor } from '../models/professor';

type ResponseType = HttpResponse<IProfessor>;
type ArrayResponseType = HttpResponse<IProfessor[]>;

@Injectable({
  providedIn: 'root'
})
export class ProfessorService {  
  PROCESSO_URL = env.GATEWAY_URL + env.PROCESSO_MS_URL;

  constructor(private http: HttpClient) { }

  efetivarInscritosEm(professores: IProfessor[]): Observable<ArrayResponseType> {
    return this.http.post<IProfessor[]>(this.PROCESSO_URL + '/v1/professores', professores, { observe: 'response' });
  }

  carregarProfessores(): Observable<ArrayResponseType> {
    return this.http.get<IProfessor[]>(this.PROCESSO_URL + '/v1/professores', {observe: 'response'});
  }

  encaminharProfessorParaEscola(professores: IProfessor[]): Observable<ArrayResponseType> {    
    return this.http.post<IProfessor[]>(this.PROCESSO_URL + '/v1/professores/encaminhar', professores, {observe: 'response'});
  }

  carregarRelatorio() {
    return this.http.get(this.PROCESSO_URL + `/v1/professores/relatorio`, {responseType: 'arraybuffer', observe: 'body' } ).subscribe( res => {        
      const file = new Blob([res], {type: 'application/pdf'});
      const fileURL = URL.createObjectURL(file);
      window.open(fileURL, '_blank');
    });;
  }
}
