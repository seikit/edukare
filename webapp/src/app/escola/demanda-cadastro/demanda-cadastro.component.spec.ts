import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DemandaCadastroComponent } from './demanda-cadastro.component';

describe('DemandaCadastroComponent', () => {
  let component: DemandaCadastroComponent;
  let fixture: ComponentFixture<DemandaCadastroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DemandaCadastroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DemandaCadastroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
