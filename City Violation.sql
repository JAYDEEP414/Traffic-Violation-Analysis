CREATE DATABASE City_Violation;
USE City_Violation;
SELECT * FROM `city violatin india`;

ALTER TABLE `city violatin india`
MODIFY Violation_ID VARCHAR(20);

ALTER TABLE `city violatin india`
MODIFY Violation_Date DATE;

ALTER TABLE `city violatin india`
MODIFY Violation_Time TIME;

ALTER TABLE `city violatin india`
MODIFY City TEXT;

ALTER TABLE `city violatin india`
MODIFY Area TEXT;

ALTER TABLE `city violatin india`
MODIFY Vehicle_Type TEXT;

#Q1- Total number of traffic violations?
SELECT COUNT(Violation_ID) AS total_violations
FROM `city violatin india`;

#Q2- City-wise total violations
SELECT City, COUNT(*) AS total_violations
FROM `city violatin india`
GROUP BY City
ORDER BY total_violations DESC;

#Q3- Top 5 violation-prone areas (Hotspots)
SELECT City, Area, COUNT(*) AS violations
FROM `city violatin india`
GROUP BY City, Area
ORDER BY violations DESC
LIMIT 5;

#Q4- Peak violation hours
SELECT HOUR(Violation_Time) AS hour, COUNT(*) AS violations
FROM `city violatin india`
GROUP BY hour
ORDER BY violations DESC;

#Q5- Most common violation types
SELECT Violation_Type, COUNT(*) AS total_cases
FROM `city violatin india`
GROUP BY Violation_Type
ORDER BY total_cases DESC;

#Q6- Total revenue generated
SELECT SUM(Fine_Amount) AS total_revenue
FROM `city violatin india`;

#Q7- Paid vs Unpaid revenue
SELECT Payment_Status, SUM(Fine_Amount) AS revenue
FROM `city violatin india`
GROUP BY Payment_Status;

#Q8- Recovery rate percentage
SELECT 
ROUND(
(SUM(CASE WHEN Payment_Status = 'Paid' THEN Fine_Amount ELSE 0 END) /
SUM(Fine_Amount)) * 100, 2
) AS recovery_rate_percent
FROM `city violatin india`;

#Q9- Repeat offenders count
SELECT Repeat_Offender, COUNT(*) AS violations
FROM `city violatin india`
GROUP BY Repeat_Offender;

#Q10- Weather impact on violations
SELECT Weather_Condition, COUNT(*) AS violations
FROM `city violatin india`
GROUP BY Weather_Condition
ORDER BY violations DESC;

#Q11- Average fine per violation type
SELECT Violation_Type, ROUND(AVG(Fine_Amount),2) AS avg_fine
FROM `city violatin india`
GROUP BY Violation_Type;