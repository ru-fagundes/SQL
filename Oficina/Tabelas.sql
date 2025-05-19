use oficina;

-- Populando a tabela Clientes
INSERT INTO Clientes (CPF, Nome, Telefone, Endereco) VALUES
('12345678901', 'João Silva', '999999999', 'Rua A, 123'),
('23456789012', 'Maria Oliveira', '988888888', 'Rua B, 456'),
('34567890123', 'Pedro Souza', '977777777', 'Rua C, 789'),
('45678901234', 'Ana Santos', '966666666', 'Rua D, 101'),
('56789012345', 'Paula Almeida', '955555555', 'Rua E, 202'),
('67890123456', 'Carlos Pereira', '944444444', 'Rua F, 303'),
('78901234567', 'Mariana Lima', '933333333', 'Rua G, 404'),
('89012345678', 'Rafael Costa', '922222222', 'Rua H, 505'),
('90123456789', 'Fernanda Martins', '911111111', 'Rua I, 606'),
('01234567890', 'Tiago Fernandes', '900000000', 'Rua J, 707');

-- Populando a tabela Veículos
INSERT INTO Veiculos (Placa, Modelo, Cor, Ano, idCliente) VALUES
('ABC1234', 'Fusca', 'Azul', 1980, 1),
('DEF5678', 'Gol', 'Prata', 2010, 2),
('GHI9012', 'Civic', 'Preto', 2015, 3),
('JKL3456', 'Corolla', 'Branco', 2020, 4),
('MNO7890', 'HB20', 'Vermelho', 2018, 5),
('PQR1234', 'Onix', 'Cinza', 2017, 6),
('STU5678', 'Fiesta', 'Verde', 2012, 7),
('VWX9012', 'EcoSport', 'Amarelo', 2019, 8),
('YZA3456', 'Palio', 'Azul', 2011, 9),
('BCD7890', 'Sandero', 'Branco', 2016, 10);

INSERT INTO Veiculos (Placa, Modelo, Cor, Ano, idCliente) values
('ABF5454', 'Fusca', 'Vermelho', 1980, 10),
('DEF9999', 'Voyage', 'Prata', 2018, 5),
('ZYD1234', 'Onix', 'Azul', 2020, 1),
('ZPD5467', 'Gol', 'Branco', 2024, 2);

-- Populando a tabela Mecânicos
INSERT INTO Mecanicos (Nome, CNPJ, Telefone, Especialidade, Endereco) VALUES
('José Silva', '12345678000190', '999999999', 'Motor', 'Rua L, 100'),
('Luiz Souza', '23456789000180', '988888888', 'Transmissão', 'Rua M, 200'),
('Carlos Oliveira', '34567890000170', '977777777', 'Suspensão', 'Rua N, 300'),
('Pedro Santos', '45678901000160', '966666666', 'Freios', 'Rua O, 400'),
('Antonio Almeida', '56789012000150', '955555555', 'Elétrica', 'Rua P, 500'),
('Paulo Pereira', '67890123000140', '944444444', 'Pintura', 'Rua Q, 600'),
('Marcos Lima', '78901234000130', '933333333', 'Lataria', 'Rua R, 700'),
('Jorge Costa', '89012345000120', '922222222', 'Interior', 'Rua S, 800'),
('Roberto Martins', '90123456000110', '911111111', 'Diagnóstico', 'Rua T, 900'),
('Ricardo Fernandes', '01234567000100', '900000000', 'Revisão Geral', 'Rua U, 1000');

-- Populando a tabela Serviços
INSERT INTO Servicos (Descricao, Preco) VALUES
('Troca de óleo', 100.00),
('Alinhamento', 120.00),
('Balanceamento', 80.00),
('Troca de freios', 200.00),
('Revisão completa', 300.00),
('Pintura', 500.00),
('Troca de pneus', 400.00),
('Troca de filtro de ar', 50.00),
('Troca de correia dentada', 250.00),
('Limpeza de bicos injetores', 150.00);

-- Populando a tabela Ordem de Serviço
INSERT INTO OrdemServico (DataEntrada, DataSaida, Status, IdVeiculo, IdMecanico, Valor_total) VALUES
('2023-01-01', '2023-01-03', 'Concluido', 1, 1, 150.00),
('2023-02-01', '2023-02-05', 'Concluido', 2, 2, 320.00),
('2023-03-01', '2023-03-04', 'Em Andamento', 3, 3, 80.00),
('2023-04-01', '2023-04-10', 'Concluido', 4, 4, 200.00),
('2023-05-01', '2023-05-08', 'Concluido', 5, 5, 550.00),
('2023-06-01', '2023-06-02', 'Concluido', 6, 6, 100.00),
('2023-07-01', '2023-07-07', 'Em Andamento', 7, 7, 400.00),
('2023-08-01', '2023-08-03', 'Concluido', 8, 8, 300.00),
('2023-09-01', '2023-09-05', 'Concluido', 9, 9, 150.00),
('2023-10-01', '2023-10-02', 'Em Andamento', 10, 10, 250.00);

