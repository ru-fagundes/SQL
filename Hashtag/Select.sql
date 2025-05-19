-- Criando as primeiras consultas com SELECT

-- Exemplo 1. Selecionando todas as linhas e colunas da:
-- a) tabela pedidos
select * from pedidos;

-- b) tabela clientes
select * from clientes;

-- Exemplo 2a. Selecionar apenas algumas colunas da tabela clientes
select 
	ID_Cliente, 
	Nome, 
	Data_Nascimento, 
	Email 
    from clientes;
    
-- Exemplo 2b. Selecionar apenas algumas colunas da tabela clientes usando AS
select 
	ID_Cliente as 'ID Cliente', 
	Nome as 'Nome do Cliente', 
	Data_Nascimento as 'Data de Nascimento', 
	Email as 'Email do Cliente' 
    from clientes;
    
-- Exemplo 3. Selecionar apenas as 5 primeiras linhas da tabela de produtos
select * from produtos
limit 5;

-- Exemplo 4. Selecionar todas as linhas da tabela produtos, MAS ...
-- ... ordenando pela coluna Preco_Unit, usando ASC (ascentente) ou DESC (descendente)
select * from produtos
order by Preco_Unit asc;