import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from 'src/environments/environment';
import { IDisciplina } from '../models/disciplina';

type ResponseType = HttpResponse<IDisciplina>;
type ArrayResponseType = HttpResponse<IDisciplina[]>;

@Injectable({
  providedIn: 'root'
})
export class DisciplinasService {
  ESCOLA_URL = env.GATEWAY_URL + env.ESCOLA_MS_URL;

  constructor(private http: HttpClient) { }

  carregar(): Observable<ArrayResponseType> {
    return this.http.get<IDisciplina[]>(this.ESCOLA_URL + '/v1/disciplinas', {observe: 'response'});
  }

  criar(disciplina: IDisciplina): Observable<ResponseType> {
    return this.http.post<IDisciplina>(this.ESCOLA_URL + '/v1/disciplinas', disciplina, {observe: 'response'});
  }

  editar(disciplina: IDisciplina): Observable<ResponseType> {
    return this.http.put<IDisciplina>(this.ESCOLA_URL + '/v1/disciplinas', disciplina, {observe: 'response'});
  }

  deletar(disciplinaId: number): Observable<any> {
    return this.http.delete(this.ESCOLA_URL + `/v1/disciplinas/${disciplinaId}`, {observe: 'response'});
  }


}
