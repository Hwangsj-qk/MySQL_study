-- 그룹화 연습문제 (scott 스키마)
USE SCOTT;
SELECT * FROM EMP;

-- 문제 1: EMP 테이블에서 전체 직원 수를 계산하세요.
SELECT COUNT(*) AS "전체 직원 수" FROM EMP;

-- 문제 2: EMP 테이블에서 각 부서(DEPTNO)별 직원 수를 계산하세요.
SELECT DEPTNO, COUNT(*) AS "부서별 직원 수"
FROM emp
GROUP BY DEPTNO;

-- 문제 3: EMP 테이블에서 전체 직원의 평균 급여(SAL)를 계산하세요.
SELECT AVG(SAL) AS "평균 급여" FROM EMP;

-- 문제 4: EMP 테이블에서 각 직무(JOB)별 평균 급여를 계산하되, 평균 급여가 2000 이상인 직무만 포함하세요.
SELECT JOB, AVG(SAL) AS "2000 이상 직무별 평균 급여"
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) >= 2000;

-- 문제 5: EMP 테이블에서 가장 높은 급여와 가장 낮은 급여를 조회하세요.
SELECT MIN(SAL) AS "낮은 급여", MAX(SAL) AS "높은 급여" FROM EMP;

-- 문제 6: EMP 테이블에서 각 부서별로 가장 높은 급여를 받는 직원의 급여를 조회하세요.
SELECT DEPTNO, MAX(SAL) AS "부서별 가장 높은 급여"
FROM EMP
GROUP BY DEPTNO;

-- 문제 7: EMP 테이블에서 각 부서별 총 급여(SAL)를 계산하세요.
SELECT DEPTNO, SUM(SAL) AS "부서별 총 급여"
FROM EMP
GROUP BY DEPTNO;