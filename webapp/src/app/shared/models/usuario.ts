export class Usuario {
    name?: string
    email?: string

    constructor(nome?: string, email?: string) {
        this.name = nome;
        this.email = email;
    }
}