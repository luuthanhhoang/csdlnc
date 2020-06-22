/* 
1. Vi?t truy v?n ?? hi?n th? thông tin sau cho nh?ng nhân viên có ID ng??i qu?n lý d??i 120:
    - ID ng??i qu?n lý
    - ID công vi?c và t?ng ti?n l??ng cho m?i ID công vi?c cho nhân viên báo cáo cùng
    giám ??c
    - T?ng ti?n l??ng c?a nh?ng ng??i qu?n lý
T?ng ti?n l??ng c?a nh?ng ng??i qu?n lý, không phân bi?t ID công vi?c */

SELECT MANAGER_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES
WHERE MANAGER_ID < 120
GROUP BY ROLLUP(MANAGER_ID, JOB_ID);


/*
2.Quan sát ??u ra t? câu h?i 1. Vi?t truy v?n b?ng hàm GROUPING ?? xác ??nh xem các giá tr? NULL 
trong các c?t t??ng ?ng v?i các bi?u th?c GROUP BY có ph?i do ho?t ??ng ROLLUP gây ra hay không.
*/

SELECT MANAGER_ID, JOB_ID, SUM(SALARY),
GROUPING(MANAGER_ID) MNG, GROUPING(JOB_ID)JOB
FROM EMPLOYEES
WHERE MANAGER_ID < 120
GROUP BY ROLLUP(MANAGER_ID, JOB_ID);

/*
3. Vi?t truy v?n ?? hi?n th? thông tin sau cho nh?ng nhân viên có Manager ID d??i 120:
    - Manager ID
    - JOB và t?ng ti?n l??ng cho m?i công vi?c cho nhân viên báo cáo cho cùng m?t ng??i qu?n lý
    - T?ng ti?n l??ng c?a nh?ng ng??i qu?n lý
    - Các giá tr? l?p b?ng chéo ?? hi?n th? t?ng ti?n l??ng cho m?i công vi?c, không phân bi?t
    giám ??c
T?ng ti?n l??ng không phân bi?t t?t c? các ch?c danh công vi?c
*/

SELECT MANAGER_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES WHERE MANAGER_ID < 120
GROUP BY CUBE(MANAGER_ID, JOB_ID);


/*
4. S? d?ng GROUPING SETS, vi?t truy v?n ?? hi?n th? các nhóm sau:
  - department_id, manager_id, job_id
  - department_id, job_id
  - manager_id, job_id
Truy v?n s? tính t?ng ti?n l??ng cho m?i nhóm này.
*/

SELECT DEPARTMENT_ID, MANAGER_ID, JOB_ID FROM EMPLOYEES
GROUP BY GROUPING SETS((DEPARTMENT_ID, MANAGER_ID, JOB_ID),
(DEPARTMENT_ID,JOB_ID),(MANAGER_ID, JOB_ID));






