import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { ModalConfirmarExclusaoGenericoComponent } from 'src/app/shared/modais/modal-confirmar-excluir-generico/modal-confirmar-exclusao-generico/modal-confirmar-exclusao-generico.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { Usuario } from 'src/app/shared/models/usuario';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDemanda } from '../models/demanda';
import { Escola } from '../models/escola';
import { DemandaService } from '../services/demanda.service';
import { EscolaService } from '../services/escola.service';

@Component({
  selector: 'app-demanda',
  templateUrl: './demanda.component.html',
  styleUrls: ['./demanda.component.scss']
})
export class DemandaComponent implements OnInit {
  demandas: IDemanda[] = []

  constructor(private escolaService: EscolaService, private authService: AuthService, private router: Router, private demandaService: DemandaService, private notificacaoService: NotificacaoService) {
    
  }

  ngOnInit(): void {
    this.carregar();
  }
  
  carregar() {

    this.authService.usuarioLogado.subscribe( (usuario: Usuario) => {
      this.escolaService.carregarEscolaDoUsuarioLogado(usuario.email).subscribe(res => {
        if (res.body && res.ok) {
          const esc: Escola = res.body;
          this.escolaService.escola$.next(new Escola(esc.id, esc.nome));

          this.demandaService.carregarDemandasDaEscola(esc.id).subscribe( res => {
            if (res.body && res.ok) {
              this.demandas = res.body;
            }
          })
        }
      })
    })
  }

  criar() {
    this.router.navigate(['/escola/nova-demanda'])
  }

  visualizar(demanda: IDemanda) {
    this.router.navigate(['/escola/demanda', demanda.id], {state: {data: demanda, modo: 'visualizacao'}});
  }

  editar(demanda: IDemanda) {
    this.router.navigate(['/escola/demanda', demanda.id], {state: {data: demanda, modo: 'edicao'}});
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
