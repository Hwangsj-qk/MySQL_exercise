-- 뷰데이블 만들기 (uv : User View)
CREATE VIEW uv_memberTBL
AS
	SELECT memberName, memberAddress FROM memberTBL;
    
select * from uv_memberTBL;