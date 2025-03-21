use sisdb;

select round(avg(c)) as Average_Student_Per_Course from (select course_id,count(student_id) as c from enrollments group by course_id) as count_stud;

select student_id,amount from payments where amount = (select max(amount) from payments);

select course_id from enrollments group by course_id having count(student_id) = 
(select max(st_count) as m from
(select course_id,count(student_id) as st_count from enrollments group by course_id) as t1 ) ;

select concat(t.first_name," ",t.last_name) as Teacher_Name,t2.course_name as Course_Name,t2.am as Amount from teacher t inner join 
(select c.teacher_id, c.course_name ,t1.am from courses c right join 
(select e.course_id,sum(p.amount) as am from payments p inner join enrollments e on p.student_id=e.student_id group by course_id ) t1 on c.course_id=t1.course_id) as t2 on t.teacher_id=t2.teacher_id;

select student_id from enrollments group by student_id having count(course_id)=
(select count(*) from courses);

select concat(first_name," " , last_name) as Teacher_Name from teacher where teacher_id in (select teacher_id from courses where course_id in ( select course_id from enrollments group by course_id having count(student_id)=0));

select round(avg(age)) as Average_Age from (select timestampdiff(year,date_of_birth,curdate()) as Age from students) as t1;

select course_name from courses where course_id not in (select distinct(course_id) from enrollments);

select p.student_id,e.course_id,sum(p.amount) from payments p inner join enrollments e on p.student_id=e.student_id group by course_id,student_id;

select concat(first_name," ",last_name) as Student_Name from students where student_id in (select student_id from payments group by student_id having count(student_id)>1);

select concat(s.first_name," ",s.last_name) as Studnet_Name,sum(p.amount) as Amount from students s inner join payments p on s.student_id=p.student_id group by s.student_id;

select c.course_name,count(e.student_id) as No_of_Students from enrollments e inner join courses c on e.course_id=c.course_id group by e.course_id;

select s.student_id,avg(p.amount) from payments p inner join students s on p.student_id=s.student_id group by s.student_id;