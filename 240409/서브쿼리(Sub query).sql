-- 서브쿼리
USE scott;

-- 특정 직원 'ALLEN'보다 급여를 많이 받는 직원 찾기 
SELECT ename, sal FROM emp;

-- 서브 쿼리
SELECT ename, sal FROM emp WHERE ename = 'ALLEN';

-- 메인 쿼리 => 비교조건으로 하드코딩 
SELECT ename, sal FROM emp WHERE sal > 1600;


-- 메인 쿼리의 WHERE 절 조건에 서브쿼리를 삽입  : 동적으로 조건이 설정 가능 
SELECT 
    ename, sal
FROM
    emp
WHERE
    sal > (SELECT ename, sal FROM emp WHERE ename = 'ALLEN');
    
-- 단일 행(single row) 서브쿼리     
-- 서브쿼리의 결과가 반드시 하나의 행만 반환해야 함. 

-- 특정 부서(30)의 평균급여보다 높은 급여를 받는 직원 조회
-- 집계함수를 사용하여 결과값이 단일행 -> 서브쿼리로 사용 가능
SELECT avg(sal) FROM emp WHERE deptno = 30;

-- 서브쿼리를 조건으로 받는 메인쿼리 작성
SELECT ename, sal from emp where sal > 1566.6667;

-- 메인 쿼리와 서브 쿼리를 하나의 쿼리를 작성 가능 
SELECT 
    ename, sal
FROM
    emp
WHERE
    sal > (SELECT AVG(sal) FROM emp WHERE deptno = 30);
    
-- IN 함수 : 목록 안에 값이 포함되었는지 확인 
SELECT * FROM emp WHERE deptno IN (10, 20);    




