import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
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
    // this.router.navigate(['/disciplina', processo.id], {state: {data:processo, modo: 'edicao'}});
    this.disciplinaService.editar(disciplina).subscribe(res => {
      if(res.ok && res.body) {
        this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Disciplina editada com suscesso!"}}).afterClosed().subscribe(() => {
          this.router.navigate(['disciplina']);
        })
      }
    })
  }

  deletar(disciplina: IDisciplina): void {

  }
}
