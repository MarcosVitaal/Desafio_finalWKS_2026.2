-- criando o sche,a da clinica, e usando o use para deixar claro para o mysql qual banco eu quero utlizar --
CREATE SCHEMA clinica_rare;
USE clinica_rare;

-- criando a tabela do convenio --
CREATE TABLE convenio (
    id_convenio INT NOT NULL,
    nome_convenio VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18),
    telefone VARCHAR(15),
    email VARCHAR(100),
    cobertura VARCHAR(200),
    tipo_plano VARCHAR(50),
    endereco VARCHAR(200),
    
    PRIMARY KEY (id_convenio),
    -- unique funcioana para que o cnpj da empresa nao se repita em outra, evitando erros --
    UNIQUE (cnpj)
);

-- criando a tabela paciente --
CREATE TABLE paciente (
CPF VARCHAR (14) NOT NULL,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(150) NOT NULL,
id_paciente INT NOT NULL,
genero VARCHAR (50) NOT NULL,
email VARCHAR (100) NOT NULL,
telefone VARCHAR (15) NOT NULL,
data_nascimento DATE NOT NULL,
id_convenio INT,
   PRIMARY KEY (id_paciente),
   UNIQUE (CPF),
   -- utilizando a chave estrangeira do convenio --
 FOREIGN KEY  (id_convenio)
  REFERENCES convenio(id_convenio)
);

-- criando a tabela medico --
CREATE TABLE medico (
CRM VARCHAR (20) NOT NULL, 
especialidade VARCHAR (70) NOT NULL,
nome VARCHAR (100) NOT NULL, 
telefone VARCHAR (15) NOT NULL,
data_contratacao DATE NOT NULL,
endereco VARCHAR (100) NOT NULL,
id_medico INT NOT NULL,
email VARCHAR (100) NOT NULL,

    PRIMARY KEY (id_medico),
	UNIQUE (CRM)
);
-- criando a tabela consultas --
CREATE TABLE registros_consultas (
    id_consulta INT NOT NULL,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    motivo VARCHAR(200),
    diagnostico VARCHAR(300),
    observacoes TEXT,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    
    PRIMARY KEY (id_consulta),
    FOREIGN KEY (id_paciente) 
        REFERENCES paciente(id_paciente),
	FOREIGN KEY (id_medico) 
        REFERENCES medico(id_medico)
);
-- criando a tabela prontuarios_eletronicos -- 
CREATE TABLE prontuarios_eletronicos (
    id_prontuario INT NOT NULL,
    data_criacao DATE NOT NULL,
    historico_medico TEXT,
    alergias TEXT,
    medicamentos TEXT,
    observacoes TEXT,
    tipo_sanguineo VARCHAR(5),
    id_paciente INT NOT NULL,
    
    PRIMARY KEY (id_prontuario),
	FOREIGN KEY (id_paciente) 
        REFERENCES paciente(id_paciente)
);
-- criando a tabela funcionarios -- 
CREATE TABLE funcionarios (
    id_funcionario INT NOT NULL,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    cargo VARCHAR(80),
    data_admissao DATE,
    telefone VARCHAR(15),
    email VARCHAR(100),
    salario DECIMAL(10,2),
    
    PRIMARY KEY (id_funcionario),
    UNIQUE (cpf)
);
-- criando a tabela pagamentos -- 
CREATE TABLE pagamentos (
    id_pagamento INT NOT NULL,
    data_pagamento DATE NOT NULL,
    horario_pagamento TIME,
    forma_pagamento VARCHAR(30),
    valor DECIMAL(10,2) NOT NULL,
    situacao VARCHAR(30),
    descricao VARCHAR(200),
    id_paciente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_vencimento DATE NOT NULL,
    PRIMARY KEY (id_pagamento),
    FOREIGN KEY (id_paciente) 
        REFERENCES paciente(id_paciente),
	FOREIGN KEY (id_funcionario) 
        REFERENCES funcionarios(id_funcionario)
);

-- inserindo os dados na entidade convenio --
INSERT INTO convenio 
(id_convenio, nome_convenio, cnpj, telefone, email, cobertura, tipo_plano, endereco)
VALUES
(1, 'Unimed', '12.345.678/0001-90', '(83) 3221-4500', 'contato@unimed.com.br', 'Consultas, exames e internações', 'Empresarial', 'Av. Epitácio Pessoa, 1200 - João Pessoa - PB'),

