-- PRACTICE 1,2,3:
SELECT last_name, job_id, salary AS Sal
FROM employees;

-- SELECT * FROM job_grades; No aready exist table job_greades

SELECT employee_id, last_name, (SALARY*12) as SALARY
FROM employees;

/*
* PRACTICE 4:
* The HR department needs a query to display all unique job codes from the EMPLOYEES table.
*/

SELECT DISTINCT (JOB_ID) FROM EMPLOYEES; 

/*
* PRACTICE 5:
* The HR department has requested a report of all employees and their job IDs. 
Display the last name concatenated with the job ID (separated by a comma and space) 
and name the column Employee and Title.
*/

SELECT (LAST_NAME || ',' || JOB_ID) AS "EMPLOYEE AND TITLE" FROM EMPLOYEES;

/*
*PRACTICE 6:
  The HR departments needs to find high-salary and low-salary employees. 
  Display the last name and salary of employees who earn between $5,000 and $12,000 
  and are in department 20 or 50. Label the columns Employee and Monthly Salary, respectively.
*/

SELECT LAST_NAME EMPLOYEE, SALARY AS "MONTHLY SALARY" FROM EMPLOYEES WHERE SALARY BETWEEN 5000 AND 12000
AND DEPARTMENT_ID IN (20, 50);


/*
PRACTICE 7: Create a report to display the last name, salary, and commission of all employees who earn commissions. 
Sort data in descending order of salary and commissions.
*/

SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL 
ORDER BY SALARY, COMMISSION_PCT DESC; 

/*
PRACTICE 8: 
Display the last name of all employees who have both an a and an e in their last name.
*/

SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%a%e%' OR LAST_NAME LIKE '%e%a%';

/*
PRACTICE 9: Display the last name, job, and salary for all employees whose job is SA_REP or ST_CLERK and 
whose salary is not equal to $2,500, $3,500, or $7,000.
*/

SELECT LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES
WHERE JOB_ID IN ('SA_REP','ST_CLERK') AND SALARY NOT IN (2500,3500,7000);









