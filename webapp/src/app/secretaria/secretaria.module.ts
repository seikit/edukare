import { NgModule } from '@angular/core';
import { ProcessoSeletivoComponent } from './processo-seletivo/processo-seletivo.component';
import { SharedModule } from '../shared/shared.module';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { ProcessoSeletivoDetalhesComponent } from './processo-seletivo-detalhes/processo-seletivo-detalhes.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ProcessoSeletivoCadastroComponent } from './processo-seletivo-cadastro/processo-seletivo-cadastro.component';
import { SelecaoComponent } from './selecao/selecao.component';

@NgModule({
  declarations: [ProcessoSeletivoComponent, ProcessoSeletivoDetalhesComponent, ProcessoSeletivoCadastroComponent, SelecaoComponent],
  imports: [
    BrowserModule,
    CommonModule,
    SharedModule,
    ReactiveFormsModule
  ],
  exports: [ProcessoSeletivoComponent]
})

export class SecretariaModule { }

