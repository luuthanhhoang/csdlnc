
CREATE OR REPLACE PROCEDURE SP_REGISTER_COURSE
(
  STUDENT_ID TAKES.ID%TYPE,
  COURSE_ID TAKES.COURSE_ID%TYPE,
  SEC_ID TAKES.SEC_ID%TYPE,
  YEAR TAKES.YEAR%TYPE,
  SEMESTER TAKES.SEMESTER%TYPE
) IS
BEGIN
  INSERT INTO TAKES VALUES(STUDENT_ID, COURSE_ID, SEC_ID, SEMESTER, YEAR, NULL);
  COMMIT;
  dbms_output.put_line('Dang ky thanh cong');
  EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN dbms_output.put_line('Khoa hoc da duoc dang ky');
    ROLLBACK;
END;


/*
CREATE OR REPLACE PROCEDURE SP_REGISTER_COURSE_B9 
(
  STUDENT_ID TAKES.ID%TYPE,
  COURSE_ID TAKES.COURSE_ID%TYPE,
  SEC_ID TAKES.SEC_ID%TYPE,
  YEAR TAKES.YEAR%TYPE,
  SEMESTER TAKES.SEMESTER%TYPE,
  NGAY_HOC VARCHAR
) AS 
RESULT_B9 SYS_REFCURSOR;
ROOM VARCHAR(5);
NHA VARCHAR(50);
ROOM_NUMBER NUMBER;
BEGIN
SAVEPOINT ERR_B9;
OPEN RESULT_B9 FOR SELECT DISTINCT S.BUILDING, S.ROOM_NUMBER, S.TIME_SLOT_ID,
T.START_HR, T.START_MIN, T.END_HR, T.END_MIN
FROM SECTION S JOIN TIME_SLOT T
ON S.TIME_SLOT_ID IN (SELECT TIME_SLOT_ID FROM TIME_SLOT WHERE DAY = NGAY_HOC)
AND S.COURSE_ID = COURSE_ID AND S.SEC_ID = SEC_ID AND S.SEMESTER = SEMESTER
AND S.YEAR = YEAR;

SELECT COUNT(S.ROOM_NUMBER) INTO ROOM_NUMBER FROM SECTION S WHERE 
S. TIME_SLOT_ID IN (SELECT TIME_SLOT_ID FROM TIME_SLOT WHERE DAY = NGAY_HOC)
AND S.COURSE_ID = COURES_ID AND S.SEC_ID = SEC_ID AND S.SEMESTER = SEMESTER 
AND S.YEAR = YEAR;
dbms_sql.return_result(RESULT_B9);

IF ROOM_NUMBER > 0 THEN 
INSERT INTO TAKES (ID, COURSE_ID, SEC_ID, SEMESTER, YEAR)
VALUES (STUDENT_ID, COURSE_ID, SEC_ID, SEMESTER, YEAR);
dbms_output.put_line('Dang ky thanh cong')
ELSE dbms_output.put_line('Khong tim thay lop thoa man')
END IF;
EXCEPTION
WHEN OTHERS THEN ROLLBACK TO ERR_B9;
COMMIT;
END;
*/


