import { Directive, NgModule, Renderer2, ElementRef, HostListener } from '@angular/core';

@Directive({
  selector: '[somenteNumero]'
})
export class SomenteNumeroDirective {
  
  constructor(private el: ElementRef<HTMLInputElement>) { }

  @HostListener('input', ['$event']) onInputChange(event: Event) {
    const valorInicial = this.el.nativeElement.value;
    this.el.nativeElement.value = valorInicial.replace(/[^0-9]*/g, '');
    if (valorInicial !== this.el.nativeElement.value) {
      event.stopPropagation();
    }
  }

}

@NgModule({
  declarations: [SomenteNumeroDirective],
  exports: [SomenteNumeroDirective]
})

export class SomenteNumeroDirectiveModule{}
