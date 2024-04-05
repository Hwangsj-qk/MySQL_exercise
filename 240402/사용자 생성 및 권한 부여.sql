-- 사용자 역할 및 권한 
-- [Administration] -> [Users and Preivilieges]
-- [Add Account]를 클릭하여 추가 가능

-- 새로운 유저 생성(관리자) 및 비밀번호 설정
	-- @ 뒤의 '%' 모든 호스트를 가리킴
    -- IDENTIFIED BY '1234' : 비밀번호 설정
CREATE USER director@'%' IDENTIFIED BY '1234';

-- 권한 부여: 모든 권한 + 다른 사람에게 권한 부여
	-- GRANT : 권한 부여
    -- ALL : 모든 구너한
    -- to director@'%' : director에게 부여
    -- with GRANT OPTION : 다른 사용자에게도 권한 부여 권한을 가짐
GRANT ALL ON *.* TO director@'%' with GRANT OPTION;

-- 사장님(ceo) 유저 생성: 모든 데이터베이스를 읽는 권한만 부여
CREATE USER ceo@'%' IDENTIFIED BY '1234';
GRANT SELECT ON *.* TO ceo@'%';

-- 일반 직원(staff) 유저 생성: shopdb는 CRUD 건한, employeesdb는 읽기 권한
CREATE USER staff@'%' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE, DELETE ON shopdb.* TO staff@'%';
GRANT SELECT ON employees.* TO staff@'%';    

 