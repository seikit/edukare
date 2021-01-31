import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';
import { ProcessosComponent } from './processos/processos.component';

const routes: Routes = [  
  { path: ':id/processos', component: ProcessosComponent },
  { path: ':id/dados-pessoais', component: DadosPessoaisComponent},
  { path: ':id/inscricoes', component: InscricoesComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CandidatoRoutingModule { }
