--TAO CAC BAN SAO CUA CAC BANG CAN DANH INDEX DE SO SANH KHI TRUY VAN
CREATE TABLE TAKES_INDEX AS SELECT * FROM TAKES;
CREATE TABLE STUDENT_INDEX AS SELECT * FROM STUDENT;
CREATE TABLE ADVISOR_INDEX AS SELECT * FROM ADVISOR;

--DANH CHI MUC CHO CAC BANG TAKES, STUDENT, ADVISOR
CREATE INDEX IDX_TAKES ON TAKES(GRADE);
CREATE INDEX IDX_STUDENT ON STUDENT(NAME);
CREATE INDEX IDX_ADVISOR ON ADVISOR(I_ID);