(2, 'Hapvida', '23.456.789/0001-81', '(83) 3214-7800', 'atendimento@hapvida.com.br', 'Consultas, exames e procedimentos', 'Individual', 'Av. Dom Pedro II, 850 - João Pessoa - PB'),

(3, 'Amil', '34.567.890/0001-72', '(11) 3003-1333', 'atendimento@amil.com.br', 'Consultas, exames e internações', 'Familiar', 'Av. Ibirapuera, 2120 - São Paulo - SP'),

(4, 'Bradesco Saúde', '45.678.901/0001-63', '(11) 4004-2700', 'atendimento@bradescosaude.com.br', 'Consultas, exames, cirurgias e internações', 'Empresarial', 'Av. Alphaville, 500 - Barueri - SP'),

(5, 'SulAmérica Saúde', '56.789.012/0001-54', '(11) 3003-1150', 'atendimento@sulamerica.com.br', 'Consultas, exames e hospitalização', 'Familiar', 'Rua Bela Cintra, 967 - São Paulo - SP'),

(6, 'NotreDame Intermédica', '67.890.123/0001-45', '(11) 3155-8000', 'contato@gndi.com.br', 'Consultas, exames e internações', 'Individual', 'Av. Paulista, 1000 - São Paulo - SP'),

(7, 'Porto Seguro Saúde', '78.901.234/0001-36', '(11) 3366-3000', 'saude@portoseguro.com.br', 'Consultas, exames e procedimentos', 'Empresarial', 'Alameda Barão de Piracicaba, 740 - São Paulo - SP'),

(8, 'Assim Saúde', '89.012.345/0001-27', '(21) 2102-9797', 'atendimento@assim.com.br', 'Consultas, exames e internações', 'Familiar', 'Rua do Ouvidor, 90 - Rio de Janeiro - RJ'),

(9, 'Geap Saúde', '90.123.456/0001-18', '(61) 3003-6500', 'atendimento@geap.com.br', 'Consultas, exames e tratamentos', 'Individual', 'SCS Quadra 09, Bloco A - Brasília - DF'),

(10, 'Cassi', '10.234.567/0001-09', '(61) 3212-5000', 'atendimento@cassi.com.br', 'Consultas, exames e internações', 'Familiar', 'Setor Bancário Sul, Quadra 04 - Brasília - DF'),

(11, 'Care Plus', '21.345.678/0001-90', '(11) 4197-8000', 'contato@careplus.com.br', 'Consultas, exames, cirurgias e internações', 'Empresarial', 'Alameda Araguaia, 2044 - Barueri - SP'),

(12, 'Prevent Senior', '32.456.789/0001-81', '(11) 3003-5255', 'atendimento@preventsenior.com.br', 'Consultas, exames e internações', 'Individual', 'Rua Augusta, 2000 - São Paulo - SP'),

(13, 'MedSênior', '43.567.890/0001-72', '(27) 4009-7000', 'contato@medsenior.com.br', 'Consultas, exames e tratamentos', 'Familiar', 'Av. Nossa Senhora da Penha, 1500 - Vitória - ES'),

(14, 'Unimed João Pessoa', '54.678.901/0001-63', '(83) 2106-0000', 'contato@unimedjp.com.br', 'Consultas, exames, cirurgias e internações', 'Empresarial', 'Av. Ministro José Américo, 120 - João Pessoa - PB'),

(15, 'Postal Saúde', '65.789.012/0001-54', '(61) 4003-4000', 'atendimento@postalsaude.com.br', 'Consultas, exames e procedimentos', 'Individual', 'Setor Comercial Sul, Quadra 02 - Brasília - DF');
 -- verificando se estada tudo correto com a tabela -- 
 SELECT * FROM convenio;
 
 -- inserindo os dados em paciente -- 
 INSERT INTO paciente
