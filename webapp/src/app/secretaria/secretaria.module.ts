import { NgModule } from '@angular/core';
import { ProcessoSeletivoComponent } from './processo-seletivo/processo-seletivo.component';
import { SharedModule } from '../shared/shared.module';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { ProcessoSeletivoDetalhesComponent } from './processo-seletivo-detalhes/processo-seletivo-detalhes.component';

@NgModule({
  declarations: [ProcessoSeletivoComponent, ProcessoSeletivoDetalhesComponent],
  imports: [
    BrowserModule,
    CommonModule,
    SharedModule
  ],
  exports: [ProcessoSeletivoComponent]
})

export class SecretariaModule { }

