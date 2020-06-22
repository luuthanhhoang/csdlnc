/*
PRACTICE 1:
Write a query that displays the last name (with the first letter uppercase and all other letters lowercase) 
and the length of the last name for all employees whose name starts with the letters J, A, or M. 
Give each column an appropriate label. Sort the results by the employees’ last names.
*/

SELECT INITCAP(LAST_NAME), LENGTH(LAST_NAME) FROM EMPLOYEES
WHERE SUBSTR(LAST_NAME,1,1) IN ('J', 'A', 'M') 
ORDER BY LAST_NAME ASC; 

/*
2. The HR department wants to find the length of employment for each employee. 
For each employee, display the last name and calculate the number of months between today and the date 
on which the employee was hired. Label the column MONTHS_WORKED. Order your results by the number 
of months employed. Round the number of months up to the closest whole number.
*/

SELECT LAST_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) AS MONTHS_WORKED FROM EMPLOYEES
ORDER BY MONTHS_WORKED ASC;

/*
3. Display each employee’s last name, hire date, and salary review date, 
which is the first Monday after six months of service. Label the column REVIEW. 
Format the dates to appear in the format similar to “Monday, the Thirty-First of July, 2000.”
*/

SELECT LAST_NAME, HIRE_DATE, TO_CHAR(NEXT_DAY(TRUNC(ADD_MONTHS(HIRE_DATE, 6), 'MONTH'), 'MONDAY'), 
'DAY," the" ddspth "of" MONTH YYYY') AS REVIEW FROM EMPLOYEES;

/*
4. Create a query that displays the employees’ last names and commission amounts. 
If an employee does not earn commission, show “No Commission.” Label the column COMM.
*/

SELECT LAST_NAME, NVL2(COMMISSION_PCT, TO_CHAR(COMMISSION_PCT, 9.99), 'No Commission') AS COMM FROM EMPLOYEES;

/*
5.Using the DECODE function, write a query that displays the grade of all employees
based on the value of the column JOB_ID, using the following data:
Job Grade
AD_PRES            A
ST_MAN             B
IT_PROG             C
SA_REP               D
ST_CLERK E
None of the above 0
*/

SELECT LAST_NAME,
DECODE(JOB_ID, 'AD_PRES', 'A', 
                'ST_MAN', 'B', 
                'IT_PROG', 'C', 
                'SA_REP', 'D', 
                'ST_CLERK', 'E' , 
                0) AS GRADE
FROM EMPLOYEES;

/*
Rewrite the query so that the user is prompted to enter a letter that starts the last name. 
For example, if the user enters H when prompted for a letter, then the output should show all 
employees whose last name starts with the letter H.
*/

SELECT LAST_NAME FROM EMPLOYEES WHERE LOWER(LAST_NAME) LIKE 'h%';

--PRACTICE PART 2
/*
1. Find the highest, lowest, sum, and average salary of all employees. 
Label the columns Maximum, Minimum, Sum, and Average, respectively. 
Round your results to the nearest whole number.
*/

SELECT MAX(salary) MAXIMUM, MIN(SALARY) MINIMUM, SUM(salary)SUM , ROUND(AVG(SALARY)) AVERAGE FROM EMPLOYEES;

/*
2. Modify the query in Exercise 1 to display the minimum, maximum, sum, and average salary for each job type.
*/
SELECT JOB_ID, MAX(salary) MAXIMUM, MIN(SALARY) MINIMUM, SUM(salary)SUM , ROUND(AVG(SALARY)) AVERAGE 
FROM EMPLOYEES GROUP BY JOB_ID;

/*
3. Determine the number of managers without listing them. Label the column Number of Managers. 
Hint: Use the MANAGER_ID column to determine the number of managers.
*/

SELECT COUNT(DISTINCT MANAGER_ID) AS "NUMBER OF MANAGERS" FROM EMPLOYEES;

/*
4. Create a report to display the manager number and the salary of the lowest-paid employee for that manager. 
Exclude anyone whose manager is not known. Exclude any groups where the minimum salary is $6,000 or less. 
Sort the output in descending order of salary.
*/

SELECT MANAGER_ID, MIN(SALARY) FROM EMPLOYEES
GROUP BY MANAGER_ID HAVING MIN(SALARY) > 6000 AND MANAGER_ID IS NOT NULL
ORDER BY MIN(SALARY) DESC;








