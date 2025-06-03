create database kulturehire;

use kulturehire;


-- 1. What industries are Gen-Z most interested in pursuing careers in?

SELECT Preferred_Company_Type, COUNT(*) AS Count
FROM kulturehire 
WHERE Country = 'India'
GROUP BY Preferred_Company_Type
ORDER BY Count
limit 5;

-- 2. What are the top factors influencing Gen-Z’s career choices?

SELECT Career_Influence_Factor, COUNT(*) AS Count
FROM kulturehire
WHERE Country = 'India'
GROUP BY Career_Influence_Factor
ORDER BY Count DESC;

-- 3. What is the desired work environment for Gen-Z? 

SELECT Preferred_Work_Environment, COUNT(*) AS Count
FROM kulturehire
WHERE Country = 'India'
GROUP BY Preferred_Work_Environment
ORDER BY Count DESC;

-- 4. How do financial goals, such as salary, impact career aspirations among Gen-Z?

SELECT 
  CASE
    WHEN Min_Salary_3Yrs IN ('5K to 10K', '11k to 15k') THEN 'Survival Focused'
    WHEN Min_Salary_3Yrs IN ('16k to 20k', '21k to 25k') THEN 'Stability Seekers'
    WHEN Min_Salary_3Yrs IN ('26k to 30k', '31k to 40k') THEN 'Progress-Oriented'
    WHEN Min_Salary_3Yrs IN ('41k to 50k','>50k') THEN 'Ambitious Earners'
    ELSE 'Unknown'
  END AS Salary_Category,
  COUNT(*) AS Count
FROM kulturehire
WHERE Country = 'India' AND Min_Salary_3Yrs IS NOT NULL
GROUP BY Salary_Category
ORDER BY Count DESC;

-- 5. What role do personal values and social impact play in career choices for Gen-Z?

Select Work_No_Social_Impact , Count(*) as Count
from kulturehire
Where Country ="India"
Group by Work_No_Social_Impact
Order by Count DESC;