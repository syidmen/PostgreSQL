
SELECT
    skills,
    COUNT(*) AS skill_count
FROM job_postings_fact
JOIN skills_job_dim
    USING (job_id)
JOIN skills_dim
    USING (skill_id)
WHERE 
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY skill_count DESC
LIMIT 5