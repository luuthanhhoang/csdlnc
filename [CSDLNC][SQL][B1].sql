-- BAI 1. 
--VIEW DOI DIEM CHU SANG DIEM SO
CREATE VIEW VW_TAKES_NUMBER AS
SELECT ID, COURSE_ID, SEC_ID, SEMESTER, YEAR, 
	CASE grade
		WHEN 'A+' THEN 4.5
		WHEN 'A' THEN 4.0
		WHEN 'A-' THEN 3.5
		WHEN 'B+' THEN 3.0
		WHEN 'B' THEN 2.5
		WHEN 'B-' THEN 2.0
		WHEN 'C+' THEN 1.5
		WHEN 'C' THEN 1.0
		WHEN 'C-' THEN 0.5 
		ELSE 0
	END AS POINT
FROM TAKES
GO

--VIEW LAY RA DIEM CAO NHAT
CREATE VIEW VW_TAKES_MAXPOINT AS 
SELECT ID, COURSE_ID, MAX(POINT) AS POINT 
FROM VW_TAKES_NUMBER GROUP BY ID, COURSE_ID;
GO

--VIEW CHUA TIN CHI TUONG UNG  
CREATE VIEW VW_TAKES_CREDITS AS
SELECT VWM.ID, C.COURSE_ID, VWM.POINT, C.CREDITS 
FROM VW_TAKES_MAXPOINT VWM JOIN COURSE C
ON C.COURSE_ID = VWM.COURSE_ID;
GO

--VIEW CHUA TONG SO TIN CHI
CREATE VIEW VW_TAKES_SUMCREDITS AS 
SELECT ID, SUM(CREDITS) SUMCREDITS FROM VW_TAKES_CREDITS
WHERE POINT > 0.5 GROUP BY ID; 
GO

--TAO THU TUC KIEM TRA DIEU KIEN TOT NGHIEP CUA SINH VIEN
CREATE PROCEDURE SP_CHECK_GRADUATING @STUDENT_ID VARCHAR(1000) AS 
BEGIN
	DECLARE @SUM_CRED INT; 
	DECLARE @CPA FLOAT;
	SELECT @SUM_CRED = SUMCREDITS FROM VW_TAKES_SUMCREDITS WHERE ID = @STUDENT_ID;
	IF @SUM_CRED >=  128  
		BEGIN
			SELECT @CPA = ROUND(SUM(T.POINT*C.CREDITS)/SUM(C.CREDITS),2) 
			FROM VW_TAKES_MAXPOINT T JOIN COURSE C 
			ON T.ID = @STUDENT_ID AND T.COURSE_ID = C.COURSE_ID;
			IF @CPA < 1.0 
			PRINT('Khong du dieu kien tot nghiep. Diem trung binh: ' + CONVERT(VARCHAR,@CPA))
			ELSE 
			PRINT('Du dieu kien tot nghiep. Diem trung binh: ' +  CONVERT(VARCHAR,@CPA))
		END
	ELSE
		BEGIN 
		PRINT('Khong dieu kien tot nghiep. So tin chi: ' +  CONVERT(VARCHAR,@SUM_CRED))
		END
END
GO

EXEC SP_CHECK_GRADUATING 1000





