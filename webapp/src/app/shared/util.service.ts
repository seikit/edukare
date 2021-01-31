import { DatePipe } from '@angular/common';
import { HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  constructor(private datePipe: DatePipe) { }

  converterDataTimeParaData(data: string): string {
    const dt =  this.datePipe.transform(data, "yyyy-MM-dd");
    return dt ? dt : "";
  }

  criarParametrosUrl(params: any) {    
    let httpParams = new HttpParams();
    if (params) {
      Object.keys(params).forEach( chave => {
        httpParams = httpParams.set(chave, params[chave]);
      })
    }    
    return httpParams;
  }
}
