-- QUESTÃO 01
SELECT COUNT("endDate") AS "curentExperiences"
FROM experiences;

-- QUESTÃO 02
SELECT "userId" AS id, COUNT("userId") AS educations
FROM educations
GROUP BY "userId" --ORDER BY id

-- QUESTÃO 03
SELECT users.name AS writer, COUNT (*) 
FROM testimonials
JOIN users ON testimonials."writerId" = users.id
WHERE  users.id = 435
GROUP BY writer --GROUP BY users.name 

-- QUESTÃO 04
SELECT MAX(jobs.salary) AS "maximumSalary", roles.name AS role
FROM jobs
JOIN roles ON jobs."roleId" = roles.id
WHERE jobs.active = true
GROUP BY role
ORDER BY "maximumSalary" --ORDER BY MAX(jobs.salary)