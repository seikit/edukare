insert into endereco (id, rua, numero, bairro, cidade_residencia, estado_residencia) values ( '1', 'Rua da Paz', 100, 'Centro', 'Campo Grande', 'MS');
insert into educacao (id, nivel_escolaridade) values ('1', 'SUPERIOR_COMPLETO');
insert into titulo (id, instituicao_ensino, titulo_curso, ano_conclusao, educacao_id) values ('1', 'PUC', 'Desenvolvimento Web', 2021, '1');
insert into titulo (id, instituicao_ensino, titulo_curso, ano_conclusao, educacao_id) values ('2', 'UFMS', 'Administração', 2012, '1');

insert into endereco (id, rua, numero, bairro, cidade_residencia, estado_residencia) values ( '2', 'Rua da Paz', 100, 'Centro', 'Campo Grande', 'MS');
insert into educacao (id, nivel_escolaridade) values ('2', 'SUPERIOR_COMPLETO');
insert into titulo (id, instituicao_ensino, titulo_curso, ano_conclusao, educacao_id) values ('3', 'PUC', 'Desenvolvimento Web', 2021, '2');


insert into candidato (id, email_usuario, nome_completo, cpf, filiacao1, filiacao2, email, celular, telefone_fixo, naturalidade, endereco_id, educacao_id)
values ('1', 'eder@gmail.com' ,'Eder Costa', '123.456.789-12', 'Pai', 'Mae', 'email@gmail.com', '(12)98123-1234', '(12)1234-5678', 'São Paulo/SP', '1', '1');

insert into candidato (id, email_usuario, nome_completo, cpf, filiacao1, filiacao2, email, celular, telefone_fixo, naturalidade, endereco_id, educacao_id)
values ('2', 'eder2@gmail.com' ,'Eder2 Seikitsi', '123.456.789-12', 'Pai', 'Mae', 'email2@gmail.com', '(12)98123-1234', '(12)1234-5678', 'São Paulo/SP', '2', '2');


insert into inscricao(id, email_usuario, situacao, processo_seletivo_id, data_inscricao, nome_completo, cpf, filiacao1, filiacao2, email, celular, telefone_fixo,
                      naturalidade, rua, numero, bairro, cidade_residencia, estado_residencia, nivel_escolaridade)
values (1,'eder@gmail.com','ATIVA',1,'2021-03-03 21:52:44.613119','Eder Costa','123.456.789-12','Pai', 'Mae', 'email@gmail.com', '(12)98123-1234','(12)1234-5678', 'Campo Grande','Rua da Paz',
        100,'Centro', 'São Paulo/SP','MS','SUPERIOR_COMPLETO');
insert into titulo_inscricao(id, instituicao_ensino, titulo_curso, ano_conclusao, inscricao_id) values ('1', 'PUC', 'Desenvolvimento Web', 2021, '1');
insert into titulo_inscricao(id, instituicao_ensino, titulo_curso, ano_conclusao, inscricao_id) values ('2', 'UFMS', 'Administração', 2012, '1');

insert into inscricao(id, email_usuario, situacao, processo_seletivo_id, data_inscricao, nome_completo, cpf, filiacao1, filiacao2, email, celular, telefone_fixo,
                      naturalidade, rua, numero, bairro, cidade_residencia, estado_residencia, nivel_escolaridade)
values (2,'eder2@gmail.com','ATIVA',1,'2021-03-03 21:52:44.613119','Eder2 Seikitsi','123.456.789-12','Pai', 'Mae', 'email2@gmail.com', '(12)98123-1234','(12)1234-5678', 'Campo Grande','Rua da Paz',
        200,'Centro', 'Campo Grande/SP','MS','SUPERIOR_COMPLETO');
insert into titulo_inscricao(id, instituicao_ensino, titulo_curso, ano_conclusao, inscricao_id) values ('3', 'PUC', 'Desenvolvimento Web', 2021, '2');
