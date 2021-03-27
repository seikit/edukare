// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const env = {
  production: false,
  GATEWAY_URL: 'http://localhost:8080',
  PROCESSO_MS_URL: '/processo-seletivo/api',
  CANDIDATO_MS_URL: '/candidato/api',
  ESCOLA_MS_URL: '/escola/api',
  KEYCLOAK_REGISTRO_URL: 'http://localhost:9080/auth/realms/edukare/protocol/openid-connect/registrations?response_type=code&client_id=webapp&redirect_uri=',
  KEYCLOAK_ISSUER: 'http://localhost:9080/auth/realms/edukare',
  REDIRECT_HOME: 'http://localhost:4200/home'
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
