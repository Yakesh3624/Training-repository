use sisdb;

select concat(s.first_name," ",s.last_name) as Student_Name,count(p.student_id) as No_of_Payments from students s left join payments p on p.student_id=s.student_id group by s.student_id ;

select c.course_name as Course_Name, count(e.student_id) as No_of_Students from courses c left join enrollments e on c.course_id=e.course_id group by c.course_id;

select concat(first_name," ",last_name) as Student_Name from students s left join enrollments e on s.student_id=e.student_id where enrollment_id is null; 

select s.first_name as First_Name, s.last_name as Last_Name, c.course_name as Course from students s left join enrollments e on s.student_id=e.student_id left join courses c on e.course_id=c.course_id;  

select concat(t.first_name," ",t.last_name) as Teacher_Name,c.course_name as Course_Name from teacher t left join courses c on t.teacher_id=c.teacher_id;

select concat(s.first_name," ",s.last_name) as Student_Name,c.course_name,e.enrollment_date from students s inner join enrollments e on s.student_id=e.student_id inner join courses c on c.course_id=e.course_id;
	
select concat(s.first_name," ",s.last_name)as Student_Name from students s left join payments p on s.student_id=p.student_id where payment_id is null;

select c.course_name as Course_Name from courses c left join enrollments e on c.course_id=e.course_id where e.enrollment_id is null;

select e1.student_id from enrollments e1 inner join enrollments e2 on e1.student_id=e2.student_id where e1.course_id!=e2.course_id group by e1.student_id;

select concat(t.first_name," ",t.last_name)as Teacher_Name from teacher t left join courses c on t.teacher_id=c.teacher_id where course_id is null;