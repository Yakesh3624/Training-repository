use sisdb;

insert into students(first_name,last_name,date_of_birth,email,phone_number) values("John","Doe","1995-08-15","john.dow@example.com",1234567890);

insert into enrollments(student_id,course_id,enrollment_date) values(124,1040,"2025-03-18");

update teacher set email="Vivek123@eeample.com" where first_name="Vivek";

delete from enrollments where student_id=117;

update courses set teacher_id=4 where course_name="Database Management Systems";

delete from students where first_name="Neha";

update payments set amount = amount + 10000 where student_id=122;