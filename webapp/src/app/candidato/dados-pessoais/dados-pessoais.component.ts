import { Component, OnInit } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MomentDateAdapter, MAT_MOMENT_DATE_ADAPTER_OPTIONS } from '@angular/material-moment-adapter';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatDatepicker } from '@angular/material/datepicker';

import * as _moment from 'moment';
import { Moment } from 'moment';
import { NotificacaoService } from 'src/app/shared/notificacao.service';
import { IDadosCandidato } from '../models/dados-candidato';
import { DadosPessoaisService } from './dados-pessoais.service';

const moment = _moment;

export const DATA_MES_ANO = {
  parse: {
    dateInput: 'MM/YYYY',
  },
  display: {
    dateInput: 'MM/YYYY',
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

    {provide: MAT_DATE_FORMATS, useValue: DATA_MES_ANO},
  ],
})
export class DadosPessoaisComponent implements OnInit {
  
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
      nomeCompleto:['', [Validators.required, Validators.maxLength(40)]],
      cpf: ['', [Validators.required, Validators.maxLength(14), Validators.pattern(this.cpf)]],
      filiacao1: ['', Validators.required, Validators.maxLength(40)],
      filiacao2: ['', Validators.required, Validators.maxLength(40)],
      email: ['', [Validators.required, Validators.maxLength(40), Validators.pattern(this.email)]],
      celular: ['', [Validators.required, Validators.maxLength(14), Validators.pattern(this.celular)]],
      telefoneFixo: ['', [Validators.maxLength(13), Validators.pattern(this.telefoneFixo)]],
      naturalidade: ['', [Validators.required, Validators.maxLength(20), Validators.pattern(this.naturalidade)]]
    }),

    endereco: this.fb.group({
      rua: ['', [Validators.required, Validators.maxLength(40)]],
      numero: ['', Validators.required],
      bairro: ['', [Validators.required, Validators.maxLength(20)]],
      cidadeResidencia: ['', [Validators.required, Validators.maxLength(20)]],    
      estadoResidencia: ['', [Validators.required, Validators.maxLength(20)]]
    }),

    educacao: this.fb.group({
      nivelEscolaridade: ['SUPERIOR_COMPLETO', Validators.required],

      titulos: this.fb.array([
        this.fb.group({
          instituicaoEnsino: ['', [Validators.required, Validators.maxLength(50)]],
          tituloCurso: ['', [Validators.required, Validators.maxLength(50)]],
          anoConclusao: ['', [Validators.required, Validators.maxLength(50)]]
        })        
      ]),
    })

  })

  constructor(private fb: FormBuilder, private notificacaoService: NotificacaoService, private DadosPessoaisService: DadosPessoaisService) { 
    
  }

  get titulos(): FormArray {
    return this.form.get('educacao')?.get('titulos') as FormArray;
  }
  
  ngOnInit(): void {}

  submit(dadosCandidato: IDadosCandidato): void {    
    if (this.form.valid) {
      this.DadosPessoaisService.salvar(dadosCandidato);
    }    
  }  

  setarAno(normalizedYear: Moment) {
    const ctrlValue = this.form.get('educacao')?.get('anoConclusao1')?.value;
    ctrlValue.year(normalizedYear.year());
    this.form.get('educacao')?.get('anoConclusao1')?.setValue(ctrlValue);
  }

  setarMes(normalizedMonth: Moment, datepicker: MatDatepicker<Moment>) {
    const ctrlValue = this.form.get('educacao')?.get('anoConclusao1')?.value;
    ctrlValue.month(normalizedMonth.month());
    this.form.get('educacao')?.get('anoConclusao1')?.setValue(ctrlValue);
    datepicker.close();
  }

  criarFormGroupTitulo(): FormGroup {
    return this.fb.group({
      instituicaoEnsino: ['', [Validators.required, Validators.maxLength(50)]],
      tituloCurso: ['', [Validators.required, Validators.maxLength(50)]],
      anoConclusao: ['', [Validators.required, Validators.maxLength(50)]],
    });
  }

  adicionarTitulo():void {    
    this.titulos.push(this.criarFormGroupTitulo());
  }

  removerTitulo(index: number):void {
    if (index !== 0) {      
      this.titulos.removeAt(index);
      this.notificacaoService.abrirSnackBar('Título removido');
    }
  }
}