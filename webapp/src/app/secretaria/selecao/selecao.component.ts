import { Component, OnInit } from '@angular/core';
import { CandidatoService } from 'src/app/candidato/services/inscrito.service';
import { IInscrito } from '../models/inscrito.model';
import { IProcessoSeletivo } from '../models/processo-seletivo';

import {SelectionModel} from '@angular/cdk/collections';
import {MatTableDataSource} from '@angular/material/table';
import { ProfessorService } from '../services/professor.service';
import { IProfessor, Professor } from '../models/professor';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { ModalConfirmacaoComponent } from 'src/app/shared/modais/modal-confirmacao/modal-confirmacao.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-selecao',
  templateUrl: './selecao.component.html',
  styleUrls: ['./selecao.component.scss']
})
export class SelecaoComponent implements OnInit {
  processo: IProcessoSeletivo;
  inscritos: IInscrito[] = [];  
  colunas: string[] = ['selecao', 'nome', 'cpf', 'processoId', 'celular', 'email'];  
  selecionados = new SelectionModel<IInscrito>(true, []);
  dados: any;

  constructor(private router: Router, private notificacaoService: NotificacaoService, private candidatoService: CandidatoService, private professorService: ProfessorService) {
    this.processo = history.state?.data;
  }

  ngOnInit(): void {
    this.carregarInscricoes();    
  }

  carregarInscricoes(): void {
    this.candidatoService.carregarCandidatosDoProcesso(this.processo.id).subscribe(res => {
      if(res.ok && res.body) {
        this.inscritos = res.body;   
        this.dados = new MatTableDataSource<IInscrito>(res.body);         
      }
    })
  }

  efetivarSelecionadosEmProfessores(): void {
    this.notificacaoService.abrirModal(ModalConfirmacaoComponent, {data: {titulo: 'Deseja efetivar os candidatos selecionados ?', mensagem: ''}}).afterClosed().subscribe(efetivar => {
      if (efetivar === true) {                  
        const selecionados = this.selecionados.selected;
        const p = this.processo;
        const processoId = p.id != undefined ? p.id : 0;
        const professores: IProfessor[] = [];
    
        selecionados.forEach( (i: IInscrito) => {
          professores.push(new Professor(processoId, p.titulo, i.id, i.nomeCompleto, i.cpf, i.celular, i.telefoneFixo, i.email, false));      
        });
    
        this.professorService.efetivarInscritosEm(professores).subscribe( res => {
          if (res.ok) {
            this.selecionados.clear();
            this.router.navigate(['processo-seletivo']);
          }
        });
      }
    })

  }
  
  todosSelecionados() {
    const numSelected = this.selecionados.selected.length;
    const numRows = this.dados.data.length;
    return numSelected === numRows;
  }
  
  toggleGeral() {
    this.todosSelecionados() ?
        this.selecionados.clear() :
        this.dados.data.forEach((row: any) => this.selecionados.select(row));
  }
}