(cpf, nome, endereco, id_paciente, genero, email, telefone, data_nascimento, id_convenio)
VALUES
('123.456.789-01', 'Lucas Ferreira da Silva', 'Rua das Acácias, 125 - João Pessoa - PB', 1, 'Masculino', 'lucas.ferreira@email.com', '(83) 98821-4532', '1998-04-12', 1),

('234.567.890-12', 'Mariana Alves Santos', 'Av. Beira Rio, 450 - João Pessoa - PB', 2, 'Feminino', 'mariana.santos@email.com', '(83) 98734-6210', '2001-09-25', 2),

('345.678.901-23', 'Pedro Henrique Oliveira', 'Rua João Machado, 320 - João Pessoa - PB', 3, 'Masculino', 'pedro.oliveira@email.com', '(83) 99652-1843', '1995-02-18', 14),

('456.789.012-34', 'Ana Beatriz Costa', 'Rua dos Ipês, 87 - João Pessoa - PB', 4, 'Feminino', 'ana.costa@email.com', '(83) 98845-7391', '2003-07-06', 1),

('567.890.123-45', 'Rafael Gomes Pereira', 'Av. Epitácio Pessoa, 890 - João Pessoa - PB', 5, 'Masculino', 'rafael.pereira@email.com', '(83) 99128-5647', '1989-11-30', 3),

('678.901.234-56', 'Camila Rodrigues Lima', 'Rua Empresário João Rodrigues Alves, 210 - João Pessoa - PB', 6, 'Feminino', 'camila.lima@email.com', '(83) 98765-3214', '1997-05-22', 4),

('789.012.345-67', 'Gabriel Martins Souza', 'Rua Bancário Sérgio Guerra, 560 - João Pessoa - PB', 7, 'Masculino', 'gabriel.souza@email.com', '(83) 99641-2875', '2000-01-15', 5),

('890.123.456-78', 'Juliana Carvalho Mendes', 'Av. Presidente Castelo Branco, 730 - João Pessoa - PB', 8, 'Feminino', 'juliana.mendes@email.com', '(83) 98876-4532', '1992-08-09', 6),

('901.234.567-89', 'Felipe Augusto Rocha', 'Rua Maria Rosa, 145 - João Pessoa - PB', 9, 'Masculino', 'felipe.rocha@email.com', '(83) 99154-7623', '1987-03-27', 7),

('012.345.678-90', 'Beatriz Fernandes Souza', 'Rua Antônio Lira, 98 - João Pessoa - PB', 10, 'Feminino', 'beatriz.souza@email.com', '(83) 98723-9184', '2004-12-03', 8),

('112.233.445-56', 'André Luiz Barbosa', 'Av. Nossa Senhora dos Navegantes, 620 - João Pessoa - PB', 11, 'Masculino', 'andre.barbosa@email.com', '(83) 99678-3421', '1993-06-17', 9),

('223.344.556-67', 'Larissa Vitória Ramos', 'Rua José Américo de Almeida, 275 - João Pessoa - PB', 12, 'Feminino', 'larissa.ramos@email.com', '(83) 98832-7154', '1999-10-11', 10),

('334.455.667-78', 'Thiago Nascimento Silva', 'Rua Professor Álvaro de Carvalho, 410 - João Pessoa - PB', 13, 'Masculino', 'thiago.silva@email.com', '(83) 99146-5832', '1985-01-29', 11),

('445.566.778-89', 'Isabela Monteiro Castro', 'Av. Cabo Branco, 1020 - João Pessoa - PB', 14, 'Feminino', 'isabela.castro@email.com', '(83) 98791-4265', '2002-04-21', 12),

('556.677.889-90', 'Bruno César Almeida', 'Rua Professor Severino Bezerra, 185 - João Pessoa - PB', 15, 'Masculino', 'bruno.almeida@email.com', '(83) 99635-2478', '1991-12-14', 14);
-- verificando se esta tudo correto com a tabela
SELECT * FROM paciente;

-- inserindo os dados na entidade medico --
INSERT INTO medico
(CRM, especialidade, nome, telefone, data_contratacao, endereco, id_medico, email)
VALUES
('CRM-PB 10234', 'Cardiologia', 'Dr. Ricardo Almeida', '(83) 98821-4532', '2020-03-15', 'Av. Epitácio Pessoa, 1200 - João Pessoa - PB', 1, 'ricardo.almeida@clinica.com'),

