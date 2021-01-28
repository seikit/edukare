import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CandidatoRoutingModule } from './candidato-routing.module';
import { CandidatoComponent } from './candidato.component';
import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';
import { SharedModule } from '../shared/shared.module';
import { HomeComponent } from './home/home.component';


@NgModule({
  declarations: [CandidatoComponent, DadosPessoaisComponent, InscricoesComponent, HomeComponent],
  imports: [
    CommonModule,
    CandidatoRoutingModule,
    SharedModule
  ]
})
export class CandidatoModule { }
