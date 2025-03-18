/* Top Skills based on job title and remote work for ML engineers*/
WITH top_skills AS (
    SELECT
        job_id,
        name AS company_name,
        job_title_short,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE   
        job_title_short = 'Machine Learning Engineer' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 20
)
SELECT 
    top_skills.*,
    skills 
FROM    
    top_skills
INNER JOIN skills_job_dim ON top_skills.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 25;

--Top in demand skills for ML Engineers
WITH remote_skills_count AS (
    SELECT
        skill_id,
        COUNT(*) AS count_skill
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE   
        job_title_short = 'Machine Learning Engineer'
        /*job_work_from_home = True*/
    GROUP BY
        skill_id
)
SELECT 
    remote_skills_count.*,
    skills
FROM    
    remote_skills_count
INNER JOIN skills_dim ON remote_skills_count.skill_id = skills_dim.skill_id
ORDER BY
    count_skill DESC
LIMIT 5


--Top in demand skills for Data Engineers
WITH remote_skills_count AS (
    SELECT
        skill_id,
        COUNT(*) AS count_skill
    FROM
        skills_job_dim
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE   
        job_title_short = 'Data Engineer'
        /*job_work_from_home = True*/
    GROUP BY
        skill_id
)
SELECT 
    remote_skills_count.*,
    skills
FROM    
    remote_skills_count
INNER JOIN skills_dim ON remote_skills_count.skill_id = skills_dim.skill_id
ORDER BY
    count_skill DESC
LIMIT 5