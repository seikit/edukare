import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpEvent, HttpResponse, HttpRequest, HttpHandler } from '@angular/common/http';
import { Observable } from 'rxjs';
import { OAuthStorage } from 'angular-oauth2-oidc';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {

    constructor(private authStorage: OAuthStorage) {}

    intercept(httpRequest: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    let token = this.authStorage.getItem('access_token');
    let header = 'Bearer ' + token;

    let headers = httpRequest.headers.set('Authorization', header);
    httpRequest = httpRequest.clone({ headers });    
    
    return next.handle(httpRequest);
    }
}