import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-modal-sucesso',
  templateUrl: './modal-sucesso.component.html',
  styleUrls: ['./modal-sucesso.component.scss']
})
export class ModalSucessoComponent implements OnInit {
  titulo: string = "Título";

  constructor(@Inject (MAT_DIALOG_DATA) public data: any) { }

  ngOnInit(): void {
    if (this.data.titulo) {
      this.titulo = this.data.titulo;
    }
  }

}
