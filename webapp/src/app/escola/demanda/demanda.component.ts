import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalConfirmarExclusaoGenericoComponent } from 'src/app/shared/modais/modal-confirmar-excluir-generico/modal-confirmar-exclusao-generico/modal-confirmar-exclusao-generico.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDemanda } from '../models/demanda';
import { DemandaService } from './demanda.service';

@Component({
  selector: 'app-demanda',
  templateUrl: './demanda.component.html',
  styleUrls: ['./demanda.component.scss']
})
export class DemandaComponent implements OnInit {
  demandas: IDemanda[] = []

  constructor(private router: Router, private demandaService: DemandaService, private notificacaoService: NotificacaoService) { }

  ngOnInit(): void {
    this.carregar();
  }
  
  carregar() {
    this.demandaService.carregar().subscribe(res => {
      if (res.ok && res.body) {        
        this.demandas = res.body;
      }
    });
  }

  criar() {
    this.router.navigate(['escola/1/nova'])
  }

  visualizar(demanda: IDemanda) {
    this.router.navigate(['/escola/1/demanda', demanda.id], {state: {data: demanda, modo: 'visualizacao'}});
  }

  editar(demanda: IDemanda) {
    this.router.navigate(['/escola/1/demanda', demanda.id], {state: {data: demanda, modo: 'edicao'}});
  }

  deletar(demanda: IDemanda) {
    this.notificacaoService.abrirModal(ModalConfirmarExclusaoGenericoComponent, {data: {'index': demanda.id, 'titulo': 'Excluir Demanda!'}}).afterClosed().subscribe(excluir => {
      if (excluir == true) {        
        this.demandaService.deletar(demanda.id).subscribe(res => {
          if (res.ok) {
            const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo:"Demanda excluída com sucesso!"}});
            setTimeout(() => {
              modal.close();
              modal.afterClosed().subscribe(() => this.carregar());
            }, 3000)
          }
        });
      }
    })
  }
}
