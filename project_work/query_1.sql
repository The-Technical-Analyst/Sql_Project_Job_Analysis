--Finding companies with high average yearly salaries for data scientists 
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title_short = 'Data Scientist' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;


--Finding companies with high average yearly salaries for ML engineers
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title_short = 'Machine Learning Engineer' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;


--Finding companies with high average yearly salaries for machine learning engineers 
SELECT
    job_id,
    name AS company_name,
    job_title,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title_short = 'Machine Learning Engineer' AND 
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 20;