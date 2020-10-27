import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProcessoSeletivoComponent } from './processo-seletivo/processo-seletivo.component';

@NgModule({
  declarations: [ProcessoSeletivoComponent],
  imports: [
    CommonModule
  ],
  exports: [ProcessoSeletivoComponent]
})
export class SecretariaModule { }
