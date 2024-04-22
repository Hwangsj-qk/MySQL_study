-- 1. 인덱스 생성 전 `employees` 테이블에 `first_name`과  `last_name`  컬럼을 조건으로 하는 쿼리문을 실행하세요.
SELECT * FROM employees WHERE first_name = 'Berni' AND last_name = 'Genin';

-- 2.`EXPLAIN`과 Execution Plan을 사용하여 `first_name`과  `last_name`을 조건으로 하는 SELECT 쿼리의 실행 계획을 확인하세요.
EXPLAIN SELECT * FROM employees WHERE first_name = 'Berni' AND last_name = 'Genin';

-- `employees` 테이블에 `first_name`과  `last_name` 컬럼에 대한 복합 인덱스를 생성하세요.
CREATE INDEX idx_employees_first_last_name ON employees (first_name, last_name);

-- 4. 인덱스 생성 전후의 쿼리문의 실행 시간을 비교하세요.
SELECT * FROM employees WHERE first_name = 'Berni' AND last_name = 'Genin';

-- 5. `employees` 테이블의 모든 인덱스 정보를 조회하세요.
SELECT * FROM employees;