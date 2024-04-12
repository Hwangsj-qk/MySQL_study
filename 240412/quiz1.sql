 -- 4-1. 회원 정보 추가
 use quiz_db;

INSERT INTO quiz_db.member(Member_name, Member_address, Member_phone)
VALUES('김지수' ,'서울시 강남구 역삼동', '010-1234-5678');

INSERT INTO quiz_db.member(Member_name, Member_address, Member_phone)
VALUES('이태민', '서울시 서초구 반포동', '010-8765-4321');

-- 4-2. 트레이너 정보 추가
INSERT INTO quiz_db.trainer(trainer_name, trainer_speciality)
VALUES('박서준', '필라테스');

INSERT INTO quiz_db.trainer(trainer_name, trainer_speciality)
VALUES('최유리', '에어로빅');

-- 4-3. 클래스 정보 추가
INSERT INTO quiz_db.class(class_name, class_startTime, class_endTime, trainer_id )
VALUES('오전 요가' , '9:00', '10:00', 1);

INSERT INTO quiz_db.class(class_name, class_startTime, class_endTime, trainer_id )
VALUES('저녁웨이트 트레이닝' , '20:00', '21:00', 2);

-- 4-4. 등록 정보 추가
INSERT INTO quiz_db.enrollment(member_id, class_id)
VALUES(1,1);

INSERT INTO quiz_db.enrollment(member_id, class_id)
VALUES(2,2);

-- 5-1. 모든 회원의 이름과 그들이 등록한 강습 클래스의 이름을 조회하세요.
SELECT member_name, class_name FROM enrollment e
JOIN member m on e.member_id = m.member_id
JOIN class c on c.class_id = e.class_id;

-- 5-2. 트레이너별로 담당하는 강습 클래스의 수를 조회하세요
SELECT trainer_name, count(*) FROM trainer GROUP BY trainer_name;

-- 5-3. 현재 등록괸 모든 강습 중 오전에 시작하는 강습들만 조회하세요
SELECT class_name, class_startTime, class_endTime from class
where class_startTime < 12:00:00; 

-- 5-4. 각 회원이 등록한 강습 클래스 중 가장 늦게 시작하는 클래스의 이름과 시작 시간을 조회하세요.


