import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-modal-padrao',
  templateUrl: './modal-padrao.component.html',
  styleUrls: ['./modal-padrao.component.scss']
})
export class ModalPadraoComponent implements OnInit {
  titulo: string = "Titulo padrão";
  mensagem: string = "Mensagem padrão";

  constructor(@Inject(MAT_DIALOG_DATA) public data: any, private ref: MatDialogRef<ModalPadraoComponent>) { }
  

  ngOnInit(): void {
    if (this.data != "") {
      this.titulo = this.data.titulo;
      this.mensagem = this.data.mensagem;
    }
  }

  fechar():void {
    this.ref.close();
  }

}
