-- 스키마 생성 및  사용
CREATE SCHEMA IF NOT EXISTS ex_insert;
use ex_insert;

-- 테이블 초기화
DROP TABLE IF EXISTS  employees;
CREATE TABLE employees LIKE employees.employees;

DESC employees;
SELECT * FROM employees;

-- 샘플 데이터 대량 삽입
INSERT INTO employees
		SELECT * FROM employees.employees;
        
-- 안전모드 해제(기본적으로 SQL에서 데이터 변경을 방지하기 위해 안전모드 실행중)
SET SQL_SAFE_UPDATES = 0;

SELECT * FROM employees;
SELECT * FROM employees WHERE first_name = "Georgi";

-- 데이터 삭제하기
-- WHERE 조건에 만족하는 모든 행을 삭제
DELETE FROM employees
WHERE first_name = 'Georgi';

SELECT * FROM employees WHERE first_name = "Bezalel";

-- 테이블 삭제 시 상위 N건만 지우고 싶을 경우 LIMIT 구문과 함께 사용
DELETE FROM employees 
WHERE first_name = "Bezalel" LIMIT 100;

-- 조건 연산자 사용하여 삭제
DELETE FROM employees
	WHERE birth_date >= '1960-01-01';

-- 복한 조건 삭제    
SELECT * FROM employees;
DELETE FROM employees
WHERE first_name = 'Parto' AND last_name = 'Bamford';

-- WHERE 조건문을 생략하고 삭제할 경우
-- 모든 행 삭제 => 주의!		DML : 트렌잭션 로그를 기록
DELETE FROM employees;		-- TRUNCATE 보다 느리게 삭제됨 -> 한 줄씩 삭제되기 때문 

SELECT * FROM employees;	-- 확인용

-- 테이블의 구조는 남기고 모든 데이터를 삭제 (속도와 성능이 무척 빠름)
-- DDL : DML의 트랜잭션 로그 기록 없음 
TRUNCATE TABLE employees;		-- DELETE 보다 빠르게 삭제됨 -> 한꺼번에 삭제하기 때문

-- 테이블 자체를 지우고 싶을 때 (데이터 및 구조 모두 삭제), DDL -> 매우 주의해서 사용하기
DROP TABLE employees;














