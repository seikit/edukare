import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalConfirmarCancelamentoExclusaoComponent } from './modal-confirmar-cancelamento-exclusao.component';

describe('ModalConfirmarCancelamentoExclusaoComponent', () => {
  let component: ModalConfirmarCancelamentoExclusaoComponent;
  let fixture: ComponentFixture<ModalConfirmarCancelamentoExclusaoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalConfirmarCancelamentoExclusaoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalConfirmarCancelamentoExclusaoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
