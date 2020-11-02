import { MediaMatcher } from '@angular/cdk/layout';
import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-processo-seletivo-detalhes',
  templateUrl: './processo-seletivo-detalhes.component.html',
  styleUrls: ['./processo-seletivo-detalhes.component.scss']
})
export class ProcessoSeletivoDetalhesComponent implements OnInit {

  private _mobileQueryListener: () => void;
  mobileQuery: MediaQueryList;
  form: FormGroup;
  
  constructor(private fb: FormBuilder, changeDetectorRef: ChangeDetectorRef, media: MediaMatcher) {
    this.mobileQuery = media.matchMedia('(max-width: 600px)');
    this._mobileQueryListener = () => changeDetectorRef.detectChanges();
    this.mobileQuery.addListener(this._mobileQueryListener);
    
    this.form = this.fb.group({
      titulo: ['',Validators.required],
      situacao: [''],
      dtInicioInscricao: ['', Validators.required],
      dtEncerramentoInscricao: ['',Validators.required],
      candidatos: [''],
      etapas: ['']
    })
   }

  ngOnInit(): void {
  }

  onSubmit(dadosFormulario: any) {
    console.log(this.form.get('dp3')?.value)
  }

}
