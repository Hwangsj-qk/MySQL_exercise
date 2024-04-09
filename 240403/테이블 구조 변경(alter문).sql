-- 테이블 구조 변경
-- ALTER 문 실습

-- 스키마 생성 및 사용
CREATE SCHEMA alter_test;
USE alter_test;

-- 샘플 데이터베이스에서 테이블 구조 복사
CREATE TABLE employees
LIKE employees.employees;

-- 복사한 구조 확인
DESCRIBE employees;
SELECT * FROM employees;

-- 컬럼 추가
ALTER TABLE employees ADD COLUMN phone_number VARCHAR(20);

-- 컬럼 삭제
ALTER TABLE employees DROP COLUMN phone_number;

-- 컬럼명 변경
ALTER TABLE employees CHANGE COLUMN first_name FristName VARCHAR(14);

-- 데이터 타입 변경
ALTER TABLE employees MODIFY COLUMN hire_date DATETIME;

-- 테이블 이름 변경
ALTER TABLE employees RENAME TO employees_backup;
ALTER TABLE employees_backup RENAME TO employees;

-- 제약조건 추가하기
ALTER TABLE employees ADD COLUMN email VARCHAR(255);

-- UNIQUE 제약조건 추가
ALTER TABLE employees ADD UNIQUE (email);

-- 외래키 제약 조건 추가
-- 1. 참조할 테이블  생성
CREATE TABLE departments(
	department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- 2. 외래키로 사용할 필드를 추가
ALTER TABLE em

DESC employees;
