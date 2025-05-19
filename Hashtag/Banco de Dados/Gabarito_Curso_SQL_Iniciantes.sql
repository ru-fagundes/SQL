-- BLOCO 2: PRIMEIROS CÓDIGOS NO SQL

-- Selecionando todas as colunas de uma tabela
select * from produtos;
select * from categorias;
select * from clientes;
select * from locais;

-- Selecionando algumas colunas de uma tabela
select * from clientes;

select 
	Nome as Nome_Cliente, 
    Email, 
    Telefone, 
    Renda_Anual 
from clientes;


select * from produtos;

-- Trabalhar com valores distintos: DISTINCT

select distinct Marca_Produto from produtos;

-- Ordenar as informações de uma tabela: ORDER BY

select * from produtos
order by Preco_Unit asc;

select * from clientes
order by Nome asc, Sobrenome asc;

select * from clientes
order by Data_Nascimento desc;


select 
	* 
from 
	produtos
order by 
	Preco_Unit desc
limit 5;


-- FILTROS: WHERE

select * from clientes
where Qtd_Filhos > 0;

select * from clientes
where Renda_Anual >= 50000
order by Renda_Anual;

select * from clientes
where Escolaridade = 'Parcial';

select * from produtos
where Marca_Produto = 'DELL';


select * from clientes
where Sexo = 'M' and Qtd_Filhos > 0 and Escolaridade = 'Parcial'
order by Qtd_Filhos;

select * from produtos
where Marca_Produto = 'DELL' or Preco_Unit >= 1000;

-- Quero selecionar todos os produtos que são da marca DELL, SAMSUNG ou ALTURA.

select * from produtos
where Marca_Produto = 'DELL' or Marca_Produto = 'SAMSUNG' or Marca_Produto = 'ALTURA';

-- Quero selecionar todos os produtos que são da marca DELL, SAMSUNG ou ALTURA
-- (DE UMA FORMA SIMPLIFICADA)

select * from produtos
where Marca_Produto in ('DELL','SAMSUNG','ALTURA');


select * from produtos
where Preco_Unit >= 1000 and Preco_Unit <= 3000;

select * from produtos
where Preco_Unit between 1000 and 3000;

-- > Para o operador OR podemos usar como alternativa o in
-- > Para o operador AND podemos usar como alternativa o BETWEEN

select * from clientes
where Telefone is null;

-- BLOCO 3: ANÁLISE DE DADOS NO SQL

-- COUNT, SUM, AVG, MIN, MAX

-- COUNT

select * from produtos;

select count(Preco_Unit) from produtos;


select * from clientes;

select count(*) from clientes;


-- SUM
select * from pedidos;

select sum(Receita_Venda) from pedidos;

-- AVG, MIN, MAX

select * from produtos;

select
	avg(Preco_Unit) as Media_Preco,
    min(Preco_Unit) as Menor_Preco,
    max(Preco_Unit) as Maior_Preco
from produtos;

select count(*) from produtos;

select * from produtos;

-- GROUP BY

select
	Marca_Produto,
    count(*)
from produtos
group by Marca_Produto
order by count(*) desc;


select * from clientes;

select
	Escolaridade,
    count(*)
from clientes
group by Escolaridade
having count(*) >= 25;


select * from pedidos;

select * from clientes;


select * from produtos;
select * from categorias;

-- INNER JOIN
-- Exemplo 1: Relacione as tabelas Produtos e Categorias

select * from produtos;
select * from categorias;


select
	Produtos.Nome_Produto,
    Produtos.ID_Categoria,
    Produtos.Marca_Produto,
    Categorias.Categoria
from produtos
inner join categorias
on produtos.ID_Categoria = categorias.ID_Categoria;

-- Exemplo 2: Relacionar as tabelas de Produtos com Pedidos

select * from produtos;
select * from pedidos;

select
	Pedidos.Data_Venda,
    Pedidos.ID_Produto,
    Pedidos.Qtd_Vendida,
    Produtos.Nome_Produto
from Pedidos
inner join Produtos
on Pedidos.ID_Produto = Produtos.ID_Produto;
    
-- Desafio: Total de Receita por Marca de Produto

select * from produtos;
select * from pedidos;

-- 2 coisas: Join, Group by

select
	pr.Marca_Produto,
    sum(pe.Receita_Venda)
from Pedidos pe
inner join Produtos pr
on pe.ID_Produto = pr.ID_Produto
group by pr.Marca_Produto;

-- SUBQUERY
-- Situação: Saber quais são os produtos com preço acima da média

select * from produtos;

-- Etapa 2: Filtrar a tabela de produtos com a média de preços
select 
	*
from produtos
where Preco_Unit >= (select avg(Preco_Unit) from Produtos);


-- Resumo de Total de Receita por Marca
select
	pr.Marca_Produto,
    sum(pe.Receita_Venda)
from Pedidos pe
inner join Produtos pr
on pe.ID_Produto = pr.ID_Produto
group by pr.Marca_Produto;

create view viewClientesM as
select
	*
from clientes
where Sexo = 'M';

select * from viewClientesM;

-- BLOCO 4: CRIAÇÃO DE BANCOS DE DADOS

create database cursosql;
use cursosql;

drop table alunos;

-- CONSTRAINTS
-- NOT NULL
-- UNIQUE
-- CHECK
-- PRIMARY KEY
-- FOREIGN KEY

-- Criar a tabela
create table alunos(
	id_aluno int not null,
    nome varchar(100) not null,
    nota decimal(10, 2) not null,  -- 99999999.99
    curso varchar(100) not null
);

select * from alunos;

-- Inserir dados na tabela
insert into alunos(id_aluno, nome, nota, curso)
values
	(1, 'Ana', 8.5, 'SQL'),
    (2, 'Breno', 7, 'Python'),
    (3, 'Carla', 5, 'Python');

insert into alunos(id_aluno, nome, nota, curso)
values
	(4, 'Diego', 5, 'SQL');
    
    
-- Atualizando valores da tabela
update alunos
set nota = 8
where id_aluno = 4;

-- Excluir dados de uma tabela
delete from alunos
where id_aluno = 2;





















