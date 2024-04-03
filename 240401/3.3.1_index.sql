create Table indexTBL (first_name varchar(14), last_name varchar(16), hire_date date);
Insert INTO indexTBL 
	SELECT first_name, last_name, hire_date
    FROM employees.employees
    limit 500;
SELECT * FROM indexTBL;

-- Mary인 사람만 검색
SELECT * FROM indexTBL WHERE first_name = 'Mary';

-- 이름(first_name)열에 인덱스 생성
CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);
-- 인덱스 된 상태에서 Mary 찾기 : 인덱스를통해 얻은 것이 컴퓨터 입장에서는 훨씬 덜 수고스럽게 해낸 결과 
SELECT * FROM indexTBL where first_name = 'Mary';
