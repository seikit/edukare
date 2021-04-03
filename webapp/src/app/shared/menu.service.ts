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
    {titulo: 'Transparência', link: '/transparencia', icone: 'dashboard'},
    {titulo: 'Processo seletivo', link: '/processo-seletivo', icone: 'input'},
    {titulo: 'Encaminhamento', link: 'processo-seletivo/encaminhamento', icone: 'arrow_right_alt'},
    {titulo: 'Disciplinas', link: 'disciplina', icone: 'auto_stories'},
    {titulo: 'Relatórios', link: 'processo-seletivo/relatorios', icone: 'assessment'}

  ];

  private menuCandidato: IMenu[] = [    
    {titulo: 'Transparência', link: '/transparencia', icone: 'dashboard'},
    {titulo: 'Processos seletivos', link: `candidato/processos`, icone: 'input'},
    {titulo: 'Dados pessoais', link:`candidato/dados-pessoais`, icone: 'account_box'},
    {titulo: 'Minhas inscrições', link:`candidato/inscricoes`, icone:'create'}
  ]

  private menuEscola: IMenu[] = [
    {titulo: 'Transparência', link: '/transparencia', icone: 'dashboard'},
    {titulo: 'Demandas', link: `escola`, icone: 'input'},
    {titulo: 'Professores', link: `escola/professores`, icone: 'school'},
  ]

  
  constructor(private authService: AuthService, private loginService: LoginService) {}

  montarMenuPorPerfilLogado() {
    if (this.loginService.estaLogado()) {
      let roles = this.authService.getRoles();        
      
      if (roles.includes('SECRETARIA')) {
        this.menu.push(...this.menuSecretaria)
      } else if (roles.includes('ESCOLA')){
        this.menu.push(...this.menuEscola);
      } else {
        this.menu.push(...this.menuCandidato);
      }
    }    
    return this.menu;
  }
}
