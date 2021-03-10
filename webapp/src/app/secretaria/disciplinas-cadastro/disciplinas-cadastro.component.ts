import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDisciplina } from '../models/disciplina';
import { DisciplinasService } from '../services/disciplinas.service';

@Component({
  selector: 'app-disciplinas-cadastro',
  templateUrl: './disciplinas-cadastro.component.html',
  styleUrls: ['./disciplinas-cadastro.component.scss']
})
export class DisciplinasCadastroComponent implements OnInit {
  constructor(private fb: FormBuilder, private notificacaoService: NotificacaoService, private disciplinaService: DisciplinasService, private router: Router) { }

  formDisciplina = this.fb.group({
    id: [''],
    nome: ['',[Validators.required, Validators.maxLength(50)]],
    ativa: ['', Validators.required],
  })

  ngOnInit(): void {
  }

  validarForm(form: IDisciplina) {
    if(this.formDisciplina.invalid) {
      return
    }
    this.disciplinaService.criar(form).subscribe(res => {
      if(res.ok && res.body) {
        this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Disciplina cadastrada com suscesso!"}}).afterClosed().subscribe(() => {
          this.router.navigate(['disciplina']);
        })
      }
    });
  }

}
