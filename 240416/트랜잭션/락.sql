USE tcl;

-- 테이블 생성
CREATE TABLE lock_demo(
	id INT,
    data VARCHAR(255)
);

-- 테스트 데이터 삽입
INSERT INTO lock_demo VALUES (1, '데이터1'), (2, '데이터2');

-- 트랜잭션 시작
START TRANSACTION;
SELECT * FROM lock_demo;

-- 테스트 데이터의 1번 행의 데이터에 접근 (해당 자원에 락)
UPDATE lock_demo SET data = '수정' WHERE id = 1;

-- 락 해제
COMMIT;



-- 명시적 테이블 락 (READ)
LOCK TABLE lock_demo READ;

-- 락 읽기
SELECT * FROM lock_demo;

-- 락 수정 시도 -> 에러 발생 (수정불가)
UPDATE lock_demo SET data = '공유 락' WHERE id = 1;

-- 락 해제 -> 해제 후에는 수정 가능
UNLOCK TABLES;


-- 명시적 테이블 락 (WRITE)
LOCK TABLE lock_demo WRITE;

-- 락 읽기 시도 => 가능
SELECT * FROM lock_demo;

-- 락 수정 시도 => 가능 
UPDATE lock_demo SET data = '공유 락' WHERE id = 1;

-- 락 해제 
UNLOCK TABLES;


















