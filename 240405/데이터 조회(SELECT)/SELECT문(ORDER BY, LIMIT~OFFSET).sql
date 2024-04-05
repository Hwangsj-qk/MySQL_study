-- 정렬 및 결과 제한
USE SCOTT; 
-- ORDER BY

/*
SELECT 컬럼명, ...
FROM 테이블명
ORDER BY 컬럼명1 ASC(or DESC), 컬럼명2 ASC(or DESC), ...
특정 컬럼의 값에 따라 오름차순(ASC) 또는 내림차순(DESC)로 정렬
기본적으로 ASC은 디폴트 값이므로 생략 가능 
*/

-- 1) 급여의 오름차순
SELECT ENAME, SAL FROM EMP
ORDER BY SAL; 		

-- 2) 급여의 내림차순
SELECT ENAME, SAL FROM EMP
ORDER BY SAL DESC;

-- (두개 이상의 열 정렬) 부서순으로 먼저 정렬하고, 부서가 같은 경우 급여순 내림차순 정렬
SELECT ENAME, DEPTNO, SAL FROM EMP
ORDER BY DEPTNO, SAL DESC;		-- ASC는 생략 가능

 
/* LIMIT : 출력하는 결과 개수를 제한
SELECT 컬럼명 ... FROM 테이블명
LIMIT 제한할 행의 개수;
*/

-- 급여가 높은 순으로 1~5위
SELECT ENAME, SAL FROM EMP 
ORDER BY SAL DESC
LIMIT 5; 		-- 개수 제한

-- OFFSET : 몇번째 행부터 데이터를 반환할지를 지정
-- LIMIT와 함께 사용되며, 데이터 페이지네이션(Pagination)
/*
SELECT 컬럼명 ... FROM 테이블명
LIMIT 제한할 행의 개수 OFFSET 시작할 행의 번호;
*/

-- 급여를 많이 받는 6~10위
SELECT ENAME, SAL FROM EMP 
ORDER BY SAL DESC
LIMIT 5 OFFSET 5; 	-- 0행부터 시작하므로 6위부터 시작하기 위해서는 5를 입력
	
-- LIMIT ~ OFFSET은 대규모의 데이터셋에서 필요한 부분만 조회하여
-- 응답시간 및 성능을 최적화하여 사용자 경험을 개선할 수 있음 
-- 페이지네이션을 구현하여 효율적인 데이터 관리에 사용 

-- DISTINCT
-- 중복된 결과를 제거하고, 유일한 고유한 값만 남기기 위하여 사용
-- SELECT DISTINCT 컬럼명 FROM 테이블명;

-- 중복된 부서 제거하고 고유 부서 확인 
SELECT DISTINCT DEPTNO FROM EMP; 

SELECT DISTINCT DEPTNO FROM EMP ORDER BY DEPTNO;

-- 핵심적인 데이터만 보고 싶을 때 데이터 정제,
-- 종류만 확인하고 싶을 때 사용




