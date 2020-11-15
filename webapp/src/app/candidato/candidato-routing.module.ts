import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { CandidatoComponent } from './candidato.component';
import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';

const routes: Routes = [
  { path: 'home', component: CandidatoComponent },
  { path: 'dados-pessoais', component: DadosPessoaisComponent},
  { path: 'inscricoes', component: InscricoesComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CandidatoRoutingModule { }
