-- 세션 : 데이터베이스를 사용하는 동안 유지되는 상태 정보 
USE tcl;

-- 세션2 : 계좌 테이블 정보를 확인
SELECT * FROM accounts;

-- 트랜잭션(작업단위가 시작된 상태에서 다른 세션에서 조회를 하면
-- 부분완료된 업데이트 내용(중간처리 과정)은 "확인할 수 없음" 
--   -> Isolatation (고립성)
SELECT * FROM accounts;
SELECT * FROM transaction_log;

-- 세션 1에서 commit을 하는 동시에 "전체 완료된 결과"를 확인할 수 있음. 
--  => 세션1에서 커밋이 완료되면 작업단위 내의 모든 SQL문이 한꺼번에 수행된 것을 확인
--     -> Atomicity(원자성)
-- 변경사항이 영구적으로 반영된 상태(Commited), 시스템 장애가 되어야 유지됨. 
-- -> Durability(지속성)
-- 트랜잭션이 수행된 이후에도 모든 무결설 제약조건 만족 
-- -> Consistency(일관성) 
SELECT * FROM accounts;
SELECT * FROM transaction_log;