import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { IProcessoSeletivo, ProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';

@Component({
  selector: 'app-modal-confirmacao-cancelamento',
  templateUrl: './modal-confirmacao-cancelamento.component.html',
  styleUrls: ['./modal-confirmacao-cancelamento.component.scss']
})
export class ModalConfirmacaoCancelamentoComponent implements OnInit {
  processo: IProcessoSeletivo;
  numeroProcesso: FormControl;
  
  constructor(@Inject (MAT_DIALOG_DATA) public data: any, private ref: MatDialogRef<ModalConfirmacaoCancelamentoComponent>) {
    this.processo = new ProcessoSeletivo();
    this.numeroProcesso = new FormControl('', Validators.required);
  }

  ngOnInit(): void {
    if (this.data !== undefined) {
      this.processo = this.data.processo;
    }
  }

  cancelar(confirmacao: boolean) {
    this.ref.close(confirmacao);
  }
}
