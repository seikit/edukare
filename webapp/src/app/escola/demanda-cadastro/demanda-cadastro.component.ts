import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { DemandaService } from '../services/demanda.service';
import { IDisciplina } from '../models/disciplina';
import { EscolaService } from '../services/escola.service';
import { Escola } from '../models/escola';

@Component({
  selector: 'app-demanda-cadastro',
  templateUrl: './demanda-cadastro.component.html',
  styleUrls: ['./demanda-cadastro.component.scss']
})
export class DemandaCadastroComponent implements OnInit {
  disciplinas: IDisciplina[] = []
  ano = new Date()
  
  constructor(private escolaService: EscolaService, private fb: FormBuilder, private router:Router, private demandaService: DemandaService, private notificacaoService: NotificacaoService) {
    this.escolaService.escola$.subscribe( (escola: Escola) => {
      this.formDemanda.get('escolaId')?.setValue(escola.id);
      this.formDemanda.get('escola')?.setValue(escola.nome);
    })
  }

  ngOnInit(): void {
    this.demandaService.carregarDisciplinasAtivas().subscribe(res => {
      if (res.ok && res.body) {
        this.disciplinas = res.body;
      }
    })
  }

  formDemanda = this.fb.group({
    ano: [{value: this.ano.getFullYear(), disabled: true}, Validators.required],    
    disciplina: ['Matemática', [Validators.required, Validators.maxLength(100)]],
    semestre: ['', Validators.required],
    escola: [{value: '', disabled: true}, [Validators.required, Validators.maxLength(100)]],
    escolaId: [{value:'', disabled: true}, Validators.required],
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
          modal.afterClosed().subscribe(() => this.router.navigate(['/escola']));
        }, 3000)
      }
    });
  }

}
