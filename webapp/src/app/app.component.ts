import { MediaMatcher } from '@angular/cdk/layout';
import { HttpClient, HttpHeaderResponse, HttpHeaders } from '@angular/common/http';
import { ChangeDetectorRef, Component } from '@angular/core';
import { LoginService } from './shared/login/login.service';
import { MenuService } from './shared/menu.service';
import { IMenu } from './shared/models/menu.model';
import { AuthConfig, NullValidationHandler, OAuthService } from 'angular-oauth2-oidc';
import { env } from '../environments/environment';
import { AuthService } from './shared/auth/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {

  estaLogado: boolean = false;
  perfil: string = '';
  
  private _mobileQueryListener: () => void;
  mobileQuery: MediaQueryList;
  _menu: IMenu[] = [];

  constructor(private http: HttpClient,private oauthService: OAuthService, private authService: AuthService, changeDetectorRef: ChangeDetectorRef, media: MediaMatcher, private menuService: MenuService, private loginService: LoginService) {
    this.mobileQuery = media.matchMedia('(max-width: 600px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
    this.configure();
  }

  authConfig: AuthConfig = {
    issuer: env.KEYCLOAK_ISSUER,
    redirectUri: window.location.origin + "/transparencia",
    clientId: 'webapp',
    scope: 'openid profile email offline_access',
    responseType: 'code',    
    showDebugInformation: false,
    requireHttps: false
  }

  private configure() {
    this.oauthService.configure(this.authConfig);
    this.oauthService.tokenValidationHandler = new NullValidationHandler();
    this.oauthService.setupAutomaticSilentRefresh();
    this.oauthService.loadDiscoveryDocument().then(() => this.oauthService.tryLogin())
    .then(() => {
      this.estaLogado = this.loginService.estaLogado();

      if(this.estaLogado) {
        this._menu = this.menuService.montarMenuPorPerfilLogado();
        this.getPapel();
        this.carregarUsuario();
      }
    })
  }

  ngOnInit(): void {    
  }

  ngOnDestroy(): void {
    this.mobileQuery.removeListener(this._mobileQueryListener);
  }

  cadastrarUsuario(): void {
    this.authService.cadastrarNovoUsuario();
  }

  logar() {    
    this.loginService.logar();    
  }
  
  deslogar() {
    this.loginService.deslogar();
  }

  carregarUsuario() {
    this.authService.carregarUsuarioLogado();
  }
  
  getPapel() {
    const roles = this.authService.getRoles();
    if (roles.includes('SECRETARIA')) {
      this.perfil = 'Secretaria';
    } else if (roles.includes('ESCOLA')) {
      this.perfil = 'Escola';
    } else {
      this.perfil = 'Candidato';
    }
  }
}
