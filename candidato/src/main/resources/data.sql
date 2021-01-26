insert into endereco (id, rua, numero, bairro, cidade_residencia, estado_residencia) values ( '1', 'Rua da Paz', 100, 'Centro', 'Campo Grande', 'MS');
insert into educacao (id, nivel_escolaridade) values ('1', 'SUPERIOR COMPLETO');
insert into titulo (id, instituicao_ensino, titulo_curso, ano_conclusao, educacao_id) values ('1', 'PUC', 'Desenvolvimento Web', 2021, '1');

insert into candidato (id, nome_completo, cpf, filiacao1, filiacao2, email, celular, telefone_fixo, naturalidade, endereco_id, educacao_id)
values ('1', 'Jão Silva', '123.456.789-12', 'Pedro Silva', 'Maria Silva', 'email@gmail.com', '(12)98123-1234', '(12)1234-5678', 'São Paulo/SP', '1', '1');
