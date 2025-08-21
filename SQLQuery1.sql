create database HR_Analytics

use HR_Analytics

-- 1. Overall Attrition Count & Percentage
select Attrition, count(*) as Employee_Count,
count(*) * 100.0 / (select count(*) from Cleaned_IBM_HR) as Percentage
from Cleaned_IBM_HR
group by Attrition
-- Insight: Around 16% of employees have left the company, which is significant and worth further investigation.


