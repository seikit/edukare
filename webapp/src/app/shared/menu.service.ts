import { Injectable } from '@angular/core';
import { Menu } from './models/menu.model';

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  private menu: Menu[] = [];
  private menuSecretaria: Menu[] = [
    {titulo: 'Home', link: '/home', icone: 'input'},
    {titulo: 'Processo seletivo', link: '/processo-seletivo', icone: 'input'},
    {titulo: 'Encaminhamento', link: '/encaminhamento', icone: 'arrow_right_alt'},
    {titulo: 'Relatórios', link: '/relatorios', icone: 'dashboard'}
  ];
  
  constructor() {
    this.montarMenuPorPerfilLogado();
  }

  private montarMenuPorPerfilLogado() {
    this.menu.push(...this.menuSecretaria)
  }

  getMenu() {
    return this.menu;
  }
}
