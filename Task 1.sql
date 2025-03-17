create database SISDB;
use sisdb;

create table Students(
student_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(50) unique,
phone_number long
);

create table Teacher(
teacher_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50)
);

create table Courses(
course_id int primary key,
course_name varchar(50),
credits int,
teacher_id int ,
foreign key(teacher_id) references Teacher(teacher_id) 
);

create table Enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date,
foreign key(student_id) references Students(student_id),
foreign key(course_id) references Courses(course_id) 
);

create table Payments(
payment_id int primary key,
student_id int,
foreign key(student_id) references students(student_id),
amount long,
payment_date date
);
select * from students;

insert into Students values
(001,"Arjun","Kumar","2002-05-14","arjun.kumar@gmail.com",9987654321),
(002,"Priya","Sharma","2001-08-23","priya.sharma@gmail.com",9876543210),
(003,"Rahul","Verma","2003-11-10","rahul.verma@gmail.com",8765432109),
(004,"Sneha","Reddy","2000-04-05","sneha.reddy@gmail.com",7654321098),
(005,"Vikram","Singh","2002-09-30","vikram.singh@gmail.com",9543210987),
(006,"Aditi","Nair","2001-12-12","aditi.nair@email.com",8432109876),
(007,"Karthik","Iyer","2003-02-25","karthik.iyer@gmail.com",9321098765),
(008,"Neha","Das","2000-07-19","neha.das@gmail.com",8210987654),
(009,"Rohan","Mehta","2002-06-07","rohan.mehta@gmail.com",8098765432),
(010,"Ananya","Pillai","2001-03-15","ananya.pillai@gmail.com",9283127382);

insert into teacher values
(1, 'Ramesh', 'Iyer', 'ramesh.iyer@gmail.com'),
(2, 'Anjali', 'Rao', 'anjali.rao@gmail.com'),
(3, 'Karthik', 'Menon', 'karthik.menon@gmail.com'),
(4, 'Vivek', 'Shah', 'vivek.shah@gmail.com'),
(5, 'Sneha', 'Pillai', 'sneha.pillai@gmail.com'),
(6, 'Raj', 'Verma', 'raj.verma@gmail.com'),
(7, 'Neha', 'Sharma', 'neha.sharma@gmail.com'),
(8, 'Arjun', 'Das', 'arjun.das@gmail.com'),
(9, 'Priya', 'Nair', 'priya.nair@gmail.com'),
(10, 'Rohit', 'Mehta', 'rohit.mehta@gmail.com');


insert into Courses VALUES
(001, 'Data Structures & Algorithms', 4, 9),
(002, 'Database Management Systems', 3, 2),
(003, 'Operating Systems', 4, 5),
(004, 'Computer Networks', 3, 4),
(005, 'Machine Learning', 4, 7),
(006, 'Web Development', 3, 8),
(007, 'Cyber Security', 4, 10),
(008, 'Cloud Computing', 3, 1),
(009, 'Software Engineering', 3, 3),
(010, 'Artificial Intelligence', 4, 6);

insert into Enrollments values
(1, 3, 5, '2024-01-10'),
(2, 5, 10, '2024-01-12'),
(3, 1, 8, '2024-01-15'),
(4, 6, 4, '2024-02-01'),
(5, 2, 1, '2024-02-05'),
(6, 4, 9, '2024-02-10'),
(7, 8, 7, '2024-02-15'),
(8, 10, 3, '2024-03-01'),
(9, 9, 6, '2024-03-05'),
(10,7,2, '2024-03-10');


insert into payments values
(1,10, 15000, '2024-01-10'),
(2,6, 12000, '2024-01-12'),
(3,7, 18000, '2024-01-15'),
(4,8, 14000, '2024-02-01'),
(5,9, 16000, '2024-02-05'),
(6,2, 13000, '2024-02-10'),
(7,3, 17000, '2024-02-15'),
(8,4, 15000, '2024-03-01'),
(9,5, 14000, '2024-03-05'),
(10,1, 15500, '2024-03-10');
