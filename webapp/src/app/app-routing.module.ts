import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './home/home/home.component';
import { DisciplinasCadastroComponent } from './secretaria/disciplinas-cadastro/disciplinas-cadastro.component';
import { DisciplinasDetalhesComponent } from './secretaria/disciplinas-detalhes/disciplinas-detalhes.component';
import { DisciplinasComponent } from './secretaria/disciplinas/disciplinas.component';
import { EncaminhamentoComponent } from './secretaria/encaminhamento/encaminhamento.component';
import { ProcessoSeletivoCadastroComponent } from './secretaria/processo-seletivo-cadastro/processo-seletivo-cadastro.component';
import { ProcessoSeletivoDetalhesComponent } from './secretaria/processo-seletivo-detalhes/processo-seletivo-detalhes.component';
import { ProcessoSeletivoComponent } from './secretaria/processo-seletivo/processo-seletivo.component';
import { RelatorioComponent } from './secretaria/relatorio/relatorio.component';
import { SelecaoComponent } from './secretaria/selecao/selecao.component';

const routes: Routes = [
  {path: '', redirectTo: '/transparencia', pathMatch: 'full'},
  {path: 'transparencia', component: HomeComponent},
  {path: 'processo-seletivo/selecao', component: SelecaoComponent},
  {path: 'processo-seletivo/encaminhamento', component: EncaminhamentoComponent},
  {path: 'processo-seletivo/relatorios', component: RelatorioComponent},
  {path: 'disciplina', component: DisciplinasComponent},
  {path: 'disciplina/nova', component: DisciplinasCadastroComponent},
  {path: 'disciplina/:id', component: DisciplinasDetalhesComponent},
  {path: 'processo-seletivo', component: ProcessoSeletivoComponent},
  {path: 'processo-seletivo/novo', component: ProcessoSeletivoCadastroComponent},
  {path: 'processo-seletivo/:id', component: ProcessoSeletivoDetalhesComponent},
  {path: 'candidato', loadChildren: () => import('./candidato/candidato.module').then(m => m.CandidatoModule) },
  {path: 'escola', loadChildren: () => import('./escola/escola.module').then(m => m.EscolaModule) }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
