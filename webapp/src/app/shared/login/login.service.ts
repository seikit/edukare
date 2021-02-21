import { Injectable } from "@angular/core";
import { OAuthService } from "angular-oauth2-oidc";

@Injectable({
    providedIn: 'root'
})
export class LoginService { 

    constructor(private oauthService: OAuthService) {}

    estaLogado(): boolean {
        return (this.oauthService.hasValidIdToken() && this.oauthService.hasValidAccessToken());
    }

    logar() {
        this.oauthService.initCodeFlow();
    }
    
    deslogar() {
        this.oauthService.logOut();
    }

}