import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalConfirmarExclusaoGenericoComponent } from './modal-confirmar-exclusao-generico.component';

describe('ModalConfirmarExclusaoGenericoComponent', () => {
  let component: ModalConfirmarExclusaoGenericoComponent;
  let fixture: ComponentFixture<ModalConfirmarExclusaoGenericoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalConfirmarExclusaoGenericoComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalConfirmarExclusaoGenericoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
