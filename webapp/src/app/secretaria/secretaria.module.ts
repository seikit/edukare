import { NgModule } from '@angular/core';
import { ProcessoSeletivoComponent } from './processo-seletivo/processo-seletivo.component';
import { SharedModule } from '../shared/shared.module';
import { BrowserModule } from '@angular/platform-browser';
import { CommonModule } from '@angular/common';
import { ProcessoSeletivoDetalhesComponent } from './processo-seletivo-detalhes/processo-seletivo-detalhes.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ProcessoSeletivoCadastroComponent } from './processo-seletivo-cadastro/processo-seletivo-cadastro.component';
import { SelecaoComponent } from './selecao/selecao.component';
import { EncaminhamentoComponent } from './encaminhamento/encaminhamento.component';
import { RelatorioComponent } from './relatorio/relatorio.component';
import { GraficoDemandaComponent } from './relatorio/grafico-demanda/grafico-demanda.component';
import { GraficoInscritosProcessoComponent } from './relatorio/grafico-inscritos-processo/grafico-inscritos-processo.component';
import { GraficoEfetivadosComponent } from './relatorio/grafico-efetivados/grafico-efetivados.component';
import { GraficoEfetivadosEncaminhadosComponent } from './relatorio/grafico-efetivados-encaminhados/grafico-efetivados-encaminhados.component';
import { GraficoDemandaDisciplinaComponent } from './relatorio/grafico-demanda-disciplina/grafico-demanda-disciplina.component';
import { DisciplinasComponent } from './disciplinas/disciplinas.component';
import { DisciplinasCadastroComponent } from './disciplinas-cadastro/disciplinas-cadastro.component';
import { DisciplinasDetalhesComponent } from './disciplinas-detalhes/disciplinas-detalhes.component';

@NgModule({
  declarations: [ProcessoSeletivoComponent, ProcessoSeletivoDetalhesComponent, ProcessoSeletivoCadastroComponent, SelecaoComponent, EncaminhamentoComponent, RelatorioComponent, GraficoDemandaComponent, GraficoInscritosProcessoComponent, GraficoEfetivadosComponent, GraficoEfetivadosEncaminhadosComponent, GraficoDemandaDisciplinaComponent, DisciplinasComponent, DisciplinasCadastroComponent, DisciplinasDetalhesComponent],
  imports: [
    BrowserModule,
    CommonModule,
    SharedModule,
    ReactiveFormsModule
  ],
  exports: [ProcessoSeletivoComponent]
})

export class SecretariaModule { }

