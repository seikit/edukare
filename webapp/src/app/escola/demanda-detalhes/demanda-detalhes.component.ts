import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { DemandaService } from '../services/demanda.service';

@Component({
  selector: 'app-demanda-detalhes',
  templateUrl: './demanda-detalhes.component.html',
  styleUrls: ['./demanda-detalhes.component.scss']
})
export class DemandaDetalhesComponent implements OnInit {
  demanda: any = {};
  modo: string = '';
  disciplinas: string[] = [];


  formDemanda = this.fb.group({
    id: [''],
    ano: [{value: '', disabled: true}, Validators.required],    
    disciplina: ['', [Validators.required, Validators.maxLength(100)]],
    semestre: ['', Validators.required],
    escola: [{value: '', disabled: true}, [Validators.required, Validators.maxLength(100)]],
    escolaId: [{value: '', disabled: true}, Validators.required],
    quantidade: ['', Validators.required],
    justificativa: ['', [Validators.required, Validators.maxLength(250)]]
  })

  constructor(private fb: FormBuilder, private router: Router, private notificacaoService: NotificacaoService, private demandaService: DemandaService) { }

  ngOnInit(): void {
    this.demanda = history.state?.data;
    this.modo = history.state?.modo;

    this.demandaService.carregarDisciplinasAtivas().subscribe(res => {
      if (res.ok && res.body) {
        this.disciplinas = res.body.map(d => d.nome);
      }
    }) 

    if (this.demanda) {
      this.formDemanda.setValue(this.demanda);          
    }
    
    if (this.modo === 'visualizacao') {
      this.formDemanda.disable();
    }
  }

  validarFormulario() {
    if (this.formDemanda.valid) {
      this.editarDemanda();
    } else {
      this.notificacaoService.abrirSnackBar('Por gentileza revise o formulário.');
    }
  }

  editarDemanda() {    
    this.demandaService.editar(this.formDemanda.getRawValue()).subscribe(res => {
      if (res.ok && res.body) {
        const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo:"Demanda editada com sucesso!"}});
        setTimeout(() => {
          modal.close();
          modal.afterClosed().subscribe(() => this.router.navigate(['/escola']));
        }, 3000)
      }
    });
  }


}
