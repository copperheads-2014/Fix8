SELECT users.*
FROM users
INNER JOIN user_skills ON user_skills.user_id = user.id
INNER JOIN job_skills ON user_skills.skill_id = job_skills.skill_id
WHERE job_skills.job_id = ?

SELECT j.*
FROM job_skills js
INNER JOIN user_skills us ON js.skill_id = us.skill_id
INNER JOIN users u ON u.id = us.user_id
INNER JOIN jobs j ON j.id = js.job_id
WHERE u.id = ?
