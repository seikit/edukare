import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-modal-confirmar-exclusao-generico',
  templateUrl: './modal-confirmar-exclusao-generico.component.html',
  styleUrls: ['./modal-confirmar-exclusao-generico.component.scss']
})
export class ModalConfirmarExclusaoGenericoComponent implements OnInit {
  numeroDigitado: FormControl;
  indexItemSelecionado: number;
  titulo: String;

  constructor(@Inject (MAT_DIALOG_DATA) public data: any, private ref: MatDialogRef<ModalConfirmarExclusaoGenericoComponent> ) {
    this.numeroDigitado = new FormControl('', Validators.required);
    this.titulo = '';
    this.indexItemSelecionado = 0;
  }

  ngOnInit(): void {
    if (this.data !== undefined) {      
      this.indexItemSelecionado = this.data.index;
      this.titulo = this.data.titulo;
    }
  }

  excluir(confirmacao: boolean) {
    this.ref.close(confirmacao);
  }

}