('CRM-PB 11567', 'Dermatologia', 'Dra. Fernanda Costa', '(83) 98734-6210', '2021-06-22', 'Rua das Acácias, 250 - João Pessoa - PB', 2, 'fernanda.costa@clinica.com'),

('CRM-PB 12891', 'Ortopedia', 'Dr. Marcelo Ferreira', '(83) 99652-1843', '2019-08-10', 'Av. Dom Pedro II, 850 - João Pessoa - PB', 3, 'marcelo.ferreira@clinica.com'),

('CRM-PB 13456', 'Pediatria', 'Dra. Juliana Santos', '(83) 98845-7391', '2022-01-17', 'Rua João Machado, 320 - João Pessoa - PB', 4, 'juliana.santos@clinica.com'),

('CRM-PB 14782', 'Neurologia', 'Dr. André Martins', '(83) 99128-5647', '2018-11-05', 'Av. Beira Rio, 450 - João Pessoa - PB', 5, 'andre.martins@clinica.com'),

('CRM-PB 15329', 'Ginecologia', 'Dra. Camila Rodrigues', '(83) 98765-3214', '2020-09-28', 'Rua Empresário João Rodrigues Alves, 210 - João Pessoa - PB', 6, 'camila.rodrigues@clinica.com'),

('CRM-PB 16743', 'Oftalmologia', 'Dr. Gabriel Oliveira', '(83) 99641-2875', '2021-04-12', 'Rua Bancário Sérgio Guerra, 560 - João Pessoa - PB', 7, 'gabriel.oliveira@clinica.com'),

('CRM-PB 17485', 'Endocrinologia', 'Dra. Mariana Lima', '(83) 98876-4532', '2019-12-03', 'Av. Presidente Castelo Branco, 730 - João Pessoa - PB', 8, 'mariana.lima@clinica.com'),

('CRM-PB 18932', 'Psiquiatria', 'Dr. Felipe Rocha', '(83) 99154-7623', '2022-07-19', 'Rua Maria Rosa, 145 - João Pessoa - PB', 9, 'felipe.rocha@clinica.com'),

('CRM-PB 19376', 'Clínica Geral', 'Dra. Beatriz Souza', '(83) 98723-9184', '2023-02-06', 'Rua Antônio Lira, 98 - João Pessoa - PB', 10, 'beatriz.souza@clinica.com'),

('CRM-PB 20741', 'Gastroenterologia', 'Dr. André Barbosa', '(83) 99678-3421', '2018-05-14', 'Av. Nossa Senhora dos Navegantes, 620 - João Pessoa - PB', 11, 'andre.barbosa@clinica.com'),

('CRM-PB 21458', 'Urologia', 'Dr. Thiago Ramos', '(83) 98832-7154', '2020-10-21', 'Rua José Américo de Almeida, 275 - João Pessoa - PB', 12, 'thiago.ramos@clinica.com'),

('CRM-PB 22863', 'Otorrinolaringologia', 'Dra. Larissa Nascimento', '(83) 99146-5832', '2021-08-30', 'Rua Professor Álvaro de Carvalho, 410 - João Pessoa - PB', 13, 'larissa.nascimento@clinica.com'),

('CRM-PB 23579', 'Infectologia', 'Dr. Bruno Castro', '(83) 98791-4265', '2019-06-18', 'Av. Cabo Branco, 1020 - João Pessoa - PB', 14, 'bruno.castro@clinica.com'),

('CRM-PB 24186', 'Pneumologia', 'Dra. Isabela Monteiro', '(83) 99635-2478', '2023-03-27', 'Rua Professor Severino Bezerra, 185 - João Pessoa - PB', 15, 'isabela.monteiro@clinica.com');
-- verificando se esta tudo correto com a tabela
SELECT * FROM medico;

-- inserindo os dados na entidade registros_consultas -- 
INSERT INTO registros_consultas
(id_consulta, data_consulta, horario, motivo, diagnostico, observacoes, id_paciente, id_medico)
VALUES
(1, '2026-08-01', '08:00:00', 'Dor no peito', 'Avaliação cardiológica', 'Solicitado exame de eletrocardiograma', 1, 1),

