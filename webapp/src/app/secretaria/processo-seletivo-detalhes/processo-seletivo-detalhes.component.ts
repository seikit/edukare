import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IEtapa } from '../models/etapas.model';
import { IProcessoSeletivo, ProcessoSeletivo } from '../models/processo-seletivo';
import { ProcessoSeletivoService } from '../processo-seletivo/processo-seletivo.service';


@Component({
  selector: 'app-processo-seletivo-detalhes',
  templateUrl: './processo-seletivo-detalhes.component.html',
  styleUrls: ['./processo-seletivo-detalhes.component.scss']
})
export class ProcessoSeletivoDetalhesComponent implements OnInit {
  processo: IProcessoSeletivo;
  modo: String;

  constructor(private fb: FormBuilder, private processoSeletivoService: ProcessoSeletivoService, private notificacaoService: NotificacaoService, private router: Router) {
    this.processo = new ProcessoSeletivo();
    this.modo = ''; 
  }

  form = this.fb.group({
    id: ['', Validators.required],
    titulo: ['',[Validators.required, Validators.maxLength(100)]],
    descricao: ['', [Validators.required, Validators.maxLength(250)]],
    situacao: ['', Validators.required],
    dtInicioInscricao: ['', Validators.required],
    dtEncerramentoInscricao: ['',Validators.required],
    etapas: this.fb.array([])
  })

  ngOnInit(): void {
    this.processo = history.state?.data;
    this.modo = history.state?.modo;

    if (this.processo) {
      this.form.setValue({
        id: this.processo.id,
        titulo: this.processo.titulo,
        descricao: this.processo.descricao,
        situacao: this.processo.situacao,
        dtInicioInscricao: this.processo.dtInicioInscricao,
        dtEncerramentoInscricao: this.processo.dtEncerramentoInscricao,
        etapas: []
      });
      this.setarEtapa(this.processo.etapas);
    } else {
      this.router.navigate(['/processo-seletivo'])
    }

    if (this.modo === 'visualizacao') {
      this.form.disable();
    }
  }

  get etapas(): FormArray {
    return this.form.get('etapas') as FormArray;
  }

  criarFormGroup(etapa: IEtapa): FormGroup {    
    return this.fb.group({
      id: new FormControl(etapa.id, Validators.required),
      titulo: new FormControl(etapa.titulo, [Validators.required, Validators.maxLength(100)]),
      descricao: new FormControl(etapa.descricao, [Validators.required, Validators.maxLength(250)]),
      data: new FormControl(etapa.data, Validators.required)      
    })
  }

  setarEtapa(etapas: IEtapa[]) {    
    for(const etapa of etapas) {
      this.etapas.push(this.criarFormGroup(etapa));
    }
  }

  salvarEdicao(processo: IProcessoSeletivo) {
    if (this.form.valid) {
      this.processoSeletivoService.atualizar(processo).subscribe(resp => {        
        if (resp.ok && resp.body) {
          const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo:"Processo seletivo atualizado!"}});
          setTimeout(() => {
            modal.close();
            modal.afterClosed().subscribe(() => this.router.navigate(['/processo-seletivo']));
          }, 3000)
        }
      });
    } else {
      this.notificacaoService.abrirSnackBar('Por gentileza revise o formulário.');
    }
  }

}
