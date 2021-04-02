import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { DadosPessoaisComponent } from './dados-pessoais/dados-pessoais.component';
import { InscricaoDetalhesComponent } from './inscricao-detalhes/inscricao-detalhes.component';
import { InscricoesComponent } from './inscricoes/inscricoes.component';
import { ProcessosComponent } from './processos/processos.component';

const routes: Routes = [  
  { path: 'processos', component: ProcessosComponent },
  { path: 'dados-pessoais', component: DadosPessoaisComponent},
  { path: 'inscricoes', component: InscricoesComponent},
  { path: 'inscricao/:id', component: InscricaoDetalhesComponent}
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CandidatoRoutingModule { }
