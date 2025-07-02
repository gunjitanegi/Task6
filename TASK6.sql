CREATE DATABASE Queries;
USE Queries;

DROP TABLE Employees;
CREATE TABLE Employees ( 
    id INTEGER PRIMARY KEY, 
    name VARCHAR(100) NOT NULL, 
    salary INTEGER NOT NULL, 
    role VARCHAR(100) NOT NULL 
);

CREATE TABLE Awards( 
    id INTEGER PRIMARY KEY, 
    employee_id INTEGER NOT NULL, 
    award_date DATE NOT NULL 
);

INSERT INTO Employees VALUES (1, 'Augustine Hammond', 10000, 'Developer');
INSERT INTO Employees VALUES (2, 'Perice Mundford', 10000, 'Manager');
INSERT INTO Employees VALUES (3, 'Cassy Delafoy', 30000, 'Developer');
INSERT INTO Employees VALUES (4, 'Garwood Saffen', 40000, 'Manager');
INSERT INTO Employees VALUES (5, 'Faydra Beaves', 50000, 'Developer');

INSERT INTO Awards VALUES(1, 1, '2022-04-01');
INSERT INTO Awards VALUES(2, 3, '2022-05-01');


INDEPENDENT NESTED QUERIES
1)IN
SELECT id, name FROM Employees
WHERE id IN (SELECT employee_id FROM Awards);

2)NOT IN
SELECT id, name FROM Employees
WHERE id NOT IN (SELECT employee_id FROM Awards);

3)ALL
SELECT * FROM Employees
WHERE role = 'Developer' 
AND salary > ALL (
    SELECT salary FROM Employees WHERE role = 'Manager'
);

4)ANY
SELECT * FROM Employees
WHERE role = 'Developer' 
AND salary > ANY (
    SELECT salary FROM Employees WHERE role = 'Manager'
);

CO-RELATED NESTED QUESRIES
SELECT * FROM Employees emp1 
WHERE salary > (
    SELECT AVG(salary) 
    FROM Employees emp2
    WHERE emp1.role = emp2.role
);

