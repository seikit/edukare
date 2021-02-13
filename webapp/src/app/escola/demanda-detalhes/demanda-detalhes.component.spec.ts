import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DemandaDetalhesComponent } from './demanda-detalhes.component';

describe('DemandaDetalhesComponent', () => {
  let component: DemandaDetalhesComponent;
  let fixture: ComponentFixture<DemandaDetalhesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DemandaDetalhesComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DemandaDetalhesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