(2, '2026-08-01', '09:30:00', 'Manchas na pele', 'Dermatite', 'Prescrito tratamento tópico', 2, 2),

(3, '2026-08-02', '10:00:00', 'Dor no joelho', 'Inflamação articular', 'Recomendado repouso e fisioterapia', 3, 3),

(4, '2026-08-03', '08:30:00', 'Febre e tosse', 'Infecção respiratória', 'Orientado repouso e hidratação', 4, 4),

(5, '2026-08-04', '11:00:00', 'Dor de cabeça frequente', 'Cefaleia', 'Solicitada avaliação neurológica', 5, 5),

(6, '2026-08-05', '14:00:00', 'Consulta de rotina', 'Avaliação ginecológica', 'Exames de rotina solicitados', 6, 6),

(7, '2026-08-06', '15:30:00', 'Dificuldade para enxergar', 'Alteração visual', 'Recomendado exame oftalmológico', 7, 7),

(8, '2026-08-07', '09:00:00', 'Cansaço excessivo', 'Alteração hormonal suspeita', 'Solicitados exames laboratoriais', 8, 8),

(9, '2026-08-08', '16:00:00', 'Ansiedade', 'Transtorno de ansiedade', 'Recomendado acompanhamento psicológico', 9, 9),

(10, '2026-08-10', '08:00:00', 'Dor abdominal', 'Gastrite', 'Orientada mudança na alimentação', 10, 11),

(11, '2026-08-11', '10:30:00', 'Azia frequente', 'Refluxo gastroesofágico', 'Prescrito tratamento e acompanhamento', 11, 11),

(12, '2026-08-12', '13:30:00', 'Dor ao urinar', 'Infecção urinária', 'Solicitado exame de urina', 12, 12),

(13, '2026-08-13', '14:30:00', 'Dor de garganta', 'Faringite', 'Orientado repouso e hidratação', 13, 13),

(14, '2026-08-14', '09:30:00', 'Tosse persistente', 'Inflamação das vias respiratórias', 'Solicitado exame de imagem', 14, 15),

(15, '2026-08-15', '11:30:00', 'Falta de ar', 'Avaliação pulmonar', 'Solicitado exame respiratório', 15, 15);
-- verificando se esta tudo correto com a tabela
SELECT * FROM registros_consultas;

-- inserir os dados na entidade prontuarios_eletronicos --
INSERT INTO prontuarios_eletronicos
(id_prontuario, data_criacao, historico_medico, alergias, medicamentos, observacoes, tipo_sanguineo, id_paciente)
VALUES
(1, '2026-01-10', 'Histórico de consultas cardiológicas', 'Nenhuma', 'Nenhum', 'Paciente em acompanhamento', 'O+', 1),

(2, '2026-01-15', 'Histórico de problemas dermatológicos', 'Penicilina', 'Antialérgico', 'Acompanhamento dermatológico', 'A+', 2),

(3, '2026-02-02', 'Histórico de dores articulares', 'Nenhuma', 'Analgésico', 'Recomendado acompanhamento ortopédico', 'B+', 3),

(4, '2026-02-08', 'Histórico de infecções respiratórias', 'Poeira', 'Nenhum', 'Apresenta alergia respiratória', 'O-', 4),

(5, '2026-02-14', 'Histórico de cefaleias frequentes', 'Nenhuma', 'Analgésico', 'Acompanhamento neurológico', 'AB+', 5),

(6, '2026-02-20', 'Histórico de consultas ginecológicas', 'Nenhuma', 'Anticoncepcional', 'Exames de rotina atualizados', 'A-', 6),

(7, '2026-03-01', 'Histórico de alterações visuais', 'Nenhuma', 'Nenhum', 'Acompanhamento oftalmológico', 'B-', 7),

(8, '2026-03-05', 'Histórico de alterações hormonais', 'Nenhuma', 'Suplemento vitamínico', 'Realiza exames periódicos', 'O+', 8),

(9, '2026-03-12', 'Histórico de acompanhamento psicológico', 'Nenhuma', 'Nenhum', 'Acompanhamento regular', 'A+', 9),

