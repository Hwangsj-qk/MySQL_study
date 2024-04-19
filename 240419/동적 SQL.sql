-- 동적 SQL
USE store;

/*
PREPARE 준비문장이름 FROM 문장;		-- 1. 문장 준비
EXECUTE 준비문장이름;				-- 2. 실행
DEALLOCATE PREPARE 준비문장이름;	-- 3. 메모리 해제
*/

-- 준비 문장에서 ? 로 향후 입력될 값을 비워놓고 USING 키워드를 이용하여 값을 전달

-- 1. 변수 선언
SET @userName = '조관우';

-- 2. SQL문 준비
PREPARE myQuery FROM 'SELECT * FROM usertbl WHERE userID = ?';

-- 3. SQL 문 실행
EXECUTE myQuery USING @userName;

-- 4. 준비된 문장 메모리 해제
DEALLOCATE PREPARE myQuery;

-- 1. 변수 선언
SET @userName = '바비킴';
SET @id = 'BBK';
SET @sql = 'select * from usertbl where userid = ? and name = ?';

PREPARE statement FROM @sql;		-- 준비
EXECUTE statement USING @id, @userName;		-- 2개 이상 변수, 순서대로 대입
DEALLOCATE PREPARE statementl;

SELECT * FROM buytbl;
set @tableName = 'buytbl';
SET @columnName = 'price';
SEt @limitPrice = 100;
set @query = concat('select * from', @tableName, 'Where', @columnName, '> ?');

PREPARE stmt FROM @query;
EXECUTE stmt USING @limitPrice;
DEALLOCATE PREPARE statement;
