-- 데이터베이스(스키마 생성)
CREATE DATABASE test_db;

-- 데이터베이스 사용
USE test_db;

-- 테이블 생성
CREATE TABLE employees (
	team_id INT NOT NULL,	-- 컬럼에서 제약 조건
    first_name VARCHAR(50),		-- 제약 조건을 주지 않을 경우 기본 null 허용
    last_name VARCHAR(50),
    PRIMARY KEY (employee_id)
    -- primary key는 무조건 not null 이어야 함.
);

-- 테이블(employee)의 정보 확인 
DESCRIBE employees;

-- 복합 기본 키 설정하기
CREATE TABLE player (
    team_id INT NOT NULL,	
    back_number VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),		
    last_name VARCHAR(50),
    PRIMARY KEY (team_id, back_number)
    -- employee_id 와 email 을 조합하여 기본키로 만들 수 있음 (복합키)
    -- 각 컬럼은 중복될 수 있지만, 두 조합으로는 고유한 기본키 생성
);

-- 2개의 컬럼으로 기본키 구성 확인
DESC player; -- discribe와 같은 기능?

CREATE TABLE members(
member_id INT PRIMARY KEY	-- 복합키 속성이 하나일 경우AUTO_INCREMENT
-- 컬럼에서 제약 조건을 지정할 수도 있다. 
-- 기본키는 NOT NULL이어야 하기 때문에 기본키 설정 시 자동으로 NOT NULL
);
DESC members;

-- UNIQUE 제약 조건
-- 동일한 값이 두번 이상 나타나지 않도록 
CREATE TABLE users(
	user_id INT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email VARCHAR(100) UNIQUE  -- email열의 고유 보장, null 허용
);

DESCRIBE users;
SELECT * FROM users;

-- 체크 제약조건
CREATE TABLE adults (
	id INT AUTO_INCREMENT PRIMARY KEY,	-- 속성은 한 번에 여러 개 가능
    name VARCHAR(100) NOT NULL,
    age INT,
    CHECK(age >=19)
    -- age 필드에 값이 들어올 때 19세 이상인지 체크
);

DESCRIBE adults;

SELECT * FROM adults;

-- DEFAULT 제약조건
-- 각 컬럼에 대한 기본 값 지정 
CREATE TABLE persons(
	id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	status VARCHAR(50) DEFAULT '활동중',			-- 상태 열이 기본값으로 '활동중' (직접 입력하면 그 값이 들어가고 비워두면 기본으로 '활동중')
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP	-- 가입일 기본값으로 현재 시간
);

DESCRIBE persons;
SELECT * FROM persons;
-- DROP TABLE persons;

-- AUTO_INCREMENT : 데이터베이스에서 자동으로 값이 증가하는 열 설정
-- 일반적으로 기본키 컬럼에 사용됨. 
CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,		-- 아이디를 입력하지 않아도 1부터 오름차순으로 자동으로 부여됨 
    product_name VARCHAR(255) NOT NULL
);

DESCRIBE products;
SELECT * FROM products;

use test_db;
DROP TABLE employees;
-- 외래 키 - 참조무결성 제약조건
-- 한 테이블의 컬럼이 다른 테이블의 키(기본 키)를 참조 

-- 부서 테이블
CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- 직원 테이블 생성
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    -- 직원 테이블 부서 ID는 부서 테이블의 부서 ID를 참조(외래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- 외래키 컬럼에 참조 위치에 존재하지 않는 값을 넣을 경우 
-- 참조 무결성을 위반하게 되어 실행되지 않는다. (참조 무결성 제약조건)
-- 데이터 관계의 일관성을 보장 (부서에 있어야 직원 테이블에서도 오류없이 실행 가능)
SELECT * FROM employees ;
SELECT * FROM departments ; 

-- 외래 키 레퍼런스 옵션
-- 1. CASECADE
DROP TABLE employees;
DROP TABLE departments;

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- 직원 테이블 생성
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    -- 직원 테이블의 부서 ID는 부서 테이블의 부서 ID를 참조 (외래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
    -- 특정 부서가 삭제될 때 해당 부서직원 정보도 모두 삭제
    ON DELETE CASCADE
);

DESCRIBE employees;
-- CASCADE 적용 확인
SELECT * FROM employees;
SELECT * FROM departments;

-- 2. SET NULL
DROP TABLE employees;
DROP TABLE departments;

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

-- 직원 테이블 생성
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    department_id INT,
    -- 직원 테이블의 부서 ID는 부서 테이블의 부서 ID를 참조 (외래 키 설정)
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
    --  특정 부서가 삭제될 때 해당 부서 직원의 부서 ID가 NULL로 설정됨.
     ON DELETE SET NULL
);

DESCRIBE employees;
-- SET NULL 적용 확인
SELECT * FROM employees;
SELECT * FROM departments;

-- 3. NO ACTION
-- 고객 테이블 생성
CREATE TABLE customers(
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);

-- 고객 테이블을 참조하는 주무 테이블 생성
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    -- 특정 고객 정보를 삭제하려고 하거나, 고객 ID를 변경하려고 할 때
    -- 작업을 거부하게 됨 
    on DELETE NO ACTION
    ON UPDATE NO ACTION
);

DESC customers ;
DESC orders ; 

SELECT * FROM customers ;
SELECT * FROM orders ;



















