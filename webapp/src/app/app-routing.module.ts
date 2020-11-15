import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home/home.component';
import { ProcessoSeletivoCadastroComponent } from './secretaria/processo-seletivo-cadastro/processo-seletivo-cadastro.component';
import { ProcessoSeletivoDetalhesComponent } from './secretaria/processo-seletivo-detalhes/processo-seletivo-detalhes.component';
import { ProcessoSeletivoComponent } from './secretaria/processo-seletivo/processo-seletivo.component';

const routes: Routes = [
  {path: '', redirectTo: '/home', pathMatch: 'full'},
  {path: 'home', component: HomeComponent},
  {path: 'processo-seletivo', component: ProcessoSeletivoComponent},
  {path: 'processo-seletivo/novo', component: ProcessoSeletivoCadastroComponent},
  {path: 'processo-seletivo/:id', component: ProcessoSeletivoDetalhesComponent},
  {path: 'candidato', loadChildren: () => import('./candidato/candidato.module').then(m => m.CandidatoModule) }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
