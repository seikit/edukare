import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DemandaCadastroComponent } from './demanda-cadastro/demanda-cadastro.component';
import { DemandaDetalhesComponent } from './demanda-detalhes/demanda-detalhes.component';
import { DemandaComponent } from './demanda/demanda.component';

const routes: Routes = [  
  { path: '', component: DemandaComponent },
  { path: 'nova-demanda', component: DemandaCadastroComponent },
  { path: 'demanda/:demandaId', component: DemandaDetalhesComponent }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EscolaRoutingModule { }
