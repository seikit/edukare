import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';
import { ProcessoSeletivoService } from 'src/app/secretaria/processo-seletivo/processo-seletivo.service';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { ModalConfirmacaoComponent } from 'src/app/shared/modais/modal-confirmacao/modal-confirmacao.component';
import { ModalPadraoComponent } from 'src/app/shared/modais/modal-padrao/modal-padrao.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { Usuario } from 'src/app/shared/models/usuario';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IInscricao } from '../models/inscricao';
import { InscricoesService } from './inscricoes.service';

@Component({
  selector: 'app-inscricoes',
  templateUrl: './inscricoes.component.html',
  styleUrls: ['./inscricoes.component.scss']
})
export class InscricoesComponent implements OnInit {  
  inscricoes: IInscricao[];
  usuarioLogado: Usuario = new Usuario();

  constructor(private authService: AuthService, private notificacaoService: NotificacaoService, private route: ActivatedRoute, private inscricoesService : InscricoesService, private processoService: ProcessoSeletivoService, private router: Router) {
    this.inscricoes = [];
    this.authService.usuarioLogado.subscribe((usu: Usuario) => {
      this.usuarioLogado = usu;
    })
   }

  ngOnInit(): void {    
    this.carregarInscricoes();
  }

  carregarInscricoes(): void {
    this.inscricoesService.carregarTodasInscricoes(this.usuarioLogado.email).subscribe( res => {
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

  exportarDadosInscricoes(): void {
    this.inscricoesService.exportarDadosInscricoes(this.usuarioLogado.email);
  }

  visualizar(inscricao: IInscricao): void {
    this.router.navigate(['candidato/inscricao', inscricao.id], {state: {data: inscricao}});
  }
}
