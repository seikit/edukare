import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
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

  constructor(private fb: FormBuilder, private notificacaoService: NotificacaoService, private processoSeletivoService: ProcessoSeletivoService, private router: Router) {
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
        if (resp.status === 201) {
          const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo:"Processo seletivo cadastrado!"}});
          setTimeout(() => {
            modal.close();
            modal.afterClosed().subscribe(() => this.router.navigate(['/processo-seletivo']));
          }, 3000)
        } else {

        }
      });
    }
  }

}
