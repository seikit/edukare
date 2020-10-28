import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcessoSeletivoDetalhesComponent } from './processo-seletivo-detalhes.component';

describe('ProcessoSeletivoDetalhesComponent', () => {
  let component: ProcessoSeletivoDetalhesComponent;
  let fixture: ComponentFixture<ProcessoSeletivoDetalhesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProcessoSeletivoDetalhesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcessoSeletivoDetalhesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
