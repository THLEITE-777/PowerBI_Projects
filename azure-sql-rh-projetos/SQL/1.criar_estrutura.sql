-- ========================================
-- LIMPEZA (opcional)
-- ========================================

DROP TABLE IF EXISTS dependent;
DROP TABLE IF EXISTS works_on;
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS dept_locations;
DROP TABLE IF EXISTS departament;
DROP TABLE IF EXISTS employee;

-- ========================================
-- TABELA EMPLOYEE
-- ========================================

CREATE TABLE employee (
    Fname VARCHAR(15) NOT NULL,
    Minit CHAR(1),
    Lname VARCHAR(15) NOT NULL,
    Ssn CHAR(9) NOT NULL,
    Bdate DATE,
    Address VARCHAR(30),
    Sex CHAR(1),
    Salary DECIMAL(10,2),
    Super_ssn CHAR(9),
    Dno INT NOT NULL,

    CONSTRAINT PK_Employee
        PRIMARY KEY (Ssn),

    CONSTRAINT CHK_Employee_Salary
        CHECK (Salary > 2000)
);

ALTER TABLE employee
ADD CONSTRAINT FK_Employee_Supervisor
FOREIGN KEY (Super_ssn)
REFERENCES employee(Ssn);

-- ========================================
-- TABELA DEPARTAMENT
-- ========================================

CREATE TABLE departament (
    Dname VARCHAR(15) NOT NULL,
    Dnumber INT NOT NULL,
    Mgr_ssn CHAR(9) NOT NULL,
    Mgr_start_date DATE,
    Dept_create_date DATE,

    CONSTRAINT PK_Departament
        PRIMARY KEY (Dnumber),

    CONSTRAINT UQ_Departament_Name
        UNIQUE (Dname),

    CONSTRAINT CHK_Departament_Dates
        CHECK (Dept_create_date < Mgr_start_date)
);

ALTER TABLE departament
ADD CONSTRAINT FK_Departament_Manager
FOREIGN KEY (Mgr_ssn)
REFERENCES employee(Ssn);

-- ========================================
-- TABELA DEPT_LOCATIONS
-- ========================================

CREATE TABLE dept_locations (
    Dnumber INT NOT NULL,
    Dlocation VARCHAR(15) NOT NULL,

    CONSTRAINT PK_DeptLocations
        PRIMARY KEY (Dnumber, Dlocation),

    CONSTRAINT FK_DeptLocations_Departament
        FOREIGN KEY (Dnumber)
        REFERENCES departament(Dnumber)
);

-- ========================================
-- TABELA PROJECT
-- ========================================

CREATE TABLE project (
    Pname VARCHAR(15) NOT NULL,
    Pnumber INT NOT NULL,
    Plocation VARCHAR(15),
    Dnum INT NOT NULL,

    CONSTRAINT PK_Project
        PRIMARY KEY (Pnumber),

    CONSTRAINT UQ_Project_Name
        UNIQUE (Pname),

    CONSTRAINT FK_Project_Departament
        FOREIGN KEY (Dnum)
        REFERENCES departament(Dnumber)
);

-- ========================================
-- TABELA WORKS_ON
-- ========================================

CREATE TABLE works_on (
    Essn CHAR(9) NOT NULL,
    Pno INT NOT NULL,
    Hours DECIMAL(4,1) NOT NULL,

    CONSTRAINT PK_WorksOn
        PRIMARY KEY (Essn, Pno),

    CONSTRAINT FK_WorksOn_Employee
        FOREIGN KEY (Essn)
        REFERENCES employee(Ssn),

    CONSTRAINT FK_WorksOn_Project
        FOREIGN KEY (Pno)
        REFERENCES project(Pnumber)
);

-- ========================================
-- TABELA DEPENDENT
-- ========================================

CREATE TABLE dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(15) NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(20),

    CONSTRAINT PK_Dependent
        PRIMARY KEY (Essn, Dependent_name),

    CONSTRAINT FK_Dependent_Employee
        FOREIGN KEY (Essn)
        REFERENCES employee(Ssn)
);
