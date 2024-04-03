-- 테이블 삭제(DROP)
-- DDL (데이터 정의어)의 일부러 DB 객체를 삭제
-- 명령어를 사용하게 되면, 테이블과 테이블에 포함되어 있는 데이터가 영구적으로 삭제
-- 주의해서 사용해야 함. 
-- DROP TABLE 테이블명;

USE alter_test;

DROP TABLE employees;
DROP TABLE departments;

-- 데이터베이스(스키마) 삭제
DROP SCHEMA alter_test; 

-- 여러 테이블 동시 삭제(스키마명.테이블명)
DROP TABLE employees, departments;
DROP TABLE librarymanagement.appointmentid,
			librarymanagement.doctors,
			librarymanagement.patients;
            
DROP DATABASE healthcaremanagement;
-- 다시 복구하고 싶으면 해당 SQL문이 작성된 파일 전체 다시 실행 

            