import { Directive, Input, HostListener, NgModule, Renderer2, ElementRef } from '@angular/core';

@Directive({
  selector: '[mascara]'
})
export class MascaraDirective {

  @Input('mascara') tipo: string = '';  
  
  constructor(private renderer: Renderer2, private el: ElementRef<HTMLInputElement>) {}
  
  @HostListener('window:keyup', ['$event']) onKeyUp() {
    if (this.tipo === 'celular') {
      this.aplicarMascaraCelular(this.el.nativeElement.value);
    } else if (this.tipo === 'telefone') {
      this.aplicarMascaraTelefone(this.el.nativeElement.value);
    } else if (this.tipo === 'cpf') {
      this.aplicarMascaraCpf(this.el.nativeElement.value);
    }
  }

  aplicarMascaraCelular(celular: string): void {    
    const value = celular.toString().replace(/\D/g, '');
    let celularFormatado = '';
    
    if (value.length > 7) {      
      celularFormatado = value.replace(/^(\d{2})?(\d{5})?(\d{0,4})/, '($1)$2-$3');
    } else if (value.length > 1) {
      celularFormatado = value.replace(/^(\d{2})?(\d{0,5})/, '($1)$2');
    } else {      
        if (value !== '') { 
          celularFormatado = value.replace(/^(\d*)/, '($1');
        }
    }
    this.renderizarValorAtualizado(celularFormatado)
  }

  aplicarMascaraTelefone(telefone: string): void {
    const value = telefone.replace(/\D/g, '');
    let telefoneFormatado = '';

    if (value.length > 7) {
      telefoneFormatado = value.replace(/^(\d{2})?(\d{4})?(\d{0,4})/, '($1)$2-$3');
    } else if (value.length > 1) {
      telefoneFormatado = value.replace(/^(\d{2})?(\d{0,4})/, '($1)$2');
    } else {      
        if (value !== '') { 
          telefoneFormatado = value.replace(/^(\d*)/, '($1');
        }
    }
    this.renderizarValorAtualizado(telefoneFormatado)
  }

  aplicarMascaraCpf(cpf: string): void {
    const value = cpf.replace(/\D/g, '');
    let cpfFormatado = '';
    
    if (value.length > 8) {
      cpfFormatado = value.replace(/^(\d{3})?(\d{3})?(\d{3})?(\d{0,2})/, '$1.$2.$3-$4')
    } else if (value.length > 6) {
      cpfFormatado = value.replace(/^(\d{3})?(\d{3})?(\d{0,3})/, '$1.$2.$3');
    } else if (value.length > 3) {
      cpfFormatado = value.replace(/^(\d{3})?(\d{0,3})/, '$1.$2');
    } else {
      if (value !== '') {
        cpfFormatado = value.replace(/^(\d*)/, '$1.')
      }
    }
    this.renderizarValorAtualizado(cpfFormatado);
  }

  renderizarValorAtualizado(valor: string) {    
    this.renderer.setProperty(this.el.nativeElement, 'value', valor.trim());    
  }
}

@NgModule({
  declarations: [ MascaraDirective ],
  exports: [ MascaraDirective ]
})

export class MascaraDirectiveModule{}