import { DatePipe } from '@angular/common';
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
}
