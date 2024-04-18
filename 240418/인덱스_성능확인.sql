DROP SCHEMA IF EXISTS db_index;
CREATE SCHEMA db_index;
USE db_index;

-- 인덱스 성능 확인하기

-- 대량의 샘플 데이터 복사하기
CREATE TABLE emp SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_cl SELECT * FROM employees.employees ORDER BY rand();
CREATE TABLE emp_se SELECT * FROM employees.employees ORDER BY rand();

SELECT * FROM emp LIMIT 5;			-- 인덱스 없는 테이블
SELECT * FROM emp_cl LIMIT 5;		-- 클러스터형 인덱스
SELECT * FROM emp_se LIMIT 5;		-- 보조인덱스

-- 클러스터형 인덱스가 생성되면서 emp_no 기준으로 정렬
ALTER TABLE emp_cl ADD PRIMARY KEY (emp_no);
-- 보조 인덱스 생성
ALTER TABLE emp_se ADD INDEX idx_emp_no(emp_no);

SELECT * FROM emp_cl LIMIT 5;		-- 클러스터형 인덱스 생성 후 정렬됨

-- emp_no 기준 보조 인덱스 생성
ALTER TABLE emp_se ADD INDEX idx_emp_no(emp_no);

SELECT * FROM emp_se LIMIT 5;		-- 보조 인덱스 생성과 별개로 데이터들은 정렬되지 않음.
