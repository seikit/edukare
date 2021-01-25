import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ICandidatos } from 'src/app/secretaria/models/candidatos.model';
import { env } from 'src/environments/environment';
import { IDadosCandidato } from '../models/dados-candidato';

type ResponseType = HttpResponse<ICandidatos>;
type ArrayResponseType = HttpResponse<ICandidatos[]>;

@Injectable({
  providedIn: 'root'
})
export class DadosPessoaisService {
  CANDIDATO_URL = env.GATEWAY_URL + env.CANDIDATO_MS_URL;

  constructor(private http: HttpClient) { }

  criar(candidato: IDadosCandidato): Observable<ResponseType> {    
    return this.http.post<IDadosCandidato>(this.CANDIDATO_URL + '/v1/candidatos', candidato, {observe: 'response'})
  }
}
