import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalConfirmarCancelamentoExclusaoComponent } from 'src/app/shared/modais/modal-confirmar-cancelamento-exclusao/modal-confirmar-cancelamento-exclusao.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IProcessoSeletivo } from '../models/processo-seletivo';
import { ProcessoSeletivoService } from './processo-seletivo.service';

@Component({
  selector: 'app-processo-seletivo',
  templateUrl: './processo-seletivo.component.html',
  styleUrls: ['./processo-seletivo.component.scss']
})

export class ProcessoSeletivoComponent implements OnInit {
  processos: IProcessoSeletivo[] = []; 

  constructor(private processoSeletivoService: ProcessoSeletivoService, private router: Router, private notificacaoService: NotificacaoService) { }

  ngOnInit(): void {
    this.carregar();
  }
  
  carregar() {
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
    this.router.navigate(['/processo-seletivo', processo.id], {state: {data: processo, modo: 'visualizacao'}});
  }

  editar(processo: IProcessoSeletivo) {
    this.router.navigate(['/processo-seletivo', processo.id], {state: {data:processo, modo: 'edicao'}});
  }

  selecionarCandidato(processo: IProcessoSeletivo) {
    this.router.navigate(['/processo-seletivo/selecao'], {state: {data: processo}});
  }

  deletar(processo: IProcessoSeletivo) {
    if (processo.situacao !== 'CANCELADO') {
      this.notificacaoService.abrirModal(ModalConfirmarCancelamentoExclusaoComponent, {data: [{processo},{titulo: 'Exclusão de processo seletivo'}]}).afterClosed().subscribe(excluir => {
        if (excluir == true) {
          this.processoSeletivoService.deletar(processo.id).subscribe(resp => {
            if (resp.ok) {
              const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: 'Processo seletivo excluído com sucesso'}})
              setTimeout(() => {                
                modal.close();
                this.carregar();
              }, 3000)
              modal.afterClosed().subscribe(() => {
                this.carregar();
              })
            }
          });
        }
      })
    }
  }

  cancelar(processo: IProcessoSeletivo) {
    this.notificacaoService.abrirModal(ModalConfirmarCancelamentoExclusaoComponent, {data: [{processo}, {titulo: 'Cancelamento processo seletivo'}]}).afterClosed().subscribe(cancelar => {
      
      if (cancelar == true) {
        this.processoSeletivoService.cancelar(processo).subscribe(resp => {
          if (resp.ok) {
            const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Processo seletivo cancelado!"}})
            setTimeout(() => {
              modal.close();
            }, 3000)
          }
        });
      }
    });
  }

  exportarDadosProcessos(): void {    
    this.processoSeletivoService.exportarDadosProcesso();
  }
}