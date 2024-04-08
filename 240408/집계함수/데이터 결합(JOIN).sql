-- 조인
USE SCOTT;
-- 각 개별 테이블 확인
SELECT * FROM EMP;		-- 14개의 행
SELECT * FROM DEPT;		-- 4개의 행

-- 2개의 테이블 조회
SELECT * FROM EMP, DEPT;		-- 모든 가능한 행 14*4 = 56의 결과 조회 (카티션 프로덕트)

-- 두 개의 테이블에서 DEPTNO가 같은 경우만 조회 
SELECT * FROM EMP, DEPT		-- 두 개 테이블이 결합됨 
WHERE EMP.DEPTNO = DEPT.DEPTNO;
-- => 암시적 조인

-- 두 개의 테이블을 결합하고, 결과 셋에서 필요한 속성들만 프로젝션(투영)
SELECT ENAME, JOB, SAL, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- 양쪽 테이블 모두에 있는 필드 이름인 경우 테이블명을 명시하지 않으면 오류 발생 (DEPT.DEPTNO)
SELECT ENAME, JOB, SAL, DEPT.DEPTNO, DNAME, LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- 일반적으로 프로젝션하는 모든 필드의 이름에 테이블을 함께 명시
SELECT EMP.ENAME, EMP.JOB, EMP.SAL, DEPT.DEPTNO, DEPT.DNAME, DEPT.LOC
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- 각 필드가 어떤 테이블에 속했는지 명확해졌지만, 너무 길어진다. 
-- 각각의 테이블명에 별칭을 주어 간결화 시킴. (관례적으로 테이블 앞글자를 별칭으로 사용) 
SELECT E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;		-- JOIN 컨디션

-- 명시적 조인
-- JOIN과 ON 키워드를 함께 사용
-- INNER LEFT(테이블1)과 RIGTH(테이블2) 모두 존재 
-- LEFT: 테이블1에는 존재하고, 테이블2에는 존재하지 않는 행을 포함
-- RIGHT: 테이블1에는 존재하지 않고, 테이블2에는 존재하는 행을 포함

-- 1. Inner Join
SELECT *
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;

-- 특정 컬럼만 프로젝션
SELECT ename, dname
FROM emp
INNER JOIN dept ON emp.deptno = dept.deptno;

-- 테이블명 약칭
SELECT e.ename, d.dname
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno;

-- LEFT, RIGHT JOIN

-- 2. LEFT JOIN : 테이블1에 공통컬럼이 없는 경우도 포함하여 테이블2를 조회
-- [임시] deptno가 null인 행을 삽입
INSERT INTO emp
VALUES (9999, 'John', 'Doe', NULL, NULL, NULL, NULL, NULL);

-- INNER LEFT(테이블1)과 RIGHT(테이블2) 모두 존재하는 경우
-- LEFT (테이블1)에는 존재하고, RIGHT (테이블2)에는 존재하지 않는 행을 포함
-- RIGHT 테이블1에는 존재하지 않고, 테이블2에는 존재하는 행을 포함

-- LEFT JOIN : 9999번 행(deptno가 null)은 포함, 40번 부서는 포함하지 않음
SELECT *
FROM emp e
LEFT JOIN dept d ON e.deptno = d.deptno;

-- 3. RIGHT JOIN : 9999번 행(deptno가 null)은 불포함, 40번 부서는 포함
SELECT *
FROM emp e
RIGHT JOIN dept d ON e.deptno = d.deptno;

-- 샘플 행 삭제 (원상복귀)
DELETE FROM emp WHERE empno = 9999;

-- SELF JOIN : 자기 자신 테이블을 참조하여 조인
-- 별칭을 사용해서 동일 테이블을 마치 2개의 테이블인 것처럼
-- 같은 테이블을 2번 참조하여 결합하는 방식
SELECT E1.ENAME AS "직원" , E2.ENAME AS "매니저" 
FROM EMP E1
JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- 비등가 조인
select * from emp;
select * from dept;
select * from salgrade;

-- 두 개의 테이블을 결합할 때 컬럼이 이퀄(=. 등호)가 아닌 비교, 범위 등의 조건으로
-- JOIN Condition으로 결합한 경우
-- 직원 테이블의 급여(sal)가 급여 등급 테이블(salgrade)의 losal, hisal 범위에 있는 경우로 join 
SELECT E.ENAME, E.SAL, S.GRADE
FROM EMP E
JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- 3개 이상의 테이블을 결합하는 경우  (join 여러 개 사용하기) 
select e.ename, d.deptno, d.dname, s.grade
from emp e		-- 기준 테이블 
join dept d on e.deptno = d.deptno
join salgrade s on e.sal BETWEEN s.losal and s.hisal;

-- 그룹화 집계함수와 함께 사용
-- 부서별 급여평균 (부서의 번호 대신 부서명, 평균)
SELECT d.dname as "부서명", round(avg(e.sal)) as "부서별 급여평균"
FROM emp e
join dept d on e.deptno = d.deptno		-- join의 형태가 생략 되어 있다면 무조건 inner join이다. 
GROUP BY dname;

-- USING 키워드와 함께 사용 
-- 두 테이블이 공통적으로 가지고 있는 열을 기준으로 JOIN할 때 사용 
-- 두 테이블에서 열이름이 동일해야 사용 가능 
-- ON D.DEPTNO = E.DEPTNO를 간소화 한 형태
SELECT *
FROM emp e
JOIN dept d USING (DEPTNO);

-- NATURAL JOIN
-- 두 테이블 간의 이름과 데이터 타입이 같은 모든 열을 자동으로 찾아서 해당 열을 기준으로 JOIN 
SELECT *
FROM emp e
NATURAL JOIN dept d ;



 





















