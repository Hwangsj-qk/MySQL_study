-- 집계 함수
USE scott;

SELECT * FROM emp;

-- 집계함수의 결과: 단일행(개수만 나옴)
-- 관심이 있는 attribute에 주로 사용
-- null 값들은 제외하고 요약 값을 추출

-- count : 주어진 조건을 만족하는 행의 개수를 반환
SELECT COUNT(*) FROM emp;			-- 직원 수
SELECT COUNT(ENAME) FROM emp;		-- 직원 이름의 수

-- 행의 값이 NULL인 경우 제외
SELECT COUNT(MGR) FROM emp;			-- 매니저의 수 (매니저가 없는 경우 제외)
SELECT COUNT(COMM) FROM emp;		-- 커미션의 수 (커미션 없는 경우 제외)

-- SUM : "숫자"로 이루어진 열(속성, 어트리뷰트)의 총합을 계산
SELECT SUM(SAL) FROM emp;
SELECT SUM(COMM) FROM emp;		-- 관심있는 열에 NULL 값이 포함될 경우 제외하고 합산

-- AVG : "숫자"로 이루어진 열(속성, 어트리뷰트)의 평균 계산
SELECT AVG(SAL) FROM emp;
SELECT AVG(COMM) FROM emp;		-- 관심있는 열에 NULL 값이 포함될 경우 제외하고 평균 계산 

-- ROUND 함수와 같이 사용하면 소수자리에서 반올림
SELECT ROUND(AVG(SAL)) FROM emp;		-- 0의 자리에서 반올림 
SELECT ROUND(AVG(SAL),2) FROM emp;		-- 소수점 2자리에서 반올림
SELECT ROUND(AVG(SAL),-2) FROM emp;		-- 십의 자리에서 반올림

-- MIN, MAX: 열에서 최소값 최대값을 찾음
SELECT MIN(SAL), MAX(SAL) FROM emp;
SELECT MIN(SAL) AS 최고급여, MAX(SAL) AS 최대급여 FROM emp;

-- MIN, MAX는 숫자 이외의 다양한 데이터 형식에도 사용 가능 (SUM과 AVG와의 차이점)
SELECT MIN(ENAME), MAX(ENAME) FROM EMP;
SELECT MIN(HIREDATE), MAX(HIREDATE) FROM EMP;

-- stddev : 표준편차
SELECT stddev(sal) FROM EMP;

-- var_samp : 분산
SELECT VAR_SAMP(SAL) FROM EMP;

-- GROUP BY : 특정 컬럼의 값에 따라 행들을 그룹화
-- JOB 별로 평균 급여를 계산
SELECT 
    JOB, AVG(SAL)
FROM
    EMP
GROUP BY JOB;

-- 직무별, 부서별로 평균 급여 계산 -> 두가지 기준을 둘 수 있음 
SELECT 
    JOB, DEPTNO, AVG(SAL)
FROM
    EMP
GROUP BY JOB, DEPTNO;

-- GROUP BY 절의 순서
-- WHERE 절 - GROUP BY절  - ORDER BY 절 순서로 위치
-- 부서별로 평균급여의 높은 순으로 조회 
SELECT DEPTNO, AVG(SAL) AS "평균 급여"
FROM EMP
GROUP BY DEPTNO
ORDER BY "평균 급여" DESC;

-- HAVING 절
-- GROUP BY로 인해 생성된 그룹에 조건을 적용할 때 사용 
-- WHERE절과의 차이점
	-- WHERE절 : 테이블의 각 개별행에 대해 조건을 정의
    -- HAVING절: 그룹화된 결과에 대해 조건을 정의

-- 평균 급여가 2000 이상인 부서의 급여 조회    
SELECT DEPTNO, AVG(SAL) AS 평균급여
FROM EMP
-- WHERE SAL > 1500 : 원 테이블의 각 행에 대하여 조건
GROUP BY DEPTNO
HAVING 평균급여 >= 2000;		-- 그룹화된 결과에 대해 조건

-- WHERE, GROUP BY, HAVING 절은 순서가 바뀔 수 없다. 




















