import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalConfirmacaoCancelamentoComponent } from './modal-confirmacao-cancelamento.component';

describe('ModalConfirmacaoCancelamentoComponent', () => {
  let component: ModalConfirmacaoCancelamentoComponent;
  let fixture: ComponentFixture<ModalConfirmacaoCancelamentoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalConfirmacaoCancelamentoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalConfirmacaoCancelamentoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
