create database SISDB;
use sisdb;

create table Students(
student_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50),
date_of_birth date,
email varchar(50) unique,
phone_number long unique
);

create table Teacher(
teacher_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50),
email varchar(50) unique
);

create table Courses(
course_id int auto_increment primary key,
course_name varchar(50) not null,
credits int,
teacher_id int ,
foreign key(teacher_id) references Teacher(teacher_id)  on delete cascade
);

create table Enrollments(
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enrollment_date date,
foreign key(student_id) references Students(student_id) on delete cascade,
foreign key(course_id) references Courses(course_id) on delete cascade
);

create table Payments(
payment_id int auto_increment primary key,
student_id int,
foreign key(student_id) references students(student_id) on delete cascade,
amount long not null,
payment_date date
);

insert into Students(first_name,last_name,date_of_birth,email,phone_number) values
("Arjun","Kumar","2002-05-14","arjun.kumar@gmail.com",9987654321),
("Priya","Sharma","2001-08-23","priya.sharma@gmail.com",9876543210),
("Rahul","Verma","2003-11-10","rahul.verma@gmail.com",8765432109),
("Sneha","Reddy","2000-04-05","sneha.reddy@gmail.com",7654321098),
("Vikram","Singh","2002-09-30","vikram.singh@gmail.com",9543210987),
("Aditi","Nair","2001-12-12","aditi.nair@email.com",8432109876),
("Karthik","Iyer","2003-02-25","karthik.iyer@gmail.com",9321098765),
("Neha","Das","2000-07-19","neha.das@gmail.com",8210987654),
("Rohan","Mehta","2002-06-07","rohan.mehta@gmail.com",8098765432),
("Ananya","Pillai","2001-03-15","ananya.pillai@gmail.com",9283127382);


insert into teacher(first_name,last_name,email) values
('Ramesh', 'Iyer', 'ramesh.iyer@gmail.com'),
('Anjali', 'Rao', 'anjali.rao@gmail.com'),
('Karthik', 'Menon', 'karthik.menon@gmail.com'),
('Vivek', 'Shah', 'vivek.shah@gmail.com'),
('Sneha', 'Pillai', 'sneha.pillai@gmail.com'),
('Raj', 'Verma', 'raj.verma@gmail.com'),
('Neha', 'Sharma', 'neha.sharma@gmail.com'),
('Arjun', 'Das', 'arjun.das@gmail.com'),
('Priya', 'Nair', 'priya.nair@gmail.com'),
('Rohit', 'Mehta', 'rohit.mehta@gmail.com');


insert into Courses(course_name,credits,teacher_id) VALUES
('Data Structures & Algorithms', 4, 9),
('Database Management Systems', 3, 2),
('Operating Systems', 4, 5),
('Computer Networks', 3, 4),
('Machine Learning', 4, 7),
('Web Development', 3, 8),
('Cyber Security', 4, 10),
('Cloud Computing', 3, 1),
('Software Engineering', 3, 3),
('Artificial Intelligence', 4, 6);

insert into Enrollments(student_id,course_id,enrollment_date) values
(123, 1038, '2024-01-10'),
(115, 1041, '2024-01-12'),
(121, 1034, '2024-01-15'),
(116, 1040, '2024-02-01'),
(120, 1032, '2024-02-05'),
(122, 1035, '2024-02-10'),
(118, 1037, '2024-02-15'),
(114, 1033, '2024-03-01'),
(119, 1036, '2024-03-05'),
(117,1039, '2024-03-10');


insert into payments(student_id,amount,payment_date) values
(123, 15000, '2024-01-10'),
(116, 12000, '2024-01-12'),
(117, 18000, '2024-01-15'),
(118, 14000, '2024-02-01'),
(119, 16000, '2024-02-05'),
(121, 13000, '2024-02-10'),
(122, 17000, '2024-02-15'),
(114, 15000, '2024-03-01'),
(115, 14000, '2024-03-05'),
(120, 15500, '2024-03-10');


insert into Enrollments(student_id,course_id,enrollment_date) values
(123, 1032, '2024-01-10'),
(123, 1033, '2024-01-12'),
(123, 1034, '2024-01-15'),
(123, 1035, '2024-02-01'),
(123, 1036, '2024-02-05'),
(123, 1037, '2024-02-10'),
(123, 1039, '2024-02-15'),
(123, 1040, '2024-03-01');
