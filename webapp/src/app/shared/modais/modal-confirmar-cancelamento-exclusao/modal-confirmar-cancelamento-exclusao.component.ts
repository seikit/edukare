import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { IProcessoSeletivo, ProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';

@Component({
  selector: 'app-modal-confirmar-cancelamento-exclusao',
  templateUrl: './modal-confirmar-cancelamento-exclusao.component.html',
  styleUrls: ['./modal-confirmar-cancelamento-exclusao.component.scss']
})
export class ModalConfirmarCancelamentoExclusaoComponent implements OnInit {
  processo: IProcessoSeletivo;
  numeroProcesso: FormControl;
  titulo: String;
  
  constructor(@Inject (MAT_DIALOG_DATA) public data: any, private ref: MatDialogRef<ModalConfirmarCancelamentoExclusaoComponent>) {
    this.processo = new ProcessoSeletivo();
    this.numeroProcesso = new FormControl('', Validators.required);
    this.titulo = '';
  }

  ngOnInit(): void {
    if (this.data !== undefined) {
      this.processo = this.data[0].processo;
      this.titulo = this.data[1].titulo;
    }
  }

  cancelar(confirmacao: boolean) {
    this.ref.close(confirmacao);
  }
}
