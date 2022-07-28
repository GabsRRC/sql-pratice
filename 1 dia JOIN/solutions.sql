-- QUESTÃO 1
SELECT users.id AS id, users.name AS name, cities.name AS city
FROM users
JOIN cities ON users."cityId" = cities.id
WHERE cities.name = 'Rio de Janeiro';

-- QUESTÃO 2
SELECT testimonials.id AS id, writer.name AS writer, recipient.name AS recipient, testimonials.message AS message
FROM testimonials 
JOIN users writer ON testimonials."writerId" = writer.id
JOIN users recipient ON testimonials."recipientId" = recipient.id;

-- QUESTÃO 3
SELECT users.id AS id, users.name AS name, courses.name AS course, schools.name AS school, educations."endDate" as "endDate"
FROM educations 
JOIN users ON educations."userId" = users.id
JOIN courses ON educations."courseId" = courses.id
JOIN schools ON educations."schoolId" = schools.id
WHERE users.id = 30;

-- QUESTÃO 4
SELECT users.id AS id, users.name AS name, roles.name AS role, companies.name AS company, experiences."startDate" AS "startDate"
FROM experiences
JOIN users ON experiences."userId" = users.id
JOIN roles ON experiences."roleId" = roles.id
JOIN companies ON experiences."companyId" = companies.id
WHERE experiences."endDate" IS NULL
AND users.id = 50;