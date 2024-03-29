import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';


import { OverlayModule } from '@angular/cdk/overlay';
import { CdkTreeModule } from '@angular/cdk/tree';
import { PortalModule } from '@angular/cdk/portal';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatButtonModule } from '@angular/material/button';
import { MatButtonToggleModule } from '@angular/material/button-toggle';
import { MatCardModule } from '@angular/material/card';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatRadioModule } from '@angular/material/radio';
import { MatChipsModule } from '@angular/material/chips';
import { MatRippleModule } from '@angular/material/core';
import { MatDividerModule } from '@angular/material/divider';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatMenuModule } from '@angular/material/menu';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatSelectModule } from '@angular/material/select';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatTabsModule } from '@angular/material/tabs';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTreeModule } from '@angular/material/tree';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core/';
import { MatStepperModule } from '@angular/material/stepper';
import { ModalPadraoComponent } from './modais/modal-padrao/modal-padrao.component';
import { ModalSucessoComponent } from './modais/modal-sucesso/modal-sucesso.component';
import { ReactiveFormsModule } from '@angular/forms';
import { ModalConfirmarCancelamentoExclusaoComponent } from './modais/modal-confirmar-cancelamento-exclusao/modal-confirmar-cancelamento-exclusao.component';
import { MascaraDirectiveModule } from './diretivas/mascara/mascara.directive';
import { SomenteNumeroDirectiveModule } from './diretivas/somenteNumero/somente-numero.directive';
import { ModalConfirmarExclusaoGenericoComponent } from './modais/modal-confirmar-excluir-generico/modal-confirmar-exclusao-generico/modal-confirmar-exclusao-generico.component';
import { ModalConfirmacaoComponent } from './modais/modal-confirmacao/modal-confirmacao.component';

const materialModules = [
  CdkTreeModule,
  MatAutocompleteModule,
  MatButtonModule,
  MatCardModule,
  MatCheckboxModule,
  MatRadioModule,
  MatChipsModule,
  MatDividerModule,
  MatDatepickerModule,
  MatExpansionModule,
  MatIconModule,
  MatInputModule,  
  MatListModule,
  MatMenuModule,
  MatNativeDateModule,
  MatProgressSpinnerModule,
  MatPaginatorModule,
  MatRippleModule,
  MatSelectModule,
  MatSidenavModule,
  MatSnackBarModule,
  MatSortModule,
  MatStepperModule,
  MatTableModule,
  MatTabsModule,
  MatToolbarModule,
  MatFormFieldModule,
  MatButtonToggleModule,
  MatTreeModule,
  OverlayModule,
  PortalModule,
  ReactiveFormsModule,
  MascaraDirectiveModule,
  SomenteNumeroDirectiveModule
];

@NgModule({
  declarations: [ModalPadraoComponent, ModalSucessoComponent, ModalConfirmarCancelamentoExclusaoComponent, ModalConfirmarExclusaoGenericoComponent, ModalConfirmacaoComponent],
  imports: [
    ...materialModules
  ],
  exports: [
    ...materialModules
  ]
})
export class SharedModule { }
