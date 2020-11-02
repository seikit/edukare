import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { CommonModule } from '@angular/common';
import { SecretariaModule } from './secretaria/secretaria.module';
import { HttpClientModule } from '@angular/common/http';
import { ModalPadraoComponent } from './shared/modais/modal-padrao/modal-padrao.component';
import { MAT_DIALOG_DEFAULT_OPTIONS } from '@angular/material/dialog';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    CommonModule,
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    SharedModule,
    SecretariaModule,
    HttpClientModule
  ],
  providers: [
    {provide: MAT_DIALOG_DEFAULT_OPTIONS, useValue: {hasBackdrop: true}}
  ],
  entryComponents: [ModalPadraoComponent],
  bootstrap: [AppComponent],
  exports: []
})
export class AppModule { }
