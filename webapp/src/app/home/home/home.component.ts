import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { CandidatoService } from 'src/app/candidato/services/inscrito.service';
import { IProcessoSeletivo, ProcessoSeletivo } from 'src/app/secretaria/models/processo-seletivo';
import { IProfessor } from 'src/app/secretaria/models/professor';
import { ProcessoSeletivoService } from 'src/app/secretaria/processo-seletivo/processo-seletivo.service';
import { ProfessorService } from 'src/app/secretaria/services/professor.service';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { Usuario } from 'src/app/shared/models/usuario';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {
  usuarioLogado = 'cidadão';
  totalProcessos = 0;
  totalInscritos = 0;
  totalAprovados = 0;
  totalEncaminhados = 0;
  processos: IProcessoSeletivo [] = []
  fonteDados: MatTableDataSource<IProfessor> = new MatTableDataSource<IProfessor>([]);  
  colunas: string[] = ['numeroProcesso','nome'];
  
  constructor(private processoService: ProcessoSeletivoService, private professorService: ProfessorService, private candidatoService: CandidatoService, private authService: AuthService) { }

  ngOnInit(): void {
    this.authService.usuarioLogado.subscribe( (usu: Usuario) => {      
      this.usuarioLogado = usu.name ? usu.name : 'cidadão';
    });
    
    this.processoService.carregarProcessosConcluidos().subscribe(data => {      
      if(data.ok && data.body) {
        this.processos = data.body;
      }
    })

    this.processoService.carregarQuantitativoConcluidos().subscribe(qtd => {      
      if(qtd > 0) {
        this.totalProcessos = qtd;
      }
    })

    this.professorService.carregarQuantitativoAprovadosNoAnoCorrente().subscribe(qtd => {
      if(qtd > 0) {
        this.totalAprovados = qtd;
      }
    })

    this.professorService.carregarQuantitativoEncaminhadosNoAnoCorrente().subscribe(qtd => {
      if(qtd > 0) {
        this.totalEncaminhados = qtd;
      }
    })

    this.candidatoService.carregarQuantitativoInscritosNoAno().subscribe(qtd => {
      if(qtd > 0) {
        this.totalInscritos = qtd;
      }
    })
  }

  carregarAprovadosNoProcesso(id: number): void {
    if(id) {
      this.professorService.carregarProfessoresDoProcesso(id).subscribe(data => {
        if (data.ok && data.body) {
          this.fonteDados = new MatTableDataSource<IProfessor>(data.body);          
        }
      })
    }
    this.fonteDados = new MatTableDataSource<IProfessor>([]);;
  }

}
