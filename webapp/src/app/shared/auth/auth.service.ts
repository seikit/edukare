import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { OAuthService, UserInfo } from "angular-oauth2-oidc";
import { BehaviorSubject } from "rxjs";
import { Usuario } from "../models/usuario";
import { env } from "src/environments/environment";

@Injectable({ providedIn: 'root' })
export class AuthService {
  usuarioLogado = new BehaviorSubject<Usuario>(new Usuario());

  constructor(private oauthService: OAuthService, private router: Router) {}

  getRoles(): string[] {
    const token = this.oauthService.getAccessToken();
    const payload = token.split('.')[1];
    const payloadDecodedJson = atob(payload);
    const payloadDecoded = JSON.parse(payloadDecodedJson);    
    return payloadDecoded.realm_access.roles;
  }

  carregarUsuarioLogado() {    
    let usu = new Usuario();    
    this.oauthService.loadUserProfile().then( (usuario: UserInfo) => {
      usu.email = usuario.email;
      usu.name = usuario.name;
      this.usuarioLogado.next(usu);
    })    
  }

  cadastrarNovoUsuario(): void {
    window.location.href = env.KEYCLOAK_REGISTRO_URL + env.REDIRECT_TRANSPARENCIA;    
  }
}