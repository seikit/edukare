import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-modal-confirmacao',
  templateUrl: './modal-confirmacao.component.html',
  styleUrls: ['./modal-confirmacao.component.scss']
})
export class ModalConfirmacaoComponent implements OnInit {

  titulo: string;
  mensagem: string;

  constructor(@Inject (MAT_DIALOG_DATA) private data: any, private ref: MatDialogRef<ModalConfirmacaoComponent>) {
    this.titulo = '';
    this.mensagem = '';
  }

  ngOnInit(): void {    
    if (this.data) {
      this.titulo = this.data.titulo;
      this.mensagem = this.data.mensagem;
    }
  }

  confirmar(acao: boolean) {
    this.ref.close(acao);
  }

}
