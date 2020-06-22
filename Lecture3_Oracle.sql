/*
* PRACTICE 1: The staff in the HR department wants to hide some of the data in the EMPLOYEES table.
* They want a view called EMPLOYEES_VU based on the employee numbers, employee names,
* and department numbers from the EMPLOYEES table. They want the heading for the employee name to be EMPLOYEE.
*/
CREATE OR REPLACE VIEW EMPLOYEES_VU
AS
  SELECT EMPLOYEE_ID EMPLOYEE_NUMBER,
    LAST_NAME EMPLOYEE,
    DEPARTMENT_ID
  FROM EMPLOYEES;
  
  
/*
* PRACTICE 2: Confirm that the view works. Display the contents of the EMPLOYEES_VU view.
*/
SELECT *
FROM EMPLOYEES_VU;


/*
* PRACTICE 3: Using your EMPLOYEES_VU view, write a query for the HR department to display all
* employee names and department numbers.
*/
SELECT EMPLOYEE, DEPARTMENT_ID FROM EMPLOYEES_VU;

/*
HomeWork 1:
Department 50 needs access to its employee data. Create a view named DEPT50 that contains 
the employee numbers, employee last names, and department numbers for all employees in department 50. 
You have been asked to label the view columns EMPNO, EMPLOYEE, and DEPTNO. For security purposes, 
do not allow an employee to be reassigned to another department through the view.
* Display the structure and contents of the DEPT50 view.
* Test your view. Attempt to reassign Mohammed to department 80.
*/
CREATE OR REPLACE VIEW DEPT50 AS
SELECT EMPLOYEE_ID EMPNO, LAST_NAME EMPLOYEE, DEPARTMENT_ID DEPTNO FROM EMPLOYEES WHERE DEPARTMENT_ID = 50;

SELECT * FROM DEPT50;

CREATE OR REPLACE VIEW DEPT80 AS
SELECT EMPLOYEE_ID EMPNO, LAST_NAME EMPLOYEE, DEPARTMENT_ID DEPTNO FROM EMPLOYEES WHERE DEPARTMENT_ID = 80;

/*
2. 
* You need a sequence that can be used with the primary key column of the DEPT table. 
The sequence should start at 200 and have a maximum value of 1,000. Have your sequence increment by 10. 
Name the sequence DEPT_ID_SEQ.
* To test your sequence, write a script to insert two rows in the DEPT table. 
Be sure to use the sequence that you created for the ID column. Add two departments: Education and Administration. 
Confirm your additions. Run the commands in your script.
*/
CREATE SEQUENCE DEPT_ID_SEQ 
  INCREMENT BY 10
  START WITH 280
  MAXVALUE 1000
  CYCLE;

INSERT INTO DEPT (ID, NAME) VALUES (DEPT_ID_SEQ.NEXTVAL, 'Education');
INSERT INTO DEPT (ID, NAME) VALUES (DEPT_ID_SEQ.NEXTVAL, 'Administration');

/*
3.
* Create a synonym for your EMPLOYEES table. Call it EMP.
*/

CREATE SYNONYM EMP FOR EMPLOYEES;







