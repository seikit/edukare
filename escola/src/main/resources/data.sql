insert into demanda_professores (id, ano, disciplina, semestre, escola, escola_id, quantidade, justificativa) values (1, 2021, 'Português', 2, 'Machado de Assis',1, 1, 'Estudo');
insert into demanda_professores (id, ano, disciplina, semestre, escola, escola_id, quantidade, justificativa) values (2, 2021, 'Matemática', 2, 'Monteiro Lobato',2, 1, 'Saúde');
insert into demanda_professores (id, ano, disciplina, semestre, escola, escola_id, quantidade, justificativa) values (3, 2021, 'Matemática', 1, 'Monteiro Lobato',2, 10, 'Saúde');

insert into disciplina (id, nome, ativa) values (1, 'Matemática', 'S');
insert into disciplina (id, nome, ativa) values (2, 'Português', 'S');
insert into disciplina (id, nome, ativa) values (3, 'Inglês', 'S');
insert into disciplina (id, nome, ativa) values (4, 'Espanhol', 'S');
insert into disciplina (id, nome, ativa) values (5, 'Educação física', 'S');
insert into disciplina (id, nome, ativa) values (6, 'Geografia', 'S');
insert into disciplina (id, nome, ativa) values (7, 'História', 'S');
insert into disciplina (id, nome, ativa) values (8, 'Informática', 'S');
insert into disciplina (id, nome, ativa) values (9, 'Educação financeira', 'N');

insert into escola (id, nome) values (1, 'Machado de Assis');
insert into escola (id, nome) values (2, 'Monteiro Lobato');

insert into usuario (id, nome, email, escola_id) values (1, 'Ana', 'ana@gmail.com', 1);
insert into usuario (id, nome, email, escola_id) values (2, 'Pedro', 'pedro@gmail.com', 2);
