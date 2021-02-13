import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EscolaRoutingModule } from './escola-routing.module';
import { DemandaComponent } from './demanda/demanda.component';
import { DemandaCadastroComponent } from './demanda-cadastro/demanda-cadastro.component';
import { DemandaDetalhesComponent } from './demanda-detalhes/demanda-detalhes.component';
import { SharedModule } from '../shared/shared.module';

@NgModule({
  declarations: [DemandaComponent, DemandaCadastroComponent, DemandaDetalhesComponent],
  imports: [
    SharedModule,
    CommonModule,
    EscolaRoutingModule
  ]
})
export class EscolaModule { }
