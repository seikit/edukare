import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from 'src/environments/environment';
import { IGraficoSeries } from '../models/grafico-demanda';

type ResponseType = HttpResponse<IGraficoSeries>;
type ArrayResponseType = HttpResponse<IGraficoSeries[]>;

@Injectable({
  providedIn: 'root'
})
export class GraficoService {
  ESCOLA_URL = env.GATEWAY_URL + env.ESCOLA_MS_URL;
  CANDIDATO_URL = env.GATEWAY_URL + env.CANDIDATO_MS_URL;

  constructor(private http: HttpClient) { }

  carregarDemandas(): Observable<ArrayResponseType> {
    return this.http.get<IGraficoSeries[]>(this.ESCOLA_URL + '/v1/demandas/grafico', {observe: 'response'});
  }

  carregarInscritos(): Observable<ArrayResponseType> {
    return this.http.get<IGraficoSeries[]>(this.CANDIDATO_URL + '/v1/inscricoes/grafico', {observe: 'response'});
  }
}
