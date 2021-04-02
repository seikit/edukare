import { Component, OnInit } from '@angular/core';
import { IInscricao, Inscricao } from '../models/inscricao';

@Component({
  selector: 'app-inscricao-detalhes',
  templateUrl: './inscricao-detalhes.component.html',
  styleUrls: ['./inscricao-detalhes.component.scss']
})
export class InscricaoDetalhesComponent implements OnInit {
  inscricao: IInscricao = new Inscricao();

  constructor() { }

  ngOnInit(): void {
    this.inscricao = history.state?.data;
  }

}
