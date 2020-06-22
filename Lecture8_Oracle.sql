/* 
1. Vi?t truy v?n ?? hi?n th? th�ng tin sau cho nh?ng nh�n vi�n c� ID ng??i qu?n l� d??i 120:
    - ID ng??i qu?n l�
    - ID c�ng vi?c v� t?ng ti?n l??ng cho m?i ID c�ng vi?c cho nh�n vi�n b�o c�o c�ng
    gi�m ??c
    - T?ng ti?n l??ng c?a nh?ng ng??i qu?n l�
T?ng ti?n l??ng c?a nh?ng ng??i qu?n l�, kh�ng ph�n bi?t ID c�ng vi?c */

SELECT MANAGER_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID < 120
GROUP BY ROLLUP(MANAGER_ID, JOB_ID);


/*
2.Quan s�t ??u ra t? c�u h?i 1. Vi?t truy v?n b?ng h�m GROUPING ?? x�c ??nh xem c�c gi� tr? NULL 
trong c�c c?t t??ng ?ng v?i c�c bi?u th?c GROUP BY c� ph?i do ho?t ??ng ROLLUP g�y ra hay kh�ng.
*/

SELECT MANAGER_ID, JOB_ID, SUM(SALARY),
GROUPING(MANAGER_ID) MNG, GROUPING(JOB_ID)JOB
FROM EMPLOYEES
WHERE MANAGER_ID < 120
GROUP BY ROLLUP(MANAGER_ID, JOB_ID);

/*
3. Vi?t truy v?n ?? hi?n th? th�ng tin sau cho nh?ng nh�n vi�n c� Manager ID d??i 120:
    - Manager ID
    - JOB v� t?ng ti?n l??ng cho m?i c�ng vi?c cho nh�n vi�n b�o c�o cho c�ng m?t ng??i qu?n l�
    - T?ng ti?n l??ng c?a nh?ng ng??i qu?n l�
    - C�c gi� tr? l?p b?ng ch�o ?? hi?n th? t?ng ti?n l??ng cho m?i c�ng vi?c, kh�ng ph�n bi?t
    gi�m ??c
T?ng ti?n l??ng kh�ng ph�n bi?t t?t c? c�c ch?c danh c�ng vi?c
*/

SELECT MANAGER_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES WHERE MANAGER_ID < 120
GROUP BY CUBE(MANAGER_ID, JOB_ID);


/*
4. S? d?ng GROUPING SETS, vi?t truy v?n ?? hi?n th? c�c nh�m sau:
  - department_id, manager_id, job_id
  - department_id, job_id
  - manager_id, job_id
Truy v?n s? t�nh t?ng ti?n l??ng cho m?i nh�m n�y.
*/

SELECT DEPARTMENT_ID, MANAGER_ID, JOB_ID FROM EMPLOYEES
GROUP BY GROUPING SETS((DEPARTMENT_ID, MANAGER_ID, JOB_ID),
(DEPARTMENT_ID,JOB_ID),(MANAGER_ID, JOB_ID));