(10, '2026-03-18', 'Histórico de problemas gastrointestinais', 'Lactose', 'Omeprazol', 'Orientado acompanhamento clínico', 'O+', 10),

(11, '2026-03-22', 'Histórico de refluxo gastroesofágico', 'Nenhuma', 'Omeprazol', 'Recomendadas mudanças alimentares', 'AB-', 11),

(12, '2026-04-02', 'Histórico de infecção urinária', 'Nenhuma', 'Antibiótico', 'Acompanhamento após tratamento', 'A+', 12),

(13, '2026-04-10', 'Histórico de problemas respiratórios', 'Poeira', 'Nenhum', 'Recomendado acompanhamento médico', 'B+', 13),

(14, '2026-04-18', 'Histórico de problemas respiratórios leves', 'Nenhuma', 'Antialérgico', 'Paciente em acompanhamento', 'O-', 14),

(15, '2026-05-01', 'Histórico de avaliação pulmonar', 'Nenhuma', 'Nenhum', 'Exames respiratórios solicitados', 'A-', 15);
-- verificando se esta tudo correto na tabela
SELECT * FROM prontuarios_eletronicos;

-- inserindo os dados na entidade funcioranios -- 
 INSERT INTO funcionarios
(id_funcionario, nome, cpf, cargo, data_admissao, telefone, email, salario)
VALUES
(1, 'Carlos Eduardo Silva', '123.456.789-01', 'Recepcionista', '2021-02-15', '(83) 98821-4532', 'carlos.silva@clinica.com', 2200.00),

(2, 'Amanda Beatriz Costa', '234.567.890-12', 'Secretária', '2022-05-10', '(83) 98734-6210', 'amanda.costa@clinica.com', 2400.00),

(3, 'Rafael Gomes Pereira', '345.678.901-23', 'Administrador', '2020-08-03', '(83) 99652-1843', 'rafael.pereira@clinica.com', 4200.00),

(4, 'Juliana Martins Souza', '456.789.012-34', 'Recepcionista', '2023-01-20', '(83) 98845-7391', 'juliana.souza@clinica.com', 2250.00),

(5, 'Fernando Alves Rocha', '567.890.123-45', 'Auxiliar administrativo', '2019-11-12', '(83) 99128-5647', 'fernando.rocha@clinica.com', 2800.00),

(6, 'Camila Rodrigues Lima', '678.901.234-56', 'Enfermeira', '2021-07-05', '(83) 98765-3214', 'camila.lima@clinica.com', 3800.00),

(7, 'Gabriel Oliveira Santos', '789.012.345-67', 'Recepcionista', '2022-09-18', '(83) 99641-2875', 'gabriel.santos@clinica.com', 2300.00),

(8, 'Mariana Ferreira Alves', '890.123.456-78', 'Técnica de enfermagem', '2020-04-27', '(83) 98876-4532', 'mariana.alves@clinica.com', 3200.00),

(9, 'Felipe Augusto Martins', '901.234.567-89', 'Financeiro', '2018-06-11', '(83) 99154-7623', 'felipe.martins@clinica.com', 3600.00),

(10, 'Beatriz Fernandes Lima', '012.345.678-90', 'Secretária', '2023-03-06', '(83) 98723-9184', 'beatriz.lima@clinica.com', 2450.00),

(11, 'André Luiz Barbosa', '112.233.445-56', 'Administrador', '2019-02-25', '(83) 99678-3421', 'andre.barbosa@clinica.com', 4500.00),

(12, 'Larissa Vitória Ramos', '223.344.556-67', 'Enfermeira', '2021-10-14', '(83) 98832-7154', 'larissa.ramos@clinica.com', 3900.00),

(13, 'Thiago Nascimento Silva', '334.455.667-78', 'Auxiliar administrativo', '2022-12-01', '(83) 99146-5832', 'thiago.silva@clinica.com', 2750.00),

(14, 'Isabela Monteiro Castro', '445.566.778-89', 'Técnica de enfermagem', '2020-10-19', '(83) 98791-4265', 'isabela.castro@clinica.com', 3300.00),

(15, 'Bruno César Almeida', '556.677.889-90', 'Recepcionista', '2024-01-08', '(83) 99635-2478', 'bruno.almeida@clinica.com', 2300.00);
-- verificando se esta tudo correto na tabela
SELECT * FROM funcionarios;

