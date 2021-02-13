import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { DemandaService } from '../demanda/demanda.service';
import { IDisciplina } from '../models/disciplina';

@Component({
  selector: 'app-demanda-cadastro',
  templateUrl: './demanda-cadastro.component.html',
  styleUrls: ['./demanda-cadastro.component.scss']
})
export class DemandaCadastroComponent implements OnInit {
  disciplinas: IDisciplina[] = []

  ano = new Date()
  constructor(private fb: FormBuilder, private router:Router, private demandaService: DemandaService, private notificacaoService: NotificacaoService) { }

  ngOnInit(): void {
    this.demandaService.carregarDisciplinas().subscribe(res => {
      if (res.ok && res.body) {
        this.disciplinas = res.body;
      }
    })
  }

  formDemanda = this.fb.group({
    ano: [{value: this.ano.getFullYear(), disabled: true}, Validators.required],    
    disciplina: ['Matemática', [Validators.required, Validators.maxLength(100)]],
    semestre: ['', Validators.required],
    escola: [{value: 'Machado de Assis', disabled: true}, [Validators.required, Validators.maxLength(100)]],
    quantidade: ['', Validators.required],
    justificativa: ['', [Validators.required, Validators.maxLength(250)]]
  })

  validarFormulario() {
    if (this.formDemanda.valid) {
      this.criarDemanda();
    } else {
      this.notificacaoService.abrirSnackBar('Por gentileza revise o formulário.');
    }
  }

  criarDemanda() {    
    this.demandaService.criar(this.formDemanda.getRawValue()).subscribe(res => {
      if (res.ok && res.body) {
        const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo:"Demanda cadastrada com sucesso!"}});
        setTimeout(() => {
          modal.close();
          modal.afterClosed().subscribe(() => this.router.navigate(['/escola/1']));
        }, 3000)
      }
    });
  }

}
