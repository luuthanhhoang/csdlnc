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