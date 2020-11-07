import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalConfirmacaoCancelamentoComponent } from 'src/app/shared/modais/modal-confirmacao-cancelamento/modal-confirmacao-cancelamento.component';
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
    this.router.navigate(['/processo-seletivo', processo.id], {state: {data:processo}} );
  }

  deletar(processo: IProcessoSeletivo) {
    this.processoSeletivoService.deletar(processo.id);
  }

  cancelar(processo: IProcessoSeletivo) {
    this.notificacaoService.abrirModal(ModalConfirmacaoCancelamentoComponent, {data: {processo}}).afterClosed().subscribe(cancelar => {
      
      if (cancelar == true) {
        this.processoSeletivoService.cancelar(processo).subscribe(resp => {
          if (resp.ok) {
            const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Processo seletivo cancelado!"}})
            setTimeout(() => {
              modal.close();
              modal.afterClosed().subscribe(() => {
                this.router.navigate(['/processo-seletivo']);
              })
            }, 3000)
    
          }
        });
      }
    });

  }
}