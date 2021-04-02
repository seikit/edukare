import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CandidatoRoutingModule } from './candidato-routing.module';
import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';
import { SharedModule } from '../shared/shared.module';
import { ProcessosComponent } from './processos/processos.component';
import { InscricaoDetalhesComponent } from './inscricao-detalhes/inscricao-detalhes.component';


@NgModule({
  declarations: [DadosPessoaisComponent, InscricoesComponent, ProcessosComponent, InscricaoDetalhesComponent],
  imports: [
    CommonModule,
    CandidatoRoutingModule,
    SharedModule
  ]
})
export class CandidatoModule { }
