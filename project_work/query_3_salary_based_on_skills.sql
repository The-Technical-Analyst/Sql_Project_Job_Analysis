/* 
Question: What are the top skills based on salary ?
- look at the average salary associated with each skill for data scientist positions 
- focuses on roles with specified salaries regardless of location 
- why ? this reveals how different skills impact salary levels fro data scientists and helps identify the most financially rewarding skills to acquire or improve 
*/

--Avg salary based on specific data science skill
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
    job_title_short = 'Data Scientist' AND 
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY    
    skills
ORDER BY    
    avg_salary DESC
LIMIT 50;


--Avg salary based on specific ML engineering skill
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE   
    job_title_short = 'Machine Learning Engineer' AND 
    salary_year_avg IS NOT NULL AND
    job_work_from_home = True
GROUP BY    
    skills
ORDER BY    
    avg_salary DESC
LIMIT 5;

