import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home/home.component';
import { ProcessoSeletivoDetalhesComponent } from './secretaria/processo-seletivo-detalhes/processo-seletivo-detalhes.component';
import { ProcessoSeletivoComponent } from './secretaria/processo-seletivo/processo-seletivo.component';

const routes: Routes = [
  {path: '', redirectTo: '/home', pathMatch: 'full'},
  {path: 'home', component: HomeComponent},
  {path: 'processo-seletivo', component: ProcessoSeletivoComponent},
  {path: 'processo-seletivo/:id', component: ProcessoSeletivoDetalhesComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
