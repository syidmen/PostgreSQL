-- Identify Top 10 Paying Jobs

SELECT 
    job_id,
    job_title,
    job_location,
    name AS company_name,
    salary_year_avg
FROM job_postings_fact
LEFT JOIN company_dim
    USING (company_id)
WHERE 
    salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC
LIMIT 10


