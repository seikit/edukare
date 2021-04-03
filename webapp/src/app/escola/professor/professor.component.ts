import { Component, OnInit } from '@angular/core';
import { MatTableDataSource } from '@angular/material/table';
import { IProfessor } from 'src/app/secretaria/models/professor';
import { ProfessorService } from 'src/app/secretaria/services/professor.service';
import { AuthService } from 'src/app/shared/auth/auth.service';
import { Usuario } from 'src/app/shared/models/usuario';
import { EscolaService } from '../services/escola.service';

@Component({
  selector: 'app-professor',
  templateUrl: './professor.component.html',
  styleUrls: ['./professor.component.scss']
})
export class ProfessorComponent implements OnInit {
  dados: MatTableDataSource<IProfessor> = new MatTableDataSource<IProfessor>(); 
  colunas: string[] = ['nome', 'cpf', 'celular', 'fixo' ,'email', 'escolaEncaminhamento'];
  constructor(private professorService: ProfessorService, private authService: AuthService, private escolaService: EscolaService) { }

  ngOnInit(): void {
    this.authService.usuarioLogado.subscribe( (usu:Usuario) => {
      this.escolaService.carregarEscolaDoUsuarioLogado(usu.email).subscribe(data => {
        if(data.ok && data.body) {
          const escolaId = data.body?.id ? data.body.id : 0;
          this.professorService.carregarProfessoresDaEscola(escolaId).subscribe(data => {
            if(data.ok && data.body) {
              this.dados = new MatTableDataSource<IProfessor>(data.body);
            }
          })
        }
      })
    })
  }

  exportarDadosProfessores(): void {}

  visualizar(professor: IProfessor): void {
    
  }

}
