create database oficina;
use oficina;

-- Tabela Clientes
CREATE TABLE Clientes (
    idCliente INT primary key auto_increment,
    CPF CHAR(11) unique,
    Nome VARCHAR(45),
    Telefone CHAR(9),
    Endereco VARCHAR(45),
    unique key CPF_UNIQUE (CPF)
);
alter table Clientes auto_increment=1;

-- Tabela Veículos
CREATE TABLE Veiculos (
    IdVeiculo INT primary key auto_increment,
    Placa CHAR(7) unique,
    Modelo VARCHAR(45),
    Cor VARCHAR(10),
    Ano INT,
    idCliente INT,
    unique key Placa_UNIQUE (Placa),
    index idCliente_idx (idCliente),
    constraint fk_Veiculos_Clientes foreign key (idCliente)
        references Clientes (idCliente) on delete cascade on update cascade
);
alter table Veiculos auto_increment=1;

-- Tabela Mecânicos
CREATE TABLE Mecanicos (
    idMecanico INT  primary key auto_increment,
    Nome VARCHAR(45),
    CNPJ CHAR(14) UNIQUE,
    Telefone CHAR(9),
    Especialidade VARCHAR(45),
    Endereco VARCHAR(100),
    unique key CNPJ_UNIQUE (CNPJ)
);
alter table Mecanicos auto_increment=1;

-- Tabela Serviços
CREATE TABLE Servicos (
    idServico INT primary key auto_increment,
    Descricao VARCHAR(255),
    Preco FLOAT,
    unique key idServicos_UNIQUE (idServico)
);
alter table Servicos auto_increment=1;

-- Tabela Ordem de Serviço
CREATE TABLE OrdemServico (
    idOS INT primary key auto_increment,
    DataEntrada DATE,
    DataSaida DATE,
    Status ENUM('Em Andamento', 'Concluido', 'Cancelado'),
    IdVeiculo INT,
    IdMecanico INT,
    Valor_total FLOAT,
    index idVeiculo_idx (IdVeiculo),
    index idMecanico_idx (IdMecanico),
    constraint fk_OrdemServico_Veiculos foreign key (IdVeiculo)
        references Veiculos (IdVeiculo) on delete cascade on update cascade,
    constraint fk_OrdemServico_Mecanicos foreign key (IdMecanico)
        references Mecanicos (idMecanico) on delete cascade on update cascade
);

-- Tabela Valor de Serviço
CREATE TABLE ValorDeServico (
    idOS INT,
    idServico INT,
    Quantidade INT,
    Preco FLOAT,
    primary key (idOS, idServico),
    index idServico_idx (idServico),
    constraint fk_ValorDeServico_OrdemServico foreign key (idOS)
        references OrdemServico (idOS) on delete cascade on update cascade,
    constraint fk_ValorDeServico_Servicos foreign key (idServico)
        references Servicos (idServico) on delete cascade on update cascade
);

-- Tabela Peças
CREATE TABLE Pecas (
    idPeca INT  primary key auto_increment,
    Descricao VARCHAR(255),
    Preco FLOAT,
    unique key idPeca_UNIQUE (idPeca)
);
alter table pecas auto_increment=1;

-- Tabela Valor das Peças Usadas
CREATE TABLE ValorDasPecasUsadas (
    idOS INT,
    idPeca INT,
    Quantidade INT,
    Preco FLOAT,
    primary key (idOS, idPeca),
    index idPeca_idx (idPeca),
    constraint fk_ValorDasPecasUsadas_OrdemServico foreign key (idOS)
        references OrdemServico (idOS) on delete cascade on update cascade,
    constraint fk_ValorDasPecasUsadas_Pecas foreign key (idPeca)
        references Pecas (idPeca) on delete cascade on update cascade
);

