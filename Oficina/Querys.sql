use oficina;

-- Visualizar tabelas
select * from clientes;
select * from veiculos;
select * from mecanicos;
select * from servicos;
select * from pecas;
select * from ordemservico;
select * from valorDeServico;
select * from valordaspecasusadas;

-- Modelos de carros que estão em analise
SELECT DISTINCT v.Modelo
FROM Veiculos v
JOIN OrdemServico os ON v.idVeiculo = os.IdVeiculo
WHERE os.Status = 'Em Andamento';


-- Recuperar nome de peças mais usadas nos carros
select p.Descricao, SUM(vpu.Quantidade) AS QuantidadeUsada
from Pecas p
inner join ValorDasPecasUsadas vpu on p.idPeca = vpu.idPeca
group by p.Descricao
order by QuantidadeUsada DESC;



-- Recuperar nome de clientes com ordem de servico "Concluída"
select distinct c.Nome
from Clientes c
inner join Veiculos v on c.idCliente = v.idCliente
inner join OrdemServico os on v.idVeiculo = os.IdVeiculo
where os.Status = 'Concluido';

-- Recuperar top 5 dos clientes que mais gastaram com os carros
select c.Nome, v.Modelo, SUM(os.Valor_total) AS TotalGasto
from Clientes c
inner join Veiculos v on c.idCliente = v.idCliente
inner join OrdemServico os on v.idVeiculo = os.IdVeiculo
group by c.Nome
order by TotalGasto desc
limit 5;

-- Média de gastos dos fuscas na oficina
SELECT AVG(os.Valor_total) AS MediaGastos
FROM Veiculos v
JOIN OrdemServico os ON v.idVeiculo = os.IdVeiculo
WHERE v.Modelo = 'Fusca';


