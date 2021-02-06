import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { IProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';
import { ProcessoSeletivoService } from 'src/app/secretaria/processo-seletivo/processo-seletivo.service';
import { ModalConfirmacaoComponent } from 'src/app/shared/modais/modal-confirmacao/modal-confirmacao.component';
import { ModalPadraoComponent } from 'src/app/shared/modais/modal-padrao/modal-padrao.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IInscricao } from '../models/inscricao';
import { InscricoesService } from './inscricoes.service';

@Component({
  selector: 'app-inscricoes',
  templateUrl: './inscricoes.component.html',
  styleUrls: ['./inscricoes.component.scss']
})
export class InscricoesComponent implements OnInit {
  candidatoId: number = 0;
  inscricoes: IInscricao[];

  constructor(private notificacaoService: NotificacaoService, private route: ActivatedRoute, private inscricoesService : InscricoesService, private processoService: ProcessoSeletivoService) {
    this.inscricoes = [];
   }

  ngOnInit(): void {
    const candidatoId = this.route.snapshot.paramMap.get('id');
    if (candidatoId) {
      this.candidatoId = Number.parseInt(candidatoId);
    }
    this.carregarInscricoes();
  }

  carregarInscricoes(): void {
    this.inscricoesService.carregarTodasInscricoes(this.candidatoId).subscribe( res => {
      if (res.ok && res.body) {
        this.inscricoes = res.body;
      }
    })
  }

  cancelar(inscricao: IInscricao): void {
    this.notificacaoService.abrirModal(ModalConfirmacaoComponent, {data: {titulo: 'Deseja cancelar a inscrição ?', mensagem: ''}}).afterClosed().subscribe(cancelar => {
      if (cancelar === true) {        
          this.inscricoesService.cancelarInscricao(inscricao).subscribe(res =>{            
            if (res.body && res.ok) {
              this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: 'Inscrição cancelada com sucesso!'}}).afterClosed().subscribe(() => {
                this.carregarInscricoes();
              })
            } else {
              this.notificacaoService.abrirModal(ModalPadraoComponent, {data: {titulo: 'Atenção!', mensagem: 'Não foi possível efetuar o cancelamento.'}})
            }
          })
      }
    })
      
  }

  

}
