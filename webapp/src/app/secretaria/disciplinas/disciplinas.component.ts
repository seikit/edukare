import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ModalConfirmarExclusaoGenericoComponent } from 'src/app/shared/modais/modal-confirmar-excluir-generico/modal-confirmar-exclusao-generico/modal-confirmar-exclusao-generico.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDisciplina } from '../models/disciplina';
import { DisciplinasService } from '../services/disciplinas.service';

@Component({
  selector: 'app-disciplinas',
  templateUrl: './disciplinas.component.html',
  styleUrls: ['./disciplinas.component.scss']
})
export class DisciplinasComponent implements OnInit {  
  disciplinas: IDisciplina[] = [];

  constructor(private disciplinaService: DisciplinasService, private router: Router, private notificacaoService: NotificacaoService) { }

  ngOnInit(): void {
    this.carregar();
  }

  carregar(): void {
    this.disciplinaService.carregar().subscribe(res => {
      if(res.ok && res.body) {
        this.disciplinas = res.body;
      }
    })
  }

  criar(): void {
    this.router.navigate(['disciplina/nova']);
  }

  editar(disciplina: IDisciplina): void {
    this.router.navigate(['/disciplina', disciplina.id], {state: {data: disciplina, modo: 'edicao'}});
  }

  deletar(disciplina: IDisciplina): void {
    this.notificacaoService.abrirModal(ModalConfirmarExclusaoGenericoComponent, {data: {'index': disciplina.id, 'titulo': 'Excluir disciplina ?'}}).afterClosed().subscribe(excluir => {
      if(excluir) {
        this.disciplinaService.deletar(disciplina.id).subscribe(res => {
          if(res.ok) {
            this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Disciplina excluída com suscesso!"}}).afterClosed().subscribe(() => {
              this.carregar();
            })
          }
        });
      }
    })
  }

  exportarDisciplinas(): void {
    this.disciplinaService.exportarDisciplinas();
  }
}
