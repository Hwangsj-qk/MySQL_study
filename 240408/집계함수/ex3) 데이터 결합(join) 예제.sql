-- JOIN
-- employees 데이터베이스에서 연습해보세요.
USE employees;

-- employees(first_name, last_name, emp_no), titles(emp_no, title, to_date)
-- dept_emp(dept_no, emp_no, to_date), salaries(emp_no, salary, to_date)
-- departments(dept_no, dept_name)

-- 문제 1: 직원의 이름(first_name, last_name)과 직원의 현재 직책(title)을 조회하세요.
SELECT e.first_name, e.last_name, t.title
from employees e
join titles t on e.emp_no = t.emp_no;

-- 문제 2: 각 부서의 이름(dept_name)과 그 부서에 현재 속해있는 직원 수를 조회하세요.
select d.dept_name as "부서명" , count(*) as "직원수"
from departments d
join dept_emp de on d.dept_no = de.dept_no
GROUP BY d.dept_name;

-- 문제 3: 현재 직원 중 급여가 80000 이상인 직원의 이름(first_name, last_name)과 급여(salary)를 조회하세요.
select e.first_name, e.last_name, s.salary
from employees e
join salaries s on e.emp_no = s.emp_no
where s.salary >= 80000;

-- 문제 4: 'Marketing' 부서에 현재 속해있는 직원의 이름(first_name, last_name)과 부서 이름(dept_name)을 조회하세요.
select e.first_name, e.last_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join departments d on d.dept_no = de.dept_no
where d.dept_name = "Marketing";

-- 문제 5: 각 직원의 이름과 해당 직원이 현재 속한 부서 이름을 조회하세요. (LEFT JOIN 사용)
select e.first_name, e.last_name, d.dept_name
from 
employees e
	LEFT JOIN dept_EMP DE ON E.EMP_NO = DE.EMP_NO
    LEFT JOIN DEPARTMENTS D ON DE.DEPT_NO = D.DEPT_NO
    WHERE
    DE.TO_DATE = '1999-01-01';
    