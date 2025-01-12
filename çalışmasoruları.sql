--Find the names and salary of all instructors in the ‘Comp. Sci.’ department who have taught some course.

select distinct name , salary
from instructor as i
inner join teaches as t
	on i.id = t.id
where i.dept_name = 'Comp. Sci.'
	
SELECT DISTINCT i.name, i.salary
FROM instructor AS i
INNER JOIN teaches AS t
    ON i.ID = t.ID
WHERE i.dept_name = 'Comp. Sci.';


-- Find the names, department and salary of all instructors who have a lower salary than some instructor in ‘Art’ department.

select i.name , i.dept_name , i.salary
from instructor as i
where i.salary < any    -- Bu, maaşın 'Art' bölümündeki maaşların herhangi biriyle karşılaştırılmasını sağlar.
	(
		select salary
		from instructor 
		where dept_name = 'Biology'
	)

-- Find the names of all instructors with salary lower than 80000$.
select i.name , i.salary
from instructor as i
where salary < 80000

-- Find the average salary of instructors in the Art department.

select dept_name , avg(salary) as averageSalary
from instructor
group by dept_name


-- To find all courses taught in the Spring 2009 semester but not in the Fall 2010. (Use “Except”)

SELECT (
		select title
		from course as c
		where c.course_id  = t.course_id
		) as cours_title , semester, year
FROM teaches as t
WHERE t.semester = 'Spring' AND t.year = 2009
EXCEPT
SELECT (
		select title
		from course as c
		where c.course_id  = t.course_id
		) as cours_title , semester, year
FROM teaches as t
WHERE t.semester = 'Fall' AND t.year = 2010;

-- Find courses that ran in Fall 2010 and in Spring 2009. (Use “Intersect”)

select (
		select title
		from course as c
		where c.course_id = s.course_id		
	   ) as course_title , s.semester , s.year
from section as s
where s.semester = 'Fall' and s.year = '2010'
intersect
select (
		select title
		from course as c
		where c.course_id = s.course_id		
	   ) as course_title , s.semester , s.year
from section as s
where s.semester = 'Spring' and s.year = '2009'

-- Find the names of all students who have taken at least one Art course; make sure there are no duplicate names in the result.

select DISTINCT s.name 
from student as s
inner join takes as t
	on t.id = s.id
inner join course as c
	on t.course_id = c.course_id
where c.title = 'Geology'
order by s.name

-- Find departments where the average salary of the instructors is more than $55,000.

SELECT dept_name
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 55000;

-- For each department, find the minimum salary of instructors in that department. You may assume that every department has at least one instructor.

SELECT i.name, i.dept_name, i.salary AS minimumsalary
FROM instructor AS i
WHERE i.salary = (
    SELECT MIN(i2.salary)
    FROM instructor AS i2
    WHERE i2.dept_name = i.dept_name
)

-- Find the IDs and names of all students who have not taken any course offering before Spring 2009.

SELECT s.id, s.name
FROM student AS s
WHERE s.id NOT IN (
    SELECT t.id
    FROM takes AS t
    WHERE t.year < 2009
       OR (t.year = 2009 AND t.semester = 'Spring')
);














