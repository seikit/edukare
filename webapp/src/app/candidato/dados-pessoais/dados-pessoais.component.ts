import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { MomentDateAdapter, MAT_MOMENT_DATE_ADAPTER_OPTIONS } from '@angular/material-moment-adapter';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatDatepicker } from '@angular/material/datepicker';

import * as _moment from 'moment';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { ModalConfirmarExclusaoGenericoComponent } from 'src/app/shared/modais/modal-confirmar-excluir-generico/modal-confirmar-exclusao-generico/modal-confirmar-exclusao-generico.component';
import { ModalSucessoComponent } from 'src/app/shared/modais/modal-sucesso/modal-sucesso.component';
import { Usuario } from 'src/app/shared/models/usuario';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDadosCandidato } from '../models/dados-candidato';
import { DadosPessoaisService } from './dados-pessoais.service';

const moment = _moment;

export const DATA_ANO = {
  parse: {
    dateInput: 'YYYY',
  },
  display: {
    dateInput: 'YYYY',
    monthYearLabel: 'MMM YYYY',
    dateA11yLabel: 'LL',
    monthYearA11yLabel: 'MMMM YYYY',
  },
};

@Component({
  selector: 'app-dados-pessoais',
  templateUrl: './dados-pessoais.component.html',
  styleUrls: ['./dados-pessoais.component.scss'],
  providers: [    
    {
      provide: DateAdapter,
      useClass: MomentDateAdapter,
      deps: [MAT_DATE_LOCALE, MAT_MOMENT_DATE_ADAPTER_OPTIONS]
    },

    {provide: MAT_DATE_FORMATS, useValue: DATA_ANO},
  ],
})
export class DadosPessoaisComponent implements OnInit {
  usuarioLogado: Usuario = new Usuario();
  
  // Validação formato CPF ex: 000.000.000-00
  cpf = /(\d{3}.){2}(\d{3}-)(\d{2})/

  // Validação formato email
  email = /[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
  
  // Validação formato Celular (xx)12345-6789
  celular = /(\(\d{2}\))(\d{5}\-)(\d{4})/

  // Validação formato Telefone fixo (xx)1234-6789
  telefoneFixo = /(\(\d{2}\))(\d{4}\-)(\d{4})/
  
  // Validação formato naturalide - Cidade/Estado ex: Campo Grande/MS
  naturalidade = /(\D+\/)([A-Z]{2})$/

  form = this.fb.group({
    dadosPessoais: this.fb.group({
      id: [''],
      emailUsuario: [''],
      nomeCompleto:['', [Validators.required, Validators.maxLength(40)]],
      cpf: ['', [Validators.required, Validators.maxLength(14), Validators.pattern(this.cpf)]],
      filiacao1: ['', [Validators.required, Validators.maxLength(40)]],
      filiacao2: ['', [Validators.required, Validators.maxLength(40)]],
      email: ['', [Validators.required, Validators.maxLength(40), Validators.pattern(this.email)]],
      celular: ['', [Validators.required, Validators.maxLength(14), Validators.pattern(this.celular)]],
      telefoneFixo: ['', [Validators.maxLength(13), Validators.pattern(this.telefoneFixo)]],
      naturalidade: ['', [Validators.required, Validators.maxLength(20), Validators.pattern(this.naturalidade)]]
    }),

    endereco: this.fb.group({
      id: [''],
      rua: ['', [Validators.required, Validators.maxLength(40)]],
      numero: ['', Validators.required],
      bairro: ['', [Validators.required, Validators.maxLength(20)]],
      cidadeResidencia: ['', [Validators.required, Validators.maxLength(20)]],    
      estadoResidencia: ['', [Validators.required, Validators.maxLength(20)]]
    }),

    educacao: this.fb.group({
      id: [''],
      nivelEscolaridade: ['SUPERIOR_COMPLETO', Validators.required],

      titulos: this.fb.array([
        this.fb.group({
          id: [''],
          instituicaoEnsino: ['', [Validators.required, Validators.maxLength(50)]],
          tituloCurso: ['', [Validators.required, Validators.maxLength(50)]],
          anoConclusao: ['', [Validators.required]]
        })        
      ]),
    })

  })

  constructor(private fb: FormBuilder, private notificacaoService: NotificacaoService, private DadosPessoaisService: DadosPessoaisService, private authService: AuthService) { 
    this.authService.usuarioLogado.subscribe((usuario: Usuario) => {
      this.usuarioLogado = usuario;
    })
    
  }

  get titulos(): FormArray {
    return this.form.get('educacao')?.get('titulos') as FormArray;
  }
  
  ngOnInit(): void {
      this.form.get('dadosPessoais')?.get('emailUsuario')?.setValue(this.usuarioLogado.email);
      this.DadosPessoaisService.carregarDados(this.usuarioLogado.email).subscribe( data => {
        if (data.ok && data.body) {
          const size = data.body.educacao.titulos.length;
          for (let i = 0; i < size-1; i++) {
            this.titulos.push(this.criarFormGroupTitulo());
          }
          this.form.setValue(data.body);
        }
      })
  }

  submit(dadosCandidato: IDadosCandidato): void {    
    if (this.form.valid) { 
      if (this.form.get('dadosPessoais')?.get('id')?.value) {
        this.DadosPessoaisService.editar(dadosCandidato).subscribe(data => {
          if (data.ok) {
            const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Dados editados com sucesso!"}})
            setTimeout(() => {
              modal.close();
            }, 3000)            
          }
        })
        return;
      }
      
      this.DadosPessoaisService.criar(dadosCandidato).subscribe(data => {
        if (data.ok) {
          const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: "Dados cadastrados com sucesso!"}})
          setTimeout(() => {
            modal.close();
          }, 3000)
          
        }
      });
    }    
  }

  criarFormGroupTitulo(): FormGroup {
    return this.fb.group({
      id: [''],
      instituicaoEnsino: ['', [Validators.required, Validators.maxLength(50)]],
      tituloCurso: ['', [Validators.required, Validators.maxLength(50)]],
      anoConclusao: ['', [Validators.required, Validators.maxLength(50)]],
    });
  }

  adicionarTitulo():void {    
    this.titulos.push(this.criarFormGroupTitulo());
  }
  
  removerTitulo(index: number, tituloId: number):void {
    if (index !== 0 && tituloId) {            
      this.notificacaoService.abrirModal(ModalConfirmarExclusaoGenericoComponent, {data: {'index': index, 'titulo': 'Excluir título!'}}).afterClosed().subscribe(excluir => {
        if (excluir == true) {
          this.DadosPessoaisService.excluirTitulo(tituloId).subscribe(resp => {
            if (resp.ok) {
              this.titulos.removeAt(index);
              const modal = this.notificacaoService.abrirModal(ModalSucessoComponent, {data: {titulo: 'Título excluído'}})
              setTimeout(() => {
                modal.close();
              }, 3000)
            }
          });
        }
      })
    } else {
      this.titulos.removeAt(index);
    }

  }
}