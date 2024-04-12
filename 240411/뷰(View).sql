-- 뷰
USE SCOTT;

SELECT * FROM emp;

-- 뷰 생성
CREATE VIEW view_emp AS
SELECT empno, ename, job, deptno FROM emp;

-- 생성된 뷰는 새로운 가상의 테이블처럼 접근
SELECT * FROM view_emp;

-- 뷰의 삭제
DROP VIEW view_emp;

-- 1. 뷰의 장점: 보안에 도움이 됨, 사용자에게 보여주고 싶은 속성만 보여줄 수 있음
-- 뷰로 조건부 데이터 선택
CREATE VIEW view_emp_30 AS
SELECT * FROM emp WHERE deptno = 30;

-- 일반 테이블처럼 조회하여 사용할 수 있음.
SELECT * FROM view_emp_30;
SELECT ename FROM view_emp_30;

-- 2. 복잡한 쿼리를 단순화 시켜줄 수 있음
SELECT * FROM emp;
SELECT * FROM dept;

-- 사원 이름과 부서 이름의 가상 테이블(View) 생성
CREATE VIEW emp_dept_view AS
SELECT e.ename as employee_name, d.dname AS department_name
FROM emp e
INNER JOIN dept d ON e.deptno = d.deptno;

-- 2개 이상의 테이블이 조인된 복잡한 쿼리도 결과셋을 뷰로 단순화시킬 수 있음.
-- 쿼리 결과 셋의 컬럼의 별칭은 뷰의 컬럼의 컬럼명이 된다. 
SELECT employee_name, department_name FROM emp_dept_view;

 -- 뷰 실습
use sqldb;
select * from usertbl;
select * from buytbl;

-- 뷰 생성시 열의 정보를 내장함수로 조작할 수 있고, 컬럼명도 별칭으로 변경할 수 있음.
CREATE VIEW view_userbuytbl AS
    SELECT 
        u.userid AS `User Id`,
        u.name AS `User Name`,
        b.prodName AS `Product Name`,
        u.addr AS `User Address`,
        CONCAT(u.mobile1, u.mobile2) AS `Mobile Phone`
    FROM
        usertbl u
            INNER JOIN
        buytbl b ON u.userid = b.userid;
        
-- 뷰를 테이블처럼 사용 가능
SELECT * FROM view_userbuytbl;
SELECT `User Id`, `User Name` FROM view_userbuytbl;   