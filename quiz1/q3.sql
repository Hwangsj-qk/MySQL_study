DELIMITER $$
CREATE PROCEDURE GetEmployeeSalariesByYear (IN emp_no INT, IN year(from_date) INT, OUT salary INT, OUT from_date DATE)
BEGIN
	INSERT INTO salaries VALUES (emp_no, year);
    SELECT salary, from_date FROM salaries;
END $$
DELIMITER ;

CALL  GetEmployeeSalariesByYear(10001, 2000);   

