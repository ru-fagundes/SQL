create schema if not exists company;
use company;

-- Criar Tabela
CREATE TABLE company.employee (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR,
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9),
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR,
    Salary DECIMAL(10 , 2 ),
    Super_ssn CHAR(9),
    Dnumber INT NOT NULL,

    CONSTRAINT pk_employee PRIMARY KEY (Ssn)
);

CREATE TABLE departament (
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Manager_ssn CHAR(9),
    Manager_start_date DATE,
    PRIMARY KEY (Dnumber),
    UNIQUE (Dname),
    FOREIGN KEY (Manager_ssn)
        REFERENCES employee (Ssn)
);

CREATE TABLE dept_locations (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,
    PRIMARY KEY (Dnumber , Dlocation),
    FOREIGN KEY (Dnumber)
        REFERENCES departament (Dnumber)
);

CREATE TABLE project (
    Pname VARCHAR(25) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,
    PRIMARY KEY (Pnumber),
    UNIQUE (Pname),
    FOREIGN KEY (Dnum)
        REFERENCES departament (Dnumber)
);

CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pnum INT NOT NULL,
    Hours DECIMAL(3 , 1 ) NOT NULL,
    PRIMARY KEY (Essn , Pnum),
    FOREIGN KEY (Essn)
        REFERENCES employee (Ssn),
    FOREIGN KEY (Pnum)
        REFERENCES project (Pnumber)
);

CREATE TABLE dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR,
    Bdate DATE,
    relationship VARCHAR(8),
    PRIMARY KEY (essn , Dependent_name),
    FOREIGN KEY (Essn)
        REFERENCES employee (Ssn)
);

show tables;
desc departament;

-- Inserindo as informacoes das constraints do Schema do DB
SELECT * FROM information_schema.table_constraints WHERE constraint_schema = 'company';

-- Modificando uma constraint com Drop e ADD
-- 'def', 'company', 'departament_ibfk_1', 'company', 'dependent', 'FOREIGN KEY', 'YES'
ALTER TABLE departament DROP departament_ibfk_1;
ALTER TABLE departament
	ADD CONSTRAINT fk_departament FOREIGN KEY (Manager_ssn) REFERENCES employee (Ssn)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

use company;


-- Alterar tabela -> Schema
alter table employee add UF char(2) default 'SP';
-- Deletar tabela
drop table employee;

-- inserindo dados -> adicionando Linha
insert into employee values ('john','B','Smith','123456789','1965-01-09','731-Fondren-Houston-TX','M',30000,333445555,5);

-- Alterar intancia -> linha
update employee set salary='30000', UF='SP' where concat(Fname,' ',Minit,' ',Lname)='john B Smith';

-- Deletar instancia -> Linha
delete from employee where Fname = 'john';

select * from employee;
desc employee;
