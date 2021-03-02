import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';
import { ProcessosComponent } from './processos/processos.component';

const routes: Routes = [  
  { path: 'processos', component: ProcessosComponent },
  { path: 'dados-pessoais', component: DadosPessoaisComponent},
  { path: 'inscricoes', component: InscricoesComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CandidatoRoutingModule { }
