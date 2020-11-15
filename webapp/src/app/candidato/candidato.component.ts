import { Component, OnInit } from '@angular/core';
import { IProcessoSeletivo, ProcessoSeletivo } from '../secretaria/models/processo-seletivo';
import { ProcessoSeletivoService } from '../secretaria/processo-seletivo/processo-seletivo.service';

@Component({
  selector: 'app-candidato',
  templateUrl: './candidato.component.html',
  styleUrls: ['./candidato.component.scss']
})
export class CandidatoComponent implements OnInit {
  processos: IProcessoSeletivo[];

  constructor(private processoSeletivoService: ProcessoSeletivoService) {
    this.processos = [];
   }

  ngOnInit(): void {
    this.carregarInscricoes();
  }

  carregarInscricoes() {
    this.processoSeletivoService.carregar().subscribe(data => {
      if (data.ok && data.body) {
        this.processos = data.body;
      }
    })
  }

  visualizar(proc: IProcessoSeletivo) {

  }

}
