CREATE SCHEMA if NOT EXISTS nomarlization;
USE nomarlization;

-- 선박정보를 저장하는 테이블 
-- 함수종속관계: shipname -> shiptype
CREATE TABLE Ship (
	shipname VARCHAR(255) PRIMARY KEY,
    shiptype VARCHAR(255)
);

-- 항해 정보를 저장하는 테이블
-- 함수 종속관계 : voyageID -> shipname, cargo
CREATE TABLE Voyage (
	voyageID INT PRIMARY KEY,
    shipname VARCHAR(255),
    cargo VARCHAR(255),
    -- 공유 컬럼을 외래키로 
    FOREIGN KEY(shipname) REFERENCES ship(shipname)
);

-- 항해 날짜와 항구 정보를 저장하는 테이블 
-- 함수 종속성 : {VoyageID, date} -> port
CREATE TABLE VoyageDetail(
	voyageID INT,
    date DATE,
    port VARCHAR(255),
    PRIMARY KEY(voyageID,  date),
    FOREIGN KEY (VoyageID) REFERENCES Voyage(voyageID)
);

DESCRIBE ship;
DESCRIBE Voyage;
DESCRIBE voyageDetail;    

-- 데이터를 입력할 땐 외래키가 없는 테이블부터 해야 오류가 나지 않음 
INSERT INTO Ship VALUES('한라호', '화물선'), ('백두호', '여객선');
SELECT * FROM ship;

INSERT INTO voyage VALUES(101, '한라호', '화물컨테이너'), (102, '백두호', '고객화물');
SELECT * FROM voyage;

INSERT INTO voyageDetail VALUES (101, '2024-04-15', '부산'), (102, '2024-04-16', '인천');
SELECT * FROM voyageDetail;

-- 쪼개어 둔 테이블 합쳐보기(조인할 땐 외래키 기준으로)
SELECT v.voyageId, v.shipname, s.shiptype, v.cargo, vd.date, vd.port FROM Voyage v 
JOIN voyageDetail vd ON v.voyageID = vd.voyageID
JOIN ship s ON v.shipname = s.shipname;


 
















