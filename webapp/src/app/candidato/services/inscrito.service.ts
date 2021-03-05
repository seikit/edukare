import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { IInscrito } from 'src/app/secretaria/models/inscrito.model';
import { env } from 'src/environments/environment';

type ResponseType = HttpResponse<IInscrito>;
type ArrayResponseType = HttpResponse<IInscrito[]>;

@Injectable({
  providedIn: 'root'
})
export class CandidatoService {
  CANDIDATO_URL = env.GATEWAY_URL + env.CANDIDATO_MS_URL;

  constructor(private http: HttpClient) { }

  carregarCandidatosDoProcesso(processoId: number | undefined): Observable<ArrayResponseType> {
    return this.http.get<IInscrito[]>(this.CANDIDATO_URL + `/v1/inscricoes/processo/${processoId}`, {observe: 'response'});
  }
}
