import { TestBed } from '@angular/core/testing';

import { ProcessoSeletivoService } from './processo-seletivo.service';

describe('ProcessoSeletivoService', () => {
  let service: ProcessoSeletivoService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ProcessoSeletivoService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
