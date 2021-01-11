import { Component, OnInit } from '@angular/core';
import { FormBuilder, Validators } from '@angular/forms';
import { MomentDateAdapter, MAT_MOMENT_DATE_ADAPTER_OPTIONS } from '@angular/material-moment-adapter';
import { DateAdapter, MAT_DATE_FORMATS, MAT_DATE_LOCALE } from '@angular/material/core';
import { MatDatepicker } from '@angular/material/datepicker';

import * as _moment from 'moment';
import { Moment } from 'moment';

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
  
  // Validação CPF
  cpfRegex = /(\d{3}.){2}(\d{3}-)(\d{2})/
  
  // Validação naturalide - Cidade/Estado ex: Campo Grande/MS
  naturalidadeRegex = /(\W)\/(\w{2})/

  form = this.fb.group({
    dadosPessoais: this.fb.group({
      nomeCompleto:['', [Validators.required, Validators.maxLength(40)]],
      cpf: ['', [Validators.required, Validators.maxLength(14), Validators.pattern(this.cpfRegex)]],
      filiacao1: ['', Validators.required, Validators.maxLength(40)],
      filiacao2: ['', Validators.required, Validators.maxLength(40)],
      email: ['', [Validators.required, Validators.maxLength(40), Validators.email]],
      celular: ['', Validators.required, Validators.maxLength(14)],
      telefoneFixo: ['', Validators.required, Validators.maxLength(13)],
      naturalidade: ['', [Validators.required, Validators.maxLength(20), Validators.pattern(this.naturalidadeRegex)]]
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
      
      instituicaoEnsino1: ['', [Validators.required, Validators.maxLength(20)]],
      tituloCurso1: ['', [Validators.required, Validators.maxLength(20)]],
      anoConclusao1: [moment(), [Validators.required, Validators.maxLength(20)]],

      instituicaoEnsino2: ['', [Validators.required, Validators.maxLength(20)]],
      tituloCurso2: ['', [Validators.required, Validators.maxLength(20)]],
      anoConclusao2: [moment(), [Validators.required, Validators.maxLength(20)]],

      instituicaoEnsino3: ['', [Validators.required, Validators.maxLength(20)]],
      tituloCurso3: ['', [Validators.required, Validators.maxLength(20)]],
      anoConclusao3: [moment(), [Validators.required, Validators.maxLength(20)]],
      
      instituicaoEnsino4: ['', [Validators.required, Validators.maxLength(20)]],
      tituloCurso4: ['', [Validators.required, Validators.maxLength(20)]],
      anoConclusao4: [moment(), [Validators.required, Validators.maxLength(20)]],

      instituicaoEnsino5: ['', [Validators.required, Validators.maxLength(20)]],
      tituloCurso5: ['', [Validators.required, Validators.maxLength(20)]],
      anoConclusao5: ['', [Validators.required, Validators.maxLength(20)]],
    })

  })

  constructor(private fb: FormBuilder) { }
  
  ngOnInit(): void {}

  submit(): void {
    console.log(' Add dados pessoais ')
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


}