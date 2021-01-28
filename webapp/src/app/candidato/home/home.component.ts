import { Component, OnInit } from '@angular/core';
import { IProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';
import { ProcessoSeletivoService } from 'src/app/secretaria/processo-seletivo/processo-seletivo.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  processos: IProcessoSeletivo[];

  constructor(private processoService: ProcessoSeletivoService) {
    this.processos = [];
  }

  ngOnInit(): void {
    this.carregarInscricoes();
  }

  carregarInscricoes() {
    this.processoService.carregar().subscribe(data => {
      if (data.ok && data.body) {
        this.processos = data.body;
      }
    })
  }

  inscrever(proc: IProcessoSeletivo) {

  }

}
