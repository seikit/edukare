import { Injectable } from "@angular/core";
import { OAuthService } from "angular-oauth2-oidc";

@Injectable({ providedIn: 'root' })
export class AuthService {

  constructor(private oauthService: OAuthService) {}

  getRoles(): string[] {
    const token = this.oauthService.getAccessToken();
    const payload = token.split('.')[1];
    const payloadDecodedJson = atob(payload);
    const payloadDecoded = JSON.parse(payloadDecodedJson);    
    return payloadDecoded.realm_access.roles;
  }
}