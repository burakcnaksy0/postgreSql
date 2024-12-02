SELECT 
    i.name AS instructor_name, 
    i.dept_name, 
    (SELECT d.budget 
     FROM department d 
     WHERE d.dept_name = i.dept_name) AS department_budget
FROM instructor i; 

--Bir öğrencinin toplam aldığı krediyi ve danışmanının ismini listeleme

SELECT 
    s.name AS student_name, 
    s.tot_cred AS total_credits, 
    (SELECT i.name 
     FROM instructor i, advisor a 
     WHERE a.i_id = i.ID AND a.s_id = s.ID) AS advisor_name
FROM student s;

--Bir öğrenci için alınan derslerin, notlarının ve ders veren hocanın adını getirme

SELECT 
    s.name AS student_name, 
    t.grade, 
    (SELECT co.title 
     FROM course co 
     WHERE co.course_id = t.course_id) AS course_title, 
    (SELECT i.name 
     FROM instructor i, teaches te 
     WHERE te.ID = i.ID 
     AND te.course_id = t.course_id 
     AND te.sec_id = t.sec_id) AS instructor_name
FROM student s, takes t
WHERE s.ID = t.ID;

-- Bir sınıfta (classroom) yapılan derslerin kapasitesini ve ders adını getirme

SELECT 
    c.building, 
    c.room_number, 
    c.capacity, 
    (SELECT co.title 
     FROM course co, section s 
     WHERE s.course_id = co.course_id 
     AND s.building = c.building 
     AND s.room_number = c.room_number 
     LIMIT 1) AS course_title
FROM classroom c;

--Bir bölümde çalışan öğretim elemanlarını ve departman bütçelerini listeleme

SELECT 
    i.name AS instructor_name, 
    i.dept_name, 
    (SELECT d.budget 
     FROM department d 
     WHERE d.dept_name = i.dept_name) AS department_budget
FROM instructor i;

