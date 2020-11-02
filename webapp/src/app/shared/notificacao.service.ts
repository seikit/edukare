import { Component, Injectable } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ModalPadraoComponent } from './modais/modal-padrao/modal-padrao.component';

@Injectable({
  providedIn: 'root'
})
export class NotificacaoService {

  constructor(private _snackBar: MatSnackBar, private modal: MatDialog) {}

  abrirSnackBar(mensagem: string, acao: string = 'Fechar', duracao = 2000) {
    this._snackBar.open(mensagem, acao, { duration: duracao });
  }

  abrirModal(componenteModal: any, dados?: {}) {
    return this.modal.open(componenteModal, dados);
  }
}
