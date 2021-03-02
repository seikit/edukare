import { HttpErrorResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';
import { ProcessoSeletivoService } from 'src/app/secretaria/processo-seletivo/processo-seletivo.service';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { ModalConfirmacaoComponent } from 'src/app/shared/modais/modal-confirmacao/modal-confirmacao.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { Usuario } from 'src/app/shared/models/usuario';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { InscricoesService } from '../inscricoes/inscricoes.service';

@Component({
  selector: 'app-processos',
  templateUrl: './processos.component.html',
  styleUrls: ['./processos.component.scss']
})
export class ProcessosComponent implements OnInit {
  processos: IProcessoSeletivo[];  
  usuarioLogado: Usuario = new Usuario();

  constructor(private authService: AuthService, private notificacaoService: NotificacaoService,private processoService: ProcessoSeletivoService, private route: ActivatedRoute, private router: Router, private inscricoesService : InscricoesService) {
    this.processos = [];    
    this.authService.usuarioLogado.subscribe((usu: Usuario) => {
      this.usuarioLogado = usu;
    })
  }

  ngOnInit(): void {    
    this.carregarProcessos();
  }

  carregarProcessos() {
    this.processoService.carregar().subscribe(data => {
      if (data.ok && data.body) {
        this.processos = data.body;
      }
    })
  }

  enviar(proc: IProcessoSeletivo) {    
    this.inscricoesService.carregarInscricoesAtivas(proc.id, this.usuarioLogado.email).subscribe(res => {
      if (res.body && res.ok) {    
        this.notificacaoService.abrirModal(ModalConfirmacaoComponent, {data: {titulo: 'Confirmar operação ?', mensagem: 'Você já possui uma inscrição realizada neste processo seletivo. Somente a última inscrição realizada será válida, deseja continuar ?'}}).afterClosed().subscribe( (acao :boolean) => {
          if (acao === true) {
            this.inscrever(proc);         
          }
        })
      }            
    }, (erro: HttpErrorResponse) => {
      if (erro.status === 404) {
        this.notificacaoService.abrirModal(ModalConfirmacaoComponent, {data: {titulo: 'Deseja inscrever-se neste processo seletivo ?', mensagem: 'A inscrição será realizada usando seus dados pessoais previamente cadastrados, caso queira revisá-los acesse o menu Dados Pessoais. Inscrever-se ?'}}).afterClosed().subscribe( (acao :boolean) => {
          if (acao === true) {
            this.inscrever(proc);         
          }
        })
      }
    })
    
  }

  inscrever(proc: IProcessoSeletivo) {    
    this.inscricoesService.inscrever(proc.id, this.usuarioLogado.email).subscribe(res => {
      if (res.ok && res.body) {
        const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Inscrição realizada com sucesso!"}})
        setTimeout(() => {
          modal.close();
          this.router.navigate(['candidato/inscricoes']);
        }, 3000)
      }
    })
  }
}
