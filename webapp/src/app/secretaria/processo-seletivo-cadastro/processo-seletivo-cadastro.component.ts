import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { ModalPadraoComponent } from 'src/app/shared/modais/modal-padrao/modal-padrao.component';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IEtapa } from '../models/etapas.model';
import { ProcessoSeletivo } from '../models/processo-seletivo';
import { ProcessoSeletivoService } from '../processo-seletivo/processo-seletivo.service';

@Component({
  selector: 'app-processo-seletivo-cadastro',
  templateUrl: './processo-seletivo-cadastro.component.html',
  styleUrls: ['./processo-seletivo-cadastro.component.scss']
})
export class ProcessoSeletivoCadastroComponent implements OnInit {
  isNavegacaoLinear = false;
  etapas: IEtapa[];  

  constructor(private fb: FormBuilder, private notificacaoService: NotificacaoService, private processoSeletivoService: ProcessoSeletivoService) {
    this.etapas = [];
    //this.etapas.push({id:1, titulo: 'prova', descricao:'Prova de títulos para comprovação de requisitos mínimos', candidatos:[], data: '10/15/2020', processoSeletivo: 1 });
  }

  formDescricao = this.fb.group({
    titulo: ['',[Validators.required, Validators.maxLength(100)]],
    descricao: ['', [Validators.required, Validators.maxLength(250)]],
  })

  formData = this.fb.group({
    dtInicioInscricao: ['', Validators.required],
    dtEncerramentoInscricao: ['',Validators.required],
  })

  formEtapa = this.fb.group({
    titulo:[''],
    descricao:[''],
    data:['']
  })

  get fd() {
    return this.formDescricao.controls;
  }

  get fdt() {
    return this.formData.controls;
  }

  get fe() {
    return this.formEtapa.controls;
  }

  ngOnInit(): void {}
  
  incluirEtapa(e: IEtapa) {
    if (!e.titulo || !e.descricao || !e.data) {
      this.notificacaoService.abrirSnackBar('Informe os dados da etapa!');
      return;
    }

    const etapa = this.etapas.find(i => i === e);
    if (etapa) {
      this.notificacaoService.abrirSnackBar('Etapa já cadastrada.');
      return;
    }

    this.etapas.push(e);
    this.notificacaoService.abrirSnackBar('Etapa cadastrada com sucesso.')

  }

  excluirEtapa(e: IEtapa) {    
    const index = this.etapas.findIndex(i => i === e);
    if (index !== undefined) {
      this.etapas.splice(index,1);
      this.notificacaoService.abrirSnackBar('Etapa excluída com sucesso.')
    }
  }

  validarFormulario() {
    if (this.formDescricao.valid && this.formData.valid && this.etapas.length > 0) {
      this.criarProcesso();
    } else {
      this.notificacaoService.abrirSnackBar('Por gentileza revise o formulário.');
    }
  }

  criarProcesso() {
    const processo = new ProcessoSeletivo().construirNovoProcesso(this.formDescricao, this.formData, this.etapas);
    
    if (processo) {
      this.processoSeletivoService.criar(processo).subscribe(resp => {
        if (resp.ok) {
          this.notificacaoService.abrirModal(ModalPadraoComponent)
        }
      });
    }
  }

}
