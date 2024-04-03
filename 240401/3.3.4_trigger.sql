-- 행 삭제하기 
SET SQL_SAFE_UPDATES = 0;
-- 에러 1175가 뜬다면 안전모드 해제 필요

-- memberName이 당탕이인 행을 삭제

SELECT * FROM memberTBL;
DELETE FROM memberTBL WHERE memberName  = '당탕이';

-- 삭제되었는지 확인(정상 삭제)
SELECT * FROM memberTBL;


