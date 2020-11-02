import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProcessoSeletivoCadastroComponent } from './processo-seletivo-cadastro.component';

describe('ProcessoSeletivoCadastroComponent', () => {
  let component: ProcessoSeletivoCadastroComponent;
  let fixture: ComponentFixture<ProcessoSeletivoCadastroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProcessoSeletivoCadastroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ProcessoSeletivoCadastroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
