--TAO VIEW LAY DU LIEU THEO YEU CAU DE BAI

CREATE VIEW VW_DATA AS
SELECT ST.ID, ST.NAME STUDENT_NAME, SE.YEAR, SE.SEMESTER, C.TITLE, TS.DAY, TS.START_HR,
TS.START_MIN, TS.END_HR, TS.END_MIN, SE.ROOM_NUMBER, SE.BUILDING, I.NAME INSTRUCTOR_NAME,
ST.DEPT_NAME
FROM SECTION SE 
JOIN COURSE C ON SE.COURSE_ID = C.COURSE_ID
JOIN TEACHES TE ON SE.COURSE_ID = TE.COURSE_ID
  AND SE.SEC_ID = TE.SEC_ID
  AND SE.SEMESTER = TE.SEMESTER
  AND SE.YEAR = TE.YEAR
JOIN INSTRUCTOR I ON TE.ID = I.ID
JOIN TAKES TA ON SE.SEC_ID = TA.SEC_ID
  AND SE.SEMESTER = TA.SEMESTER
  AND SE.YEAR = TA.YEAR
  AND SE.COURSE_ID = TA.COURSE_ID
JOIN STUDENT ST ON TA.ID = ST.ID
LEFT JOIN TIME_SLOT TS ON SE.TIME_SLOT_ID = TS.TIME_SLOT_ID;
GO

--TAO THU TUC LOC DU LIEU
CREATE PROCEDURE SP_LOC_DU_LIEU (@SEARCH_FIELD_NAME  VARCHAR(50),
@SEARCH_VALUE  VARCHAR(50)) AS
BEGIN
  DECLARE @SEARCH_RESULT NVARCHAR(1000)
  IF(@SEARCH_FIELD_NAME = 'ID') SELECT * FROM VW_DATA 
  WHERE ID = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'STUDENT_NAME') SELECT * FROM VW_DATA 
  WHERE STUDENT_NAME = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'YEAR') SELECT * FROM VW_DATA 
  WHERE YEAR = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'SEMESTER') SELECT * FROM VW_DATA 
  WHERE SEMESTER = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'TITLE') SELECT * FROM VW_DATA 
  WHERE TITLE = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'ROOM_NUMBER') SELECT * FROM VW_DATA 
  WHERE ROOM_NUMBER = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'INSTRUCTOR_NAME') SELECT * FROM VW_DATA 
  WHERE INSTRUCTOR_NAME = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'DEPT_NAME') SELECT * FROM VW_DATA 
  WHERE DEPT_NAME = @SEARCH_VALUE;
  IF(@SEARCH_FIELD_NAME = 'DAY') SELECT * FROM VW_DATA 
  WHERE DAY = @SEARCH_VALUE;
  ELSE PRINT('Nhap sai');
END










