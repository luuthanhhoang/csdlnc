/*
1-The HR department needs a report of all employees. Write a query to display the last name, 
department number, and department name for all employees.
*/

SELECT E.LAST_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME FROM EMPLOYEES E JOIN DEPARTMENTS D 
ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

/*
2.
(A)Create a report to display employees’ last name and employee number along with 
their manager’s last name and manager number. Label the columns Employee, Emp#, Manager, and Mgr#, respectively.
(B)Modify Part A to display all employees including King, who has no manager. Order the results by the employee number.
*/

SELECT E.LAST_NAME, E.EMPLOYEE_ID, M.LAST_NAME, M.EMPLOYEE_ID FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID;

SELECT E.LAST_NAME, E.EMPLOYEE_ID, M.LAST_NAME, M.EMPLOYEE_ID FROM EMPLOYEES E LEFT OUTER JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID;

/*
3. The HR department needs to find the names and hire dates for all employees 
who were hired before their managers, along with their managers’ names and hire dates.
*/

SELECT E.LAST_NAME, E.HIRE_DATE, M.LAST_NAME, M.HIRE_DATE FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGER_ID = M.EMPLOYEE_ID AND E.HIRE_DATE < M.HIRE_DATE;

/*
4. Display the employee number, last name, and salary of all employees who earn more than the average salary and 
who work in a department with any employee whose last name contains a u.
*/

SELECT E.EMPLOYEE_ID, E.LAST_NAME, E.SALARY FROM EMPLOYEES E 
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES) 
AND E.DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%u%');

/*
5. The HR department needs a report with the following specifications:
- Last name and department ID of all the employees from the EMPLOYEES table, 
  regardless of whether or not they belong to a department
- Department ID and department name of all the departments from the DEPARTMENTS table, 
  regardless of whether or not they have employees working in them
Write a compound query to accomplish this .
*/

SELECT LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES 
UNION ALL
SELECT DEPARTMENT_NAME, DEPARTMENT_ID FROM DEPARTMENTS;

/*
6. Create a report that lists the employee IDs and job IDs of those employees 
  who currently have a job title that is the same as their job title when they were 
  initially hired by the company (that is, they changed jobs but have now gone back 
  to doing their original job).
*/

SELECT EMPLOYEE_ID, JOB_ID FROM EMPLOYEES
INTERSECT
SELECT JOB_HISTORY.EMPLOYEE_ID, JOB_HISTORY.JOB_ID FROM JOB_HISTORY;

/*
7. The HR department needs a list of countries that have no departments located in them. 
Display the country ID and the name of the countries. Use set operators to create this report.
*/

SELECT COUNTRY_ID, COUNTRY_NAME FROM COUNTRIES 
WHERE COUNTRY_ID NOT IN (SELECT L.COUNTRY_ID FROM LOCATIONS L JOIN DEPARTMENTS D
ON D.LOCATION_ID = L.LOCATION_ID);









