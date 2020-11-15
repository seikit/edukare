import { Injectable } from '@angular/core';
import { IMenu } from './models/menu.model';

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  private menu: IMenu[] = [];
  private menuSecretaria: IMenu[] = [
    {titulo: 'Home', link: '/home', icone: 'home'},
    {titulo: 'Processo seletivo', link: '/processo-seletivo', icone: 'input'},
    {titulo: 'Encaminhamento', link: '/encaminhamento', icone: 'arrow_right_alt'},
    {titulo: 'Relatórios', link: '/relatorios', icone: 'dashboard'}
  ];

  private menuCandidato: IMenu[] = [
    {titulo: 'Home', link:'candidato/home', icone: 'home'},
    {titulo: 'Dados pessoais', link:'candidato/dados-pessoais', icone: 'account_box'},
    {titulo: 'Minhas inscrições', link:'candidato/inscricoes', icone:'create'}
  ]
  
  constructor() {
    this.montarMenuPorPerfilLogado();
  }

  private montarMenuPorPerfilLogado() {
    //this.menu.push(...this.menuSecretaria)
    this.menu.push(...this.menuCandidato);
  }

  getMenu() {
    return this.menu;
  }
}