-- inserindo os dados na tabela entidade -- 
INSERT INTO pagamentos
(id_pagamento, data_pagamento, horario_pagamento, forma_pagamento, valor, situacao, descricao, id_paciente, id_funcionario, data_vencimento)
VALUES
(1, '2026-08-01', '09:15:00', 'Cartão de crédito', 180.00, 'Pago', 'Pagamento de consulta', 1, 1, '2026-09-01' ),

(2, '2026-08-01', '10:20:00', 'Pix', 150.00, 'Pago', 'Pagamento de consulta', 2, 2,'2026-09-01' ),

(3, '2026-08-02', '11:30:00', 'Cartão de débito', 200.00, 'Pago', 'Pagamento de consulta', 3, 3,'2026-09-02' ),

(4, '2026-08-03', '08:45:00', 'Dinheiro', 120.00, 'Pago', 'Pagamento de consulta', 4, 4, '2026-09-03' ),

(5, '2026-08-04', '14:10:00', 'Pix', 220.00, 'Pago', 'Pagamento de consulta especializada', 5, 5, '2026-09-04'),

(6, '2026-08-05', '15:25:00', 'Cartão de crédito', 180.00, 'Pago', 'Pagamento de consulta', 6, 6, '2026-09-05' ),

(7, '2026-08-06', '16:40:00', 'Pix', 160.00, 'Pago', 'Pagamento de consulta', 7, 7, '2026-09-06'),

(8, '2026-08-07', '09:50:00', 'Cartão de débito', 190.00, 'Pago', 'Pagamento de consulta', 8, 8, '2026-09-08' ),

(9, '2026-08-08', '10:15:00', 'Dinheiro', 140.00, 'Pago', 'Pagamento de consulta', 9, 9, '2026-09-09' ),

(10, '2026-08-10', '11:45:00', 'Pix', 170.00, 'Pago', 'Pagamento de consulta', 10, 10, '2026-09-10' ),

(11, '2026-08-11', '13:20:00', 'Cartão de crédito', 210.00, 'Pago', 'Pagamento de consulta especializada', 11, 11, '2026-09-11' ),

(12, '2026-08-12', '14:35:00', 'Pix', 150.00, 'Pago', 'Pagamento de consulta', 12, 12, '2026-09-12'),

(13, '2026-08-13', '15:50:00', 'Cartão de débito', 180.00, 'Pago', 'Pagamento de consulta', 13, 13, '2026-09-13' ),

(14, '2026-08-14', '09:30:00', 'Dinheiro', 130.00, 'Pago', 'Pagamento de consulta', 14, 14, '2026-09-14' ),

(15, '2026-08-15', '10:40:00', 'Pix', 200.00, 'Pago', 'Pagamento de consulta especializada', 15, 15, '2026-09-15' );
-- verificando esta tudo correto na tabela -- 
SELECT * FROM pagamentos;

-- tive que atualizar a tabela depois que eu vi oque precisava fazer no segundo tema --
UPDATE pagamentos SET data_vencimento = '2026-08-01' WHERE id_pagamento = 1;
UPDATE pagamentos SET data_vencimento = '2026-08-01' WHERE id_pagamento = 2;
UPDATE pagamentos SET data_vencimento = '2026-08-02' WHERE id_pagamento = 3;
UPDATE pagamentos SET data_vencimento = '2026-07-28' WHERE id_pagamento = 4;
UPDATE pagamentos SET data_vencimento = '2026-08-03' WHERE id_pagamento = 5;
UPDATE pagamentos SET data_vencimento = '2026-08-06' WHERE id_pagamento = 6;
UPDATE pagamentos SET data_vencimento = '2026-08-06' WHERE id_pagamento = 7;
UPDATE pagamentos SET data_vencimento = '2026-08-04' WHERE id_pagamento = 8;
UPDATE pagamentos SET data_vencimento = '2026-08-01' WHERE id_pagamento = 9;
UPDATE pagamentos SET data_vencimento = '2026-08-09' WHERE id_pagamento = 10;
UPDATE pagamentos SET data_vencimento = '2026-08-01' WHERE id_pagamento = 11;
UPDATE pagamentos SET data_vencimento = '2026-08-13' WHERE id_pagamento = 12;
UPDATE pagamentos SET data_vencimento = '2026-08-15' WHERE id_pagamento = 13;
UPDATE pagamentos SET data_vencimento = '2026-08-17' WHERE id_pagamento = 14;
UPDATE pagamentos SET data_vencimento = '2026-08-16' WHERE id_pagamento = 15;
UPDATE pagamentos SET situacao = 'Erro no pagamento' Where id_pagamento= 6;

