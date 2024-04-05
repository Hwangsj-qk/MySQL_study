USE scott;

-- scott 데이터베이스 탐색
SHOW TABLES;
DESC EMP;		-- 직원 정보 저장 테이블
-- 사원번호, 이름, 직업, 매니저, 고용일, 급여, 커미션, 부서번호

DESC DEPT;		-- 부서 정보 테이블
-- 부서번호, 부서이름, 위치

DESC SALGRADE;		-- 급여 등급 테이블
-- 급여 등급, 최소급여, 최대급여

-- 전체 데이터 확인하기
SELECT * FROM EMP;

-- 프로젝션 애트리뷰트 : 속성 투영
-- 이름만 확인
SELECT ENAME FROM EMP;

-- 셀렉션 컨디션(조건식) : 조건 선택
-- 급여가 1000달러 이상인 직원만 선택
SELECT * FROM EMP WHERE SAL > 1000;

-- 셀렉션(복합조건) + 프로젝션 
-- 급여가 1000달러 이상이고, 부서번화 10번인 직원의 이름만 조회 
SELECT ENAME FROM EMP WHERE SAL > 1000 AND DEPTNO = 10;

-- 별칭 (AS) 사용하기 
-- 1. 컬럼명에 별칭을 지정하면 쿼리 결과의 헤더로 사용 
SELECT ENAME AS "직원명" FROM EMP;
SELECT ENAME AS "직원명", SAL AS "급여" FROM EMP;
-- AS는 생략가능 
SELECT ENAME "직원명", SAL "급여" FROM EMP;

-- 2-1. 테이블에 별칭 사용하지 않고 JOIN문 사용
SELECT EMP.ENAME, EMP.SAL, DEPT.DEPTNO, DEPT.LOC		
FROM EMP
JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;
-- 테이블이 길어지면 코딩도 길어짐 -> 별칭 사용 

-- 2-2. 테이블에 별칭 사용하기
-- 쿼리 문을 간결하게 하기 위해 사용, 주로 JOIN 문에 사용
SELECT E.ENAME, E.SAL, D.DEPTNO, D.LOC
FROM EMP AS E
JOIN DEPT AS D ON E.DEPTNO = D.DEPTNO;

-- 2-3. AS 생략 가능
SELECT E.ENAME, E.SAL, D.DEPTNO, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO;

-- WHERE절 : 조건식
-- NOT (부정)
-- 부서가 10번이 아닌 직원 찾기
SELECT ENAME DEPT FROM EMP WHERE NOT DEPTNO = 10;

-- IS NOT NULL 비교연산자 : NULL이 아닌 값인 행 선택
SELECT * FROM EMP WHERE SAL IS NOT NULL;

-- BETWEEN .. AND : 특정 범위 내 값 찾기
-- WHERE 컬럼명 BETWEEN 값1 AND 값2; : 범위의 시작값(값1)과 범위의 끝값(값2)까지 조회
-- 단, 두 값 모두 포함 
-- 1) 날짜 범위 
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE BETWEEN '1980-01-01' AND '1982-12-31';

-- 2) 숫자 범위
SELECT ENAME, SAL
FROM EMP
WHERE HIREDATE BETWEEN 1500 AND 3000;

-- 3) 문자열 범위
SELECT ENAME
FROM EMP
WHERE ENAME BETWEEN 'A' AND 'D';

-- IN() : 주어진 목록 안에 값들 중 하나와 일치하는 행 
-- OR 조건 여러개 대체될 수 있음.
-- WHERE 컬럼명 IN (값1, 값2, ...)

-- 1) IN() 연산자를 사용하지 않을 경우
SELECT ENAME, JOB FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'ANALYST';

-- 2) IN() 연산자를 사용할 경우
SELECT ENAME, JOB
FROM EMP
WHERE JOB IN ('MANAGER', 'ANALYST', 'CLERK');
-- 여러 조건을 추가하는데 용이하다. 
-- 쿼리문을 간결하게 만들고, 동적으로 여러조건을 포함해야 할 때 

-- LIKE 
-- 문자열 패털 매칭을 하기 위해 사용 
-- 와일드 카드
-- '%' : 0개 이상의 어느 위치에나 일치하는 문자를 대신
-- '_' : 정확히 일치하는 '한 문자'를 대신 

-- 이름이 A로 '시작'하는 모든 직원 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE 'A%';

-- 이름에 A를 '포함'하는 모든 직원 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE '%A%';

-- 이름의 '3번째 글자'에 A인 사람을 조회
SELECT ENAME FROM EMP
WHERE ENAME LIKE '__A%';



















