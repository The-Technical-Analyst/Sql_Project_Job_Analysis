--Optimal skills for Data Scientists
WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS high_demand
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE   
        job_title_short = 'Data Scientist' AND 
        job_work_from_home = True AND 
        salary_year_avg IS NOT NULL
    GROUP BY    
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
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
        skills_job_dim.skill_id
)
SELECT  
    skills_demand.skill_id,
    skills_demand.skills,
    high_demand,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY    
    high_demand DESC,
    avg_salary DESC
LIMIT 5;




--Optimal skills for ML Engineers

WITH skills_demand AS (
    SELECT
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS high_demand
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE   
        job_title_short = 'Machine Learning Engineer' AND 
        job_work_from_home = True AND 
        salary_year_avg IS NOT NULL
    GROUP BY    
        skills_dim.skill_id
), average_salary AS (
    SELECT
        skills_job_dim.skill_id,
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
        skills_job_dim.skill_id
)
SELECT  
    skills_demand.skill_id,
    skills_demand.skills,
    high_demand,
    avg_salary
FROM
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
ORDER BY    
    high_demand DESC,
    avg_salary DESC
LIMIT 5;