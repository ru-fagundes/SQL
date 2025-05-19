-- "Personalizando o Banco de Dados com Índices e Procedures"
USE company;
SHOW TABLES;

-- adicionando o campo cidade a tabela 'departament' 
ALTER TABLE departament ADD City VARCHAR(30) DEFAULT 'São Paulo - SP';

-- mesclando algumas cidades
UPDATE departament SET City = 'Rio de janeiro - RJ' WHERE Dnumber = 3 OR Dnumber = 4;
UPDATE departament SET City = 'Belo Horizonte - MG' WHERE Dnumber = 1;

-- Criação de um índice para a otimização da busca por cidades do departamento
CREATE INDEX idx_cidade_do_Departamento ON departament(City) USING BTREE;

-- Query para saber qual departamento possui o maior número de funcionários
SELECT 
    D.Dnumber AS 'Número do Departamento',
    D.Dname AS 'Nome do Departamento',
    COUNT(*) AS 'Quantidade de Funcionários',
    D.City AS 'Cidade'
FROM
    departament D,
    employee E
WHERE
    D.Dnumber = E.Dnumber
GROUP BY D.Dnumber
ORDER BY D.Dnumber ASC;

-- Query para mostrar os departamentos por cidade 
SELECT City, Dname AS 'Department Name' FROM departament ORDER BY City;

-- Query para mostrar a Relação Empregados x Departamento 
SELECT 
    CONCAT(Fname, Minit, Lname) AS 'Nome do Funcionario',
    Dname AS 'Nome do Departamento',
    City AS 'Cidade De Atuação'
FROM
    employee INNER JOIN departament USING (Dnumber)
ORDER BY City;

drop PROCEDURE proc_Manipulacao_Employee;
-- Criando uma procedure para a inserção alteração ou exclusão de um funcionário 
DELIMITER \\
CREATE PROCEDURE proc_Manipulacao_Employee(
 IN procedure_Option INT,
 IN proc_Fname VARCHAR(15),
 IN proc_Minit CHAR(1),
 IN proc_Lname VARCHAR(15),
 IN proc_Ssn CHAR(9),
 IN proc_Bdate DATE,
 IN proc_Address VARCHAR(30),
 IN proc_Sex CHAR(1),
 IN proc_Salary DECIMAL(10,2),
 IN proc_Super_ssn CHAR(9),
 IN proc_Dnumber INT
)
BEGIN
	IF(procedure_Option = 1) THEN
		SELECT * FROM employee ORDER BY Fname ASC;
	ELSEIF(procedure_Option = 2) THEN -- O Update pode é realizado em todas colunas menos no SSN, pois é o código de indentificação do funcionário; 
		UPDATE employee
			SET Fname = proc_Fname,
				Minit = proc_Minit,
				Lname = proc_Lname ,
				Bdate = proc_Bdate,
				Address = proc_Address,
				Sex = proc_Sex ,
				Salary = proc_Salary,
				Super_ssn = proc_Super_ssn,
				Dnumber = proc_Dnumber
			WHERE Ssn = proc_Ssn;
            
	ELSEIF(procedure_Option = 3) THEN
		DELETE FROM employee WHERE Ssn = proc_Ssn;
        
	END IF;
END \\
DELIMITER ;

-- Testando Operações da Procedure

-- Select employee
CALL proc_Manipulacao_Employee(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
-- Update Employee
CALL proc_Manipulacao_Employee(2, 'Maycon', 'B', 'Jordan', '112233445', '2000-02-20', '222 Maple ST Dallas TX', 'M', 80000, '444556666', 5);
-- delete Employee
CALL proc_Manipulacao_Employee(3, NULL, NULL, NULL, 112233445, NULL, NULL, NULL, NULL, NULL, NULL);

/*¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨*/
-- Adição de uma nova constraint à tabela departament, para que possa ocorrer uma exclusão em castata (Só assim podemos excluir um employee)
SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'dept_locations'; -- encontrando chave estrangeira

-- Alterando a restrição de chave estrangeira na tabela dept_locations
ALTER TABLE dept_locations
DROP FOREIGN KEY dept_locations_ibfk_1; -- Removendo a restrição existente

-- Adicionando uma nova restrição de chave estrangeira com ação de exclusão em cascata
ALTER TABLE dept_locations
ADD CONSTRAINT fk_dept_locations FOREIGN KEY (Dnumber) REFERENCES departament(Dnumber) ON DELETE CASCADE;
/*¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨*/