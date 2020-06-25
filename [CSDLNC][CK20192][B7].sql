--TAO VIEW CHUA CAC THONG TIN CAN THIET
CREATE OR REPLACE VIEW VW_DATA_B7 AS
SELECT VW.ID, VW.COURSE_ID, VW.POINT, C.CREDITS
FROM VW_TAKES_MAXPOINT VW JOIN COURSE C
ON VW.COURSE_ID = C.COURSE_ID
ORDER BY VW.ID;

--TAO VIEW CHI CHUA NHUNG MON DAT
CREATE OR REPLACE VIEW VW_PASS AS
SELECT * FROM VW_DATA_B7 WHERE POINT > 0.5;

--TAO THU TUC DE KIEM TRA HOC LUC VA TRINH DO SINH VIEN
CREATE OR REPLACE PROCEDURE SP_CHECK_HL_TDSV (STUDENT_ID VARCHAR) AS
  SUM_CREDITS NUMBER;
  CPA NUMBER;
  TCTL NUMBER;
BEGIN
  SELECT SUM(CREDITS), ROUND(SUM(POINT * CREDITS)/SUM(CREDITS),2)
  INTO SUM_CREDITS, CPA FROM VW_DATA_B7 WHERE ID = STUDENT_ID;
  SELECT SUM(CREDITS) INTO TCTL FROM VW_PASS WHERE ID = STUDENT_ID;
  --CHECK CONDITION TCTL
  IF TCTL < 32 THEN dbms_output.put_line('Trinh do nam nhat');
  ELSIF TCTL < 64 THEN dbms_output.put_line('Trinh do nam hai');
  ELSIF TCTL < 96 THEN dbms_output.put_line('Trinh do nam ba');
  ELSIF TCTL < 128 THEN dbms_output.put_line('Trinh do nam bon');
  ELSE dbms_output.put_line('Trinh do nam nam');
  END IF;
  --CHECK CONDITION CPA
  IF CPA < 1 THEN dbms_output.put_line('Hoc luc kem');
  ELSIF CPA < 2.0 THEN dbms_output.put_line('Hoc luc yeu');
  ELSIF CPA < 2.5 THEN dbms_output.put_line('Hoc luc trung binh');
  ELSIF CPA < 3.2 AND CPA >= 2.5 THEN dbms_output.put_line('Hoc luc kha');
  ELSIF CPA < 3.6 AND CPA >= 3.2 THEN dbms_output.put_line('Hoc luc gioi');
  ELSE dbms_output.put_line('Hoc luc xuat sac');
  END IF;
END;