import { Injectable } from '@angular/core';
import { AuthService } from './auth/auth.service';
import { LoginService } from './login/login.service';
import { IMenu } from './models/menu.model';

const usuarioLogadoId = 1;

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
    {titulo: 'Processos seletivos', link: `candidato/${usuarioLogadoId}/processos`, icone: 'input'},
    {titulo: 'Dados pessoais', link:`candidato/dados-pessoais`, icone: 'account_box'},
    {titulo: 'Minhas inscrições', link:`candidato/${usuarioLogadoId}/inscricoes`, icone:'create'}
  ]

  private menuEscola: IMenu[] = [    
    {titulo: 'Demandas', link: `escola/${usuarioLogadoId}`, icone: 'input'}   
  ]

  
  constructor(private authService: AuthService, private loginService: LoginService) {}

  montarMenuPorPerfilLogado() {
    if (this.loginService.estaLogado()) {
      let roles = this.authService.getRoles();        
      
      if (roles.includes('CIDADAO')) {
        this.menu.push(...this.menuCandidato);
      } else if (roles.includes('SECRETARIA')) {
        this.menu.push(...this.menuSecretaria)
      } else if (roles.includes('ESCOLA')){
        this.menu.push(...this.menuEscola);
      }
    }    
    return this.menu;
  }
}
