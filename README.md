# :octocat: Projeto SQL :octocat:
Um compilado de 3 projetos para a construção de modelos conceituais e estruturais de banco de dados usando My SQL.

# 1. Companhia
## 🎯 Objetivo
Personalizar um Banco de Dados com Índices e Procedures.

## 📋 Descrição do Desafio

>- ### Parte 1 – Criando índices em Banco de Dados 
- O que será levado em consideração para criação dos índices? 
- Quais os dados mais acessados 
- Quais os dados mais relevantes no contexto 

  A criação do índice pode ser criada via ALTER TABLE ou CREATE Statement, como segue o exemplo: 
ALTER TABLE customer ADD UNIQUE index_email(email); 
CREATE INDEX index_ativo_hash ON exemplo(ativo) USING HASH; 

#### Perguntas:  
- Qual o departamento com maior número de pessoas? 
- Quais são os departamentos por cidade? 
- Relação de empregados por departamento 

>- ### Parte 2 - Utilização de procedures para manipulação de dados em Banco de Dados 
  Criar uma procedure que possua as instruções de inserção, remoção e atualização de dados no banco de dados. As instruções devem estar dentro de estruturas condicionais (como CASE ou IF).  
  Além das variáveis de recebimento das informações, a procedure deverá possuir uma variável de controle. Essa variável de controle irá determinar a ação a ser executada. Ex: opção 1 – select, 2 – update, 3 – delete. 
  
  
  # 2. E-Commerce 
### 📝 📈 Modelo Conceitual de um Banco de Dados para um E-Commerce
#### Parte I: Este projeto foi um refinamento de um modelo conceitual para a criação um banco de dados, onde os seguintes aspectos foram requeridos:
>- Separação de cliente PF e PJ
>- Inserção de forma de pagamento
>- Inserção de entrega com status e código de rastreamento
>- Implementar a modelagem do projeto conceitual do banco de dados do e-commerce para um modelo lógico.

## 📋 Parte II:
>-  Criação do Script SQL para criação do esquema do banco de dados.
>-  Realizar a persistência de dados para realização de testes.
>-  Crie queries SQL com as cláusulas abaixo:
1. Recuperações simples com SELECT Statement
2. Filtros com WHERE Statement
3. Crie expressões para gerar atributos derivados
4. Defina ordenações dos dados com ORDER BY
5. Condições de filtros aos grupos – HAVING Statement
6. Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados


# 3. Oficina 
## 🎯 Objetivo
Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida.

## 📋 Parte I: Narrativa
>- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
>- Clientes levam veículos à oficina mecânica para serem consertados ou para passarem por revisões periódicas.
>- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
>- A partir da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão-de-obra.
>- O valor de cada peça também irá compor a OSO cliente autoriza a execução dos serviços.
>- A mesma equipe avalia e executa os serviços.
>- Os mecânicos possuem código, nome, endereço e especialidade.
>- Cada OS possui: n°, data de emissão, um valor, status e uma data para conclusão dos trabalhos.

## 📋 Parte II:
  Para este cenário você irá utilizar seu esquema conceitual, criado no desafio do módulo de modelagem de BD com modelo ER, para criar o esquema lógico para o contexto de uma oficina. Neste desafio, você definirá todas as etapas. Desde o esquema até a implementação do banco de dados. Sendo assim, neste projeto você será o protagonista. Tenha os mesmos cuidados, apontados no desafio anterior, ao modelar o esquema utilizando o modelo relacional.
  Após a criação do esquema lógico, realize a criação do Script SQL para criação do esquema do banco de dados. Posteriormente, realize a persistência de dados para realização de testes. Especifique ainda queries mais complexas do que apresentadas durante a explicação do desafio. Sendo assim, crie queries SQL com as cláusulas abaixo:
>- Recuperações simples com SELECT Statement;
>- Filtros com WHERE Statement;
>- Crie expressões para gerar atributos derivados;
>- Defina ordenações dos dados com ORDER BY;
>- Condições de filtros aos grupos – HAVING Statement;
>- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados;

## 📑 Diretrizes
>- Não há um mínimo de queries a serem realizadas;
>- Os tópicos supracitados devem estar presentes nas queries;
>- Elabore perguntas que podem ser respondidas pelas consultas;
>- As cláusulas podem estar presentes em mais de uma query.

## ☑️ Tecnologias:
>- MySQL
>- MySQL Workbench

### 📝👩‍💻 Autor(a):
     Rubia Fagundes
