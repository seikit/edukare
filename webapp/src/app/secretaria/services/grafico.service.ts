import { HttpClient, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { env } from 'src/environments/environment';
import { IGraficoDemanda } from '../models/grafico-demanda';

type ResponseType = HttpResponse<IGraficoDemanda>;
type ArrayResponseType = HttpResponse<IGraficoDemanda[]>;

@Injectable({
  providedIn: 'root'
})
export class GraficoService {
  ESCOLA_URL = env.GATEWAY_URL + env.ESCOLA_MS_URL;

  constructor(private http: HttpClient) { }

  carregarDemandas(): Observable<ArrayResponseType> {
    return this.http.get<IGraficoDemanda[]>(this.ESCOLA_URL + '/v1/demandas/grafico', {observe: 'response'});
  }
}
