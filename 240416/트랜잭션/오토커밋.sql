USE tcl;

-- autocommit 활성화 여부 확인
SHOW VARIABLES LIKE 'autocommit';

-- ON : 활성화 (1)
SET autocommit = 1;
-- OFF : 비활성화 (0)
SET autocommit = 0;

CREATE TABLE person(
	name VARCHAR(255),
    age INT
);

-- autocommit이 활성화되어 있는 상태
-- 데이터 조작을 가할 시 즉시 반영
INSERT INTO person VALUES('홍길동', 30);
INSERT INTO person VALUES('임꺽정', 40);

SELECT * FROM person;

-- 오토커밋 비활성화
SET autocommit =0;

-- 삽입 내용이 현재세션에서만 확인 가능
INSERT INTO person VALUES('전우치', 25);

SELECT * FROM person;

-- 변경내용을 반영 (트랜잭션 제어)
COMMIT; 

-- 이전 커밋 단위부터 작업 단위(트랜잭션)으로 끊어짐 
INSERT INTO person VALUES('둘리', 20);
SELECT * FROM person;
ROLLBACK;
-- ROLLBACK을 하게 되면 둘리 테이블은 사라짐 -> 어차피 DB에 반영되지 않았기 때문
SELECT * FROM person;

-- 이전 커밋으로부터 작업단위가 나누어짐(트랜잭션)
INSERT INTO person VALUES('고길동', 45);
INSERT INTO person VALUES('마이콜', 30);
COMMIT;

-- 오토커밋 재활성화
SET autocommit = 1;
SHOW VARIABLES LIKE 'autocommit';




















