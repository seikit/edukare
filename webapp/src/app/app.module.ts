import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { CommonModule, DatePipe } from '@angular/common';
import { SecretariaModule } from './secretaria/secretaria.module';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ModalPadraoComponent } from './shared/modais/modal-padrao/modal-padrao.component';
import { MAT_DIALOG_DEFAULT_OPTIONS } from '@angular/material/dialog';
import { OAuthModule } from 'angular-oauth2-oidc';
import { HighchartsChartModule } from 'highcharts-angular';
import { HomeModule } from './home/home.module';
import { TokenInterceptor } from './shared/interceptor/token-interceptor';

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
    HttpClientModule,
    HighchartsChartModule,
    HomeModule,
    OAuthModule.forRoot({
      resourceServer: {
          allowedUrls: ['http://localhost:8080/'],
          sendAccessToken: false
      }
  })
  ],
  providers: [
    DatePipe, {provide: MAT_DIALOG_DEFAULT_OPTIONS, useValue: {hasBackdrop: true}},  
    { provide: HTTP_INTERCEPTORS, useClass: TokenInterceptor, multi: true }],
  entryComponents: [ModalPadraoComponent],
  bootstrap: [AppComponent],
  exports: []
})
export class AppModule { }
