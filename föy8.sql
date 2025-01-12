-- Find the enrolled course count in Spring 2010.

SELECT COUNT(DISTINCT course_id) AS enrolled_course_count
FROM takes
WHERE semester = 'Spring' AND year = 2010;


-- Find the enrolled courses by students whose department name start with ‘A’
-- Bölüm adı 'A' ile başlayan öğrencilere göre kayıtlı kursları bulun

SELECT DISTINCT c.title
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE s.dept_name LIKE 'A%';


--  Find the department of instructors whose names starts with ‘A’ which teaches 
--	at least one lesson in Spring 2009.


SELECT DISTINCT i.dept_name
FROM instructor i
JOIN teaches t ON i.ID = t.ID
WHERE i.name LIKE 'A%' AND t.semester = 'Spring' AND t.year = 2009;

--  Find the average salary of instructors who teaches at least one course names 
--	ends with ‘c’ for each department.

SELECT i.dept_name, AVG(i.salary) AS average_salary
FROM instructor i
JOIN teaches t ON i.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE c.title LIKE '%c'
GROUP BY i.dept_name;




