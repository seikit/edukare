import { Component, OnInit } from '@angular/core';
import { IProfessor } from '../models/professor';
import { ProfessorService } from '../services/professor.service';
import {SelectionModel} from '@angular/cdk/collections';
import { MatTableDataSource } from '@angular/material/table';
import { EscolaService } from 'src/app/escola/services/escola.service';
import { Escola } from 'src/app/escola/models/escola';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { ModalConfirmacaoComponent } from 'src/app/shared/modais/modal-confirmacao/modal-confirmacao.component';

@Component({
  selector: 'app-encaminhamento',
  templateUrl: './encaminhamento.component.html',
  styleUrls: ['./encaminhamento.component.scss']
})
export class EncaminhamentoComponent implements OnInit {
  selecionados = new SelectionModel<IProfessor>(true, []);
  colunas: string[] = ['selecao', 'nome', 'cpf', 'celular', 'email', 'processoId', 'encaminhado', 'escolas', 'escolaId', 'escolaEncaminhamento'];
  dados: MatTableDataSource<IProfessor> = new MatTableDataSource<IProfessor>(); 
  escolas: Escola[] = []; 
  
  constructor(private professorService: ProfessorService, private escolaService: EscolaService, private notificacaoService: NotificacaoService) { }

  ngOnInit(): void {
    this.carregarProfessores();    
  }

  carregarProfessores(): void {
    this.professorService.carregarProfessores().subscribe(res => {
      if(res.ok && res.body) {           
        this.dados = new MatTableDataSource<IProfessor>(res.body);         
        
        this.escolaService.carregarEscolas().subscribe(res => {
          if(res.ok && res.body) {
            this.escolas = res.body
          }
        })
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

  encaminharProfessores(): void {
    this.notificacaoService.abrirModal(ModalConfirmacaoComponent, {data: {titulo: 'Encaminhar os professores selecionados ? ', mensagem: ''}}).afterClosed().subscribe( (cancelar:boolean) => {
      if(cancelar == true) {
        const selecionados = this.selecionados.selected;
        this.professorService.encaminharProfessorParaEscola(selecionados).subscribe(res => {
          if(res.ok && res.body) {        
            const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Professores encaminhados"}});
            setTimeout(() => {
              modal.close();
            }, 3000)        
            modal.afterClosed().subscribe(() => {
              this.carregarProfessores();
            })
          }
        });
      }
    });
  }

  setarEscola(professor: IProfessor, evento: any): void {
    this.selecionados.deselect(professor);    
    const escola = this.escolas.find( (e: Escola) => e.id === evento.value);
    professor.escolaEncaminhamento = escola?.nome;
    professor.escolaIdEncaminhamento = escola?.id;
    this.dados.data.push(professor);
  }

  carregarRelatorio(): void {
    this.professorService.carregarRelatorio();
  }
}
