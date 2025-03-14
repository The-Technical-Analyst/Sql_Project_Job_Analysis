SELECT 
    EXTRACT(MONTH FROM job_posted_date) AS month_column,
    EXTRACT(YEAR FROM job_posted_date) AS year_column,
    EXTRACT(QUARTER FROM job_posted_date) AS quarter_column
FROM 
    job_postings_fact
LIMIT 10;

SELECT 
    job_schedule_type,
    job_title_short,
    AVG(salary_hour_avg) AS avg_hr_salary,
    job_posted_date
FROM
    job_postings_fact
WHERE  
    salary_hour_avg IS NOT NULL
    AND job_posted_date > '2023-06-1 14:35:23'
GROUP BY
    job_title_short,
    job_schedule_type,
    job_posted_date;


SELECT 
    job_schedule_type,
    job_title_short,
    AVG(salary_year_avg) AS avg_salary,
    job_posted_date
FROM
    job_postings_fact
WHERE  
    salary_year_avg IS NOT NULL
    AND job_posted_date > '2023-06-1 14:35:23'
GROUP BY
    job_title_short,
    job_schedule_type,
    job_posted_date;

CREATE TABLE january_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE february_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE march_jobs AS
    SELECT *
    FROM
        job_postings_fact
    WHERE   
        EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT *
FROM 
    march_jobs;


SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg <= 100000 THEN 'normal'
        WHEN salary_year_avg BETWEEN 101000 AND 199000 THEN 'above normal'
        WHEN salary_year_avg > 250000 THEN 'high'
        ELSE 'okay'
    END AS salary_category
FROM    
    job_postings_fact
WHERE   
    job_title_short = 'Data Analyst'
GROUP BY
    salary_category;


 
SELECT * 
FROM    
    march_jobs


WITH company_job_count AS (
    SELECT
        COUNT(*) AS total_jobs,
        company_id
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;

WITH skill_count AS (
    SELECT 
        COUNT(*) AS skills_mentioned,
        skill_id
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)
SELECT
    skills_dim.skills AS skill,
    skill_count.skills_mentioned
FROM
    skills_dim
LEFT JOIN skill_count ON skills_dim.skill_id = skill_count.skill_id
ORDER BY
    skills_mentioned DESC;


WITH company_job_count AS (
    SELECT
        COUNT(*) AS total_jobs,
        company_id
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs,
    CASE
        WHEN company_job_count.total_jobs > 50 THEN 'Large'
        WHEN company_job_count.total_jobs BETWEEN 10 AND 50 THEN 'Medium'
        WHEN company_job_count.total_jobs <= 10 THEN 'Small'
    END AS company_size
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC;


SELECT *
    FROM
        january_jobs
    


