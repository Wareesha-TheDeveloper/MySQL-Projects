CREATE DATABASE Employee_Salaries;
USE Employee_Salaries;

-- Q1: Show all columns and rows in the table --
SELECT * FROM salaries;

-- Q2: Show only the EmployeeName and JobTitle columns --
SELECT EmployeeName, JobTitle FROM salaries;

-- Q3: Show the number of employees in the table --
SELECT EmployeeName FROM Salaries;

-- Q4: Show the number of employees in the table --
SELECT Distinct JobTitle
FROM Salaries;

-- Q5: Show the job title and overtime pay for all employees with overtime pay greater than 50000 --
SELECT JobTitle, OverTimepay
FROM Salaries
WHERE Overtimepay>50000;

-- Q6: Show the average base pay for all employees --
SELECT AVG(Basepay)
FROM Salaries;

-- Q7: Show the top 10 highest paid employees --
SELECT EmployeeName, TotalPay
FROM Salaries
ORDER BY TotalPay DESC
LIMIT 10;

-- Q8: Show the average of BasePay, OvertimePay, and OtherPay for each employee --
SELECT EmployeeName, AVG(BasePay + OvertimePay + OtherPay)
FROM Salaries
GROUP BY EmployeeName;

-- Q9: Show all employees who have the word "Manager" in their job title --
SELECT EmployeeName, JobTitle
FROM Salaries
WHERE JobTitle LIKE "%Manager%";

-- Q10: Show all employees with a job title not equal to "Manager" --
SELECT EmployeeName, JobTitle
FROM Salaries
WHERE JobTitle NOT LIKE "%Manager%";

-- Q11: Show all employees with a total pay between 50,000 and 75,000 --
SELECT EmployeeName, TotalPay
FROM Salaries
WHERE TotalPay BETWEEN 50000 AND 75000;

-- Q12: Show all employees with a base pay less than 50,000 or a total pay greater than 100,000 --
SELECT EmployeeName, BasePay, TotalPay
FROM Salaries
WHERE Basepay<50000 AND TotalPay>100000;

-- Q13: Show all employees with a total pay benefits value between 125,000 and 150,000 and a job title containing the word "Director" --
SELECT EmployeeName, TotalPayBenefits, JobTitle
FROM Salaries
WHERE TotalPayBenefits BETWEEN 125000 AND 150000 AND
JobTitle LIKE "%Director%";
 
-- Q14: Show all employees ordered by their total pay benefits in descending order --
SELECT EmployeeName, TotalPayBenefits
FROM Salaries 
ORDER BY TotalPayBenefits DESC;

-- Q15: Show all job titles with an average base pay of at least 100,000 and order them by the average base pay in descending order --
SELECT JobTitle, AVG(BasePay) AS Basepay
FROM Salaries
WHERE Basepay>=100000
GROUP BY JobTitle
ORDER BY Basepay DESC;

-- Q16: Update the base pay of all employees with the job title containing "Manager" by increasing it by 10% --
UPDATE Salaries
SET BasePay = BasePay * 1.1
WHERE JobTitle LIKE "%Manager%";

-- Q17: Find all employees who have no OvertimePay --
SELECT EmployeeName, OvertimePay
FROM Salaries
WHERE Overtimepay=0;