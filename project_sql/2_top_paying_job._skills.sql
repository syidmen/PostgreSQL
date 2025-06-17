-- Identify skills that are required for each top jobs

-- Identify skills that are required for each of the top 10 highest-paying Data Analyst jobs

WITH top_ten_jobs AS (
    SELECT 
        job_id,
        job_title,
        job_location,
        company_dim.name AS company_name,
        salary_year_avg
    FROM job_postings_fact
    LEFT JOIN company_dim USING (company_id)
    WHERE 
        salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
        AND job_title_short = 'Data Analyst'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    t.job_id,
    t.job_title,
    t.job_location,
    t.company_name,
    t.salary_year_avg,
    s.skills,
    s.type
FROM top_ten_jobs t
LEFT JOIN skills_job_dim sjd 
    ON t.job_id = sjd.job_id
LEFT JOIN skills_dim s
    ON sjd.skill_id = s.skill_id;


