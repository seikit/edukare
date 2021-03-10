import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDisciplina } from '../models/disciplina';
import { DisciplinasService } from '../services/disciplinas.service';

@Component({
  selector: 'app-disciplinas-detalhes',
  templateUrl: './disciplinas-detalhes.component.html',
  styleUrls: ['./disciplinas-detalhes.component.scss']
})
export class DisciplinasDetalhesComponent implements OnInit {
  disciplina: IDisciplina;
  modo: String;
  
  constructor(private fb: FormBuilder, private disciplinaService: DisciplinasService, private notificacaoService: NotificacaoService, private router: Router) {
    this.disciplina = history.state?.data;
    this.modo = history.state?.modo;
  }

  formDisciplina = this.fb.group({
    id: [''],
    nome: ['',[Validators.required, Validators.maxLength(50)]],
    ativa: ['', Validators.required],
  })


  ngOnInit(): void {
    if(this.disciplina) {
      this.formDisciplina.setValue(this.disciplina);
    }

    if (this.modo === 'visualizacao') {
      this.formDisciplina.disable();
    }
  }

  validarForm(form: IDisciplina) {
    if(this.formDisciplina.invalid) {
      return
    }

    this.disciplinaService.editar(this.formDisciplina.value).subscribe(res => {
      if(res.ok && res.body) {
        this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Disciplina editada com suscesso!"}}).afterClosed().subscribe(() => {
          this.router.navigate(['disciplina']);
        })
      }
    });
  }

}