-- Populando a tabela Valor de Serviço
INSERT INTO ValorDeServico (idOS, idServico, Quantidade, Preco) VALUES
(1, 1, 1, 100.00),
(2, 2, 2, 240.00),
(3, 3, 1, 80.00),
(4, 4, 1, 200.00),
(5, 5, 1, 300.00),
(6, 6, 1, 500.00),
(7, 7, 1, 400.00),
(8, 8, 1, 50.00),
(9, 9, 1, 250.00),
(10, 10, 1, 150.00);

-- Populando a tabela Peças
INSERT INTO Pecas (Descricao, Preco) VALUES
('Filtro de óleo', 30.00),
('Pastilha de freio', 100.00),
('Pneu', 200.00),
('Correia dentada', 150.00),
('Filtro de ar', 50.00),
('Amortecedor', 300.00),
('Bateria', 250.00),
('Vela de ignição', 20.00),
('Radiador', 400.00),
('Bomba de combustível', 350.00);

-- Populando a tabela Valor das Peças Usadas
INSERT INTO ValorDasPecasUsadas (idOS, idPeca, Quantidade, Preco) VALUES
(1, 1, 1, 30.00),
(2, 2, 2, 200.00),
(3, 3, 4, 800.00),
(4, 4, 1, 150.00),
(5, 5, 1, 50.00),
(6, 6, 2, 600.00),
(7, 7, 1, 250.00),
(8, 8, 4, 80.00),
(9, 9, 1, 400.00),
(10, 10, 1, 350.00);

-- Adicionando mais informações para novos facilitar na hora da recuperação de informações e testes
-- Inserindo mais 20 novas ordens de serviço na tabela OrdemServico
INSERT INTO OrdemServico (DataEntrada, DataSaida, Status, IdVeiculo, IdMecanico, Valor_total) VALUES
('2023-11-01', '2023-11-03', 'Concluido', 1, 1, 350.00),
('2023-11-04', '2023-11-06', 'Em Andamento', 2, 2, 180.00),
('2023-11-07', '2023-11-09', 'Concluido', 3, 3, 220.00),
('2023-11-10', '2023-11-12', 'Concluido', 4, 4, 400.00),
('2023-11-13', '2023-11-15', 'Em Andamento', 5, 5, 260.00),
('2023-11-16', '2023-11-18', 'Concluido', 6, 6, 330.00),
('2023-11-19', '2023-11-21', 'Em Andamento', 7, 7, 290.00),
('2023-11-22', '2023-11-24', 'Concluido', 8, 8, 410.00),
('2023-11-25', '2023-11-27', 'Concluido', 9, 9, 210.00),
('2023-11-28', '2023-11-30', 'Em Andamento', 10, 10, 370.00),
('2023-12-01', '2023-12-03', 'Concluido', 1, 2, 330.00),
('2023-12-04', '2023-12-06', 'Em Andamento', 2, 3, 290.00),
('2023-12-07', '2023-12-09', 'Concluido', 3, 4, 310.00),
('2023-12-10', '2023-12-12', 'Concluido', 4, 5, 410.00),
('2023-12-13', '2023-12-15', 'Em Andamento', 5, 6, 220.00),
('2023-12-16', '2023-12-18', 'Concluido', 6, 7, 320.00),
('2023-12-19', '2023-12-21', 'Em Andamento', 7, 8, 340.00),
('2023-12-22', '2023-12-24', 'Concluido', 8, 9, 400.00),
('2023-12-25', '2023-12-27', 'Concluido', 9, 10, 370.00),
('2023-12-28', '2023-12-30', 'Em Andamento', 10, 1, 290.00);

-- Populando a tabela Valor de Serviço para as novas ordens de serviço
INSERT INTO ValorDeServico (idOS, idServico, Quantidade, Preco) VALUES
(11, 1, 1, 100.00),
(12, 2, 1, 120.00),
(13, 3, 1, 80.00),
(14, 4, 1, 200.00),
(15, 5, 1, 300.00),
(16, 6, 1, 500.00),
(17, 7, 1, 400.00),
(18, 8, 1, 50.00),
(19, 9, 1, 250.00),
(20, 10, 1, 150.00),
(21, 1, 1, 100.00),
(22, 2, 1, 120.00),
(23, 3, 1, 80.00),
(24, 4, 1, 200.00),
(25, 5, 1, 300.00),
(26, 6, 1, 500.00),
(27, 7, 1, 400.00),
(28, 8, 1, 50.00),
(29, 9, 1, 250.00),
(30, 10, 1, 150.00);

-- Populando a tabela Valor das Peças Usadas para as novas ordens de serviço
INSERT INTO ValorDasPecasUsadas (idOS, idPeca, Quantidade, Preco) VALUES
(11, 1, 1, 30.00),
(12, 2, 2, 200.00),
(13, 3, 1, 200.00),
(14, 4, 1, 150.00),
(15, 5, 1, 50.00),
(16, 6, 1, 300.00),
(17, 7, 1, 250.00),
(18, 8, 1, 20.00),
(19, 9, 1, 400.00),
(20, 10, 1, 350.00),
(21, 1, 1, 30.00),
(22, 2, 2, 200.00),
(23, 3, 1, 200.00),
(24, 4, 1, 150.00),
(25, 5, 1, 50.00),
(26, 6, 1, 300.00),
(27, 7, 1, 250.00),
(28, 8, 1, 20.00),
(29, 9, 1, 400.00),
(30, 10, 1, 350.00);
