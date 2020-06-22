/*
* PRACTICE 1:
* Create the DEPT table based on the following table instance chart. Place the syntax in a script called lab_09_01.sql,
* then execute the statement in the script to create the table. Confirm that the table is created.
*/
CREATE TABLE DEPT
  (
    id   NUMBER(7) CONSTRAINT dept_department_id PRIMARY KEY,
    name VARCHAR2(25)
  )
/*
* PRACTICE 2:
* Populate the DEPT table with data from the DEPARTMENTS table. Include only columns that you need.
*/
INSERT
INTO DEPT
  (
    id,
    name
  )
SELECT department_id, department_name FROM DEPARTMENTS;
/*
* PRACTICE 3:
* Create the EMP table based on the following table instance chart. Place the syntax in a script called lab_09_03.sql,
* and then execute the statement in the script to create the table. Confirm that the table is created.
*/
CREATE TABLE EMP
  (
    id         NUMBER(7) NOT NULL,
    last_name  VARCHAR2(25),
    first_name VARCHAR2(25),
    dept_id    NUMBER(7),
    CONSTRAINT emp_employee_id PRIMARY KEY (id),
    CONSTRAINT empdept_fk1 FOREIGN KEY (dept_id) REFERENCES dept(id)
  )
/*
* PRACTICE 4: Create the EMPLOYEES2 table based on the structure of the EMPLOYEES table.
* Include only the EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, and DEPARTMENT_ID columns.
* Name the columns in your new table ID, FIRST_NAME, LAST_NAME, SALARY , and DEPT_ID, respectively.
*/
CREATE TABLE EMPLOYEES2 AS
SELECT EMPLOYEE_ID,
  first_name,
  last_name,
  salary,
  department_id AS dept_id
FROM EMPLOYEES;

/* PRACTICE 5: Drop the EMP table */
DROP TABLE emp;


/*
* PRACTICE 6: Create a nonunique index on the DEPT_ID column in the DEPT table.
*/
CREATE INDEX emp_dept_id_idx ON emp
  (
    dept_id
  );
