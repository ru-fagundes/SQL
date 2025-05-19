-- Criando agrupamentos com GROUP BY
-- Exemplo 1. Utilize o GROUP BY para criar uma consulta de descobrir o total de clientes por sexo
select * from clientes;

select
	Sexo,
    count(*) as 'Qtd. Cliente'
from clientes
group by Sexo;

-- Exemplo 2. Faça uma consulta à tabela de produtos para retornar o total de produtos pr marca
select * from produtos;

select
	Marca_Produto,
    count(*) as 'Qtde. Produtos'
from produtos
group by Marca_Produto;

-- Exemplo 3. Faça uma consulta à tabela Pedidos e decubra a Receita Total e Custo total por ID_Loja
select * from pedidos;

select
	ID_Loja,
    sum(Receita_Venda) as 'Receita Total',
    sum(Custo_Venda) as 'Custo Total'
from pedidos
group by ID_Loja;
    


















