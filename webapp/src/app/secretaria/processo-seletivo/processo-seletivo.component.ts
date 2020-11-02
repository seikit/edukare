import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { IProcessoSeletivo } from '../models/processo-seletivo';
import { ProcessoSeletivoService } from './processo-seletivo.service';

@Component({
  selector: 'app-processo-seletivo',
  templateUrl: './processo-seletivo.component.html',
  styleUrls: ['./processo-seletivo.component.scss']
})

export class ProcessoSeletivoComponent implements OnInit {
  processos: IProcessoSeletivo[] = []; 

  constructor(private processoSeletivoService: ProcessoSeletivoService, private router: Router) { }

  ngOnInit(): void {
    this.processoSeletivoService.carregar().subscribe(resp => {
      if (resp.ok) {
        this.processos =  resp.body ? resp.body : [];
      }
    });
  }

  criar() {
    this.router.navigate(['/processo-seletivo/novo'])
  }

  visualizar(processo: IProcessoSeletivo) {
    this.router.navigate(['/processo-seletivo', processo.id])
  }

  editar(processo: IProcessoSeletivo) {
    this.router.navigate(['/processo-seletivo', processo.id])
  }

  deletar(processo: IProcessoSeletivo) {
    this.processoSeletivoService.deletar(processo.id);
  }

  cancelar(processo: IProcessoSeletivo) {
    this.processoSeletivoService.cancelar(processo.id);
  }
}