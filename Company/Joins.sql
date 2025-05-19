use company;
show tables;
select * from employee;

alter table employee drop column UF;
INSERT INTO employee VALUES
    ('Mark', 'E', 'Taylor', '777888999', '1985-04-30', '234 Elm St Houston TX', 'M', 48000, '333445555', 3),
    ('Sophia', 'M', 'Clark', '222333444', '1994-09-08', '876 Oak St Dallas TX', 'F', 52000, '444556666', 5),
    ('Daniel', 'L', 'Miller', '666777888', '1987-12-15', '543 Pine St Austin TX', 'M', 58000, '111223333', 2),
    ('Olivia', 'N', 'Brown', '333444555', '1990-06-22', '789 Maple St Houston TX', 'F', 65000, '555667788', 4),
    ('Liam', 'K', 'Davis', '888999000', '1983-02-11', '987 Pine St Dallas TX', 'M', 70000, '333445555', 1),
    ('Ava', 'R', 'White', '555444333', '1976-10-05', '345 Elm St Austin TX', 'F', 75000, '444556666', 3),
    ('Caleb', 'S', 'Harris', '112233445', '1992-03-28', '678 Oak St Houston TX', 'M', 60000, '111223333', 5),
    ('Ella', 'F', 'King', '990011122', '1989-07-14', '876 Pine St Dallas TX', 'F', 68000, '555667788', 2),
    ('Jackson', 'G', 'Martin', '665544332', '1981-11-03', '123 Elm St Austin TX', 'M', 72000, '333445555', 4),
    ('Grace', 'H', 'Anderson', '112233245', '1996-05-20', '456 Oak St Houston TX', 'F', 50000, '444556666', 1);

-- utilizando Case Statament para exibir dados da tabela
select concat(Fname,' ',Minit,' ',Lname) as Complete_Name, Sex,
	case 
    when Salary >= 70000 then "Salário Alto" 
    when Salary >= 60000 then "Salário Bom"
    else "Salário Mediano"
    end as Describe_Salary
    from employee;
    
SELECT Dnumber, ROUND(AVG(Salary), 2) AS AvgSalary
	FROM employee
	GROUP BY Dnumber
	HAVING AVG(Salary) > 60000
	ORDER BY Dnumber ASC;
    
    -- Join -> Junção de Tabelas | INNER JOIN e CROSS JOIN |

desc departament;
delete from departament Where Dname = 'Research';
insert into departament values ('Research',1,333444555, null),
						('Human Resources',2,333444555, null),
									 ('TI',3,333444555, null),
							  ('Accountin',4,112233445, null),
								('Support',5,112233445, null);
select * from departament;

-- CROSS JOIN Trás o Produto Cartesiano, ou seja, Multiplica uma tabela pela outra.
SELECT * FROM employee CROSS JOIN departament;
-- Sintaxe Simplificada
SELECT * FROM employee JOIN departament;

-- INNER JOIN Realiza a junção das tabelas porém tras as informações baseadas na clausula ON, que delimita a pesquisa (Msma Função de um Where)
SELECT * FROM employee AS e INNER JOIN departament AS d ON e.Dnumber = d.Dnumber;
-- Sintaxe Simplificada
SELECT * FROM employee e JOIN departament d ON e.Dnumber = d.Dnumber;

-- Usando Join e Where wm uma Query
SELECT CONCAT(e.Fname,' ',e.Minit,' ',e.Lname) as Name_Employee,
	e.Ssn, e.Salary, e.Dnumber, d.Dname
	FROM (employee e JOIN departament d ON e.Dnumber = d.Dnumber)
    WHERE Sex = 'M'; 

-- Trocando o ON do JOIN pelo USING
-- Usando Join e Where em uma Query
SELECT 
    CONCAT(e.Fname, ' ', e.Minit, ' ', e.Lname) AS Name_Employee,
    e.Ssn, e.Salary, e.Dnumber, d.Dname, dept_locations.Dlocation
FROM
    (employee e JOIN departament d USING (Dnumber)) JOIN dept_locations USING(Dnumber)
WHERE
    Sex = 'M';
    
desc dept_locations;

insert into dept_locations values (1,'São Paulo'),
								  (2, 'Rio de Janeiro'),
								  (3, 'Minas Gerais'),
								  (4, 'Espírito Santo'),
								  (5, 'Salvador');
                                  
-- Straight_Join (Obriga o SQL seguir a ordem dos Join's) || Employee -> Departament -> dept_locations   
SELECT STRAIGHT_JOIN
    CONCAT(Fname, ' ', Minit, ' ', Lname) AS Employeer_Name,
    Ssn,
    Manager_ssn,
    Dname,
    employee.Dnumber,
    Dlocation
FROM
    employee
        JOIN
    departament USING (Dnumber)
        JOIN
    dept_locations ON employee.Dnumber = dept_locations.Dnumber
WHERE
    employee.Ssn = departament.Manager_ssn;

desc dependent;
insert into dependent Values ( 777888999, 'David', 'M', '1999-09-19', 'Son'),
						( 333444555, 'Robert', 'M', '1980-10-05', 'Husband'),
							( 777888999, 'Alana', 'F', '1970-04-02', 'Wife'),
					   ( 333444555, 'Sophie', 'F', '2000-02-20', 'Daughter'),
							  ( 112233245, 'Fred', 'M', '2005-05-15', 'Son');
                              
select * from dependent;

-- Left Join ou Outer Join (São a Mesma coisa porém é recomendado deixar o "OUTER" Explicito na sintaxe)
-- Sua função é juntar os valores porém os valores que não tem correspondencia na segunda tabela ainda são exibidos (Diferente Do Inner Join), porém são exibidos como Null 
Select * From employee Left Outer Join dependent on Ssn = Essn; -- Exemplo de Left Join
Select * From dependent Right Outer Join employee on Ssn = Essn;  -- Exemplo de Right Join