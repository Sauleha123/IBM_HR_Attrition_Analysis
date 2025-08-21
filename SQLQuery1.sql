create database HR_Analytics

use HR_Analytics

-- 1. Overall Attrition Count & Percentage
select Attrition, count(*) as Employee_Count,
count(*) * 100.0 / (select count(*) from Cleaned_IBM_HR) as Percentage
from Cleaned_IBM_HR
group by Attrition
-- Insight: Around 16% of employees have left the company, which is significant and worth further investigation.


-- 2. Attrition by Department
--Purpose: Identify departments with highest attrition.
select Department, Attrition, count(*) as Count
from Cleaned_IBM_HR
group by Department, Attrition
order by Department, Attrition
-- Insights: Sales and R&D departments have the highest attrition numbers
-- Here Yes = 1 and No = 0


-- 3. Average Monthly Income - Left vs Stayed
-- Purpose: Explore income differences between employees who stayed and those who left.
select Attrition, avg(MonthlyIncome) as Avg_Monthly_Income
from Cleaned_IBM_HR
group by Attrition
-- Insights: Employees who left had a ~30% lower average income, suggesting pay could be a factor in attrition.


-- 4. Overtime Impact on Attrition
--Purpose: Check if working overtime affects attrition
select OverTime, Attrition, count(*) as Count 
from Cleaned_IBM_HR
group by OverTime, Attrition
order by OverTime, Attrition
-- Insights: Employees doing overtime have a much higher attrition percentage compared to those who don't.


-- 5. Years at Company - Attrition Trend
-- Purpose: See attrition trends over tenure.
select YearsAtCompany, Attrition, count(*) as Count 
from Cleaned_IBM_HR
group by YearsAtCompany, Attrition
order by YearsAtCompany
-- Insights: Attrition is highest in the initial years, then drops sharply for long-tenure employees.
