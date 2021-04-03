import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EscolaRoutingModule } from './escola-routing.module';
import { DemandaComponent } from './demanda/demanda.component';
import { DemandaCadastroComponent } from './demanda-cadastro/demanda-cadastro.component';
import { DemandaDetalhesComponent } from './demanda-detalhes/demanda-detalhes.component';
import { SharedModule } from '../shared/shared.module';
import { ProfessorComponent } from './professor/professor.component';

@NgModule({
  declarations: [DemandaComponent, DemandaCadastroComponent, DemandaDetalhesComponent, ProfessorComponent],
  imports: [
    SharedModule,
    CommonModule,
    EscolaRoutingModule
  ]
})
export class EscolaModule { }
