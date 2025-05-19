-- Funções de agregação COUNT, COUNT(*), COUNT(DISTINCT)
SELECT * FROM clientes;

SELECT
	COUNT(Telefone)
FROM clientes;

SELECT
	COUNT(Nome)
FROM clientes;

SELECT
	COUNT(*)
FROM clientes;

SELECT 
	COUNT(distinct Escolaridade)
FROM clientes;

-- SUM, AVG, MIN, MAX
SELECT
	*
FROM pedidos;

SELECT
	SUM(Receita_Venda) AS 'Soma de Receita',  
    AVG(Receita_Venda) AS 'Média de Receita', 
    MIN(Receita_Venda) AS 'Menor Receita' ,
    MAX(Receita_Venda) AS 'Receita' 
FROM pedidos;