-- atualzando os dados da entidade: funcionarios. mudando o numero de telefone e sendo localizado pelo id_funcionario --
UPDATE funcionarios 
SET telefone = '(83) 98710-5798'
WHERE id_funcionario = 3;

-- atualizando os dados da entidade paciente, mudando seu convenio -- 
UPDATE paciente 
SET id_convenio= 15
WHERE id_paciente= 1;

-- mostrando que o pagamento do paciente 6 deu errado --
UPDATE pagamentos 
SET situacao = 'erro no pagamento'
WHERE id_pagamento = 6;

-- mostrando as formas de pagamento que os pacientes utilizaram para fazer seus pagamentos e o quanto isso gerou em cada -- 
SELECT forma_pagamento, SUM(valor) AS total_arrecadado
FROM pagamentos
GROUP BY forma_pagamento;

-- mostrando o ticket medio da clinica --
SELECT AVG(valor) AS valor_medio
FROM pagamentos;

-- mostrando quantos pacientes sao homens e quantas sao mulheres -- 
SELECT genero, COUNT(*) AS quantidade_pacientes
FROM paciente
GROUP BY genero;

-- mostrando qual foi o maior valor gasto e o menor valor gasto --
SELECT MAX(valor) AS maior_pagamento, 
   MIN(valor) AS menor_pagamento
FROM pagamentos;

-- jutando as tabelas das entidades : paciente e convenio. -- 
SELECT
    p.id_paciente,
    p.nome,
    c.nome_convenio
    -- o FROM e INNER JOIN faz juntar as duas tabelas, e o ON diz quais dos atributos vao aparecer juntos --
FROM paciente p
INNER JOIN convenio c
    ON p.id_convenio = c.id_convenio;
    
    -- Consulta os registros de consultas, mostrando a data e o horário, além do nome do paciente, nome do médico e sua especialidade --
SELECT
    rc.id_consulta,
    rc.data_consulta,
    rc.horario,
    p.nome AS paciente,
    m.nome AS medico,
    m.especialidade
FROM registros_consultas rc
INNER JOIN paciente p
    ON rc.id_paciente = p.id_paciente
INNER JOIN medico m
    ON rc.id_medico = m.id_medico;
    
    -- Consulta os pacientes e seus respectivos pagamentos,
-- mostrando a data, o valor e a situação de cada pagamento.
-- O LEFT JOIN permite listar também pacientes que não possuem pagamentos.
SELECT
    p.nome AS paciente,
    pg.id_pagamento,
    pg.data_pagamento,
    pg.valor,
    pg.situacao
FROM paciente p
LEFT JOIN pagamentos pg
    ON p.id_paciente = pg.id_paciente;
    
    -- Consulta os pagamentos realizados e identifica o funcionário
-- responsável pelo registro, mostrando também o cargo do funcionário.
SELECT
    pg.id_pagamento,
    pg.data_pagamento,
    pg.valor,
    pg.situacao,
    f.nome AS funcionario,
    f.cargo
FROM pagamentos pg
INNER JOIN funcionarios f
    ON pg.id_funcionario = f.id_funcionario;
    
    -- Consulta para reunir informações dos pagamentos,
-- pacientes e seus respectivos convênios
SELECT
    pg.id_pagamento,
    pg.id_paciente,
    p.nome AS paciente,
    c.nome_convenio,
    pg.data_vencimento,
    pg.data_pagamento,
    pg.valor,
    pg.forma_pagamento,
    pg.situacao
FROM pagamentos pg
INNER JOIN paciente p
    ON pg.id_paciente = p.id_paciente
LEFT JOIN convenio c
    ON p.id_convenio = c.id_convenio;
