-- Question 1
create database pp;
use pp;

-- Question 2,3,4
create table pets(
petid int auto_increment primary key,
name varchar(50) not null,
age int not null,
breed varchar(50) not null,
type varchar(50),
shelterid int,
foreign key(shelterif) references shelters(shelterid) on delete cascade,
availableforadoption bit
);
	
create table shelters(
shelterid int auto_increment primary key,
name varchar(50) not null,
location varchar(100) not null
);

create table donations(
donationid int auto_increment primary key,
donorname varchar(50) not null,
donationtype varchar(50) not null,
donationamount float,
donationitem varchar(100),
donationdate datetime not null,
shelterid int,
foreign key(shelterid) references shelters(shelterid)
);

create table adoptionevents(
eventid int auto_increment primary key,
eventname varchar(50) not null,
eventdate datetime  not null,
location varchar(100) not null
);

create table participants(
participantid int auto_increment primary key,
participantname varchar(50) not null,
participanttype varchar(50) not null,
eventid int ,
foreign key(eventid) references adoptionevents(eventid) on delete cascade
);


create table adoption(adoptionid int auto_increment primary key,
petid int,
participantid int,
foreign key(petid) references pets(petid) on delete cascade,
foreign key(participantid) references participants(participantid) on delete cascade
);

insert into pets(name,age,breed,type,availableforadoption) values
('Max', 3, 'Labrador', 'Dog', 1),
('Bella', 2, 'Persian', 'Cat', 1),
('Rocky', 4, 'German Shepherd', 'Dog', 0),
('Luna', 1, 'Siamese', 'Cat', 1),
('Kiwi', 2, 'Parakeet', 'Bird', 1),
('Ginger', 3, 'Holland Lop', 'Rabbit', 1),
('Thunder', 5, 'Arabian', 'Horse', 0),
('Spike', 4, 'Bearded Dragon', 'Reptile', 1),
('Goldie', 1, 'Goldfish', 'Fish', 1),
('Bubbles', 2, 'Axolotl', 'Amphibian', 1),
('Ziggy', 1, 'Macaw', 'Bird', 1),
('Whiskers', 3, 'Angora', 'Rabbit', 1),
('Mocha', 2, 'Chinchilla', 'Rodent', 0),
('Slinky', 4, 'Corn Snake', 'Reptile', 1),
('Pearl', 1, 'Betta Fish', 'Fish', 1);


insert into shelters(name,location) values
('Happy Paws Shelter', 'New York'),
('Safe Haven Animal Home', 'Los Angeles'),
('Furry Friends Rescue', 'Chicago'),
('Loving Tails Sanctuary', 'Miami'),
('Paw Haven Shelter', 'Austin');

insert into donations(donorname,donationtype,donationamount,donationitem,donationdate) values
('John Doe', 'Cash', 200.00, null, '2024-03-01 10:00:00'),
('Jane Smith', 'Item', null, 'Dog Food', '2024-03-05 14:30:00'),
('Mike Lee', 'Cash', 100.00, null, '2024-03-10 09:15:00'),
('Sarah Kim', 'Item', null, 'Cat Toys', '2024-03-12 12:45:00'),
('Chris Evans', 'Cash', 500.00,null, '2024-03-15 11:00:00'),
('Emma Watson', 'Item', null, 'Pet Beds', '2024-03-18 14:45:00'),
('Daniel Lee', 'Cash', 250.00, null, '2024-03-20 08:30:00'),
('Olivia Green', 'Item', null, 'Bird Cages', '2024-03-22 16:20:00'),
('Robert Brown', 'Cash', 180.00, null, '2024-03-24 13:10:00'),
('Alice Carter', 'Item', null, 'Rabbit Hutches', '2024-03-25 15:45:00');


insert into adoptionevents(eventname,eventdate,location) values
('Spring Adoption Fair', '2024-04-10 10:00:00', 'Central Park'),
('Pet Rescue Meetup', '2024-05-15 12:00:00', 'LA Animal Center'),
('Summer Pet Fest', '2024-06-20 09:00:00', 'Chicago Fairground'),
('National Pet Day Event', '2024-07-10 11:00:00', 'Miami Beach Park'),
('Home for the Holidays', '2024-12-15 13:00:00', 'Austin Pet Park');

insert into participants(participantname,participanttype,eventid) values 
('Happy Paws Shelter', 'Shelter', 1),
('Safe Haven Animal Home', 'Shelter', 2),
('Emily Johnson', 'Adopter', 1),
('Michael Brown', 'Adopter', 3),
('Furry Friends Rescue', 'Shelter', 3),
('Anna Williams', 'Adopter', 2),
('Paw Haven Shelter', 'Shelter', 4),
('David Miller', 'Adopter', 5),
('Loving Tails Sanctuary', 'Shelter', 1),
('Sophia Anderson', 'Adopter', 2),
('Daniel Rodriguez', 'Adopter', 3),
('Olivia Harris', 'Adopter', 4),
('Ethan Thompson', 'Adopter', 5),
('Noah White', 'Adopter', 1);

insert into adoption (petid, participantid) values 
(1, 3),
(2, 6),
(5, 12),
(6, 4),
(8, 13),
(9, 7),
(10, 8),
(11, 5),
(12, 10),
(14, 11);

-- Question 5
select name,age,breed,type from pets where availableforadoption=1;

-- Question 6
select participantname,participanttype from participants where eventid=3;

-- Question 7
delimiter //
create procedure modifyshelter(in id int,in newname varchar(50),in newlocation varchar(50))
begin
	if id in (select shelterid from shelters) then
		update shelters set name=newname , location=newlocation where shelterid=id;
	else 
		select "Data not found";
	end if;
end //
delimiter ;

call modifyshelter(5,"Animal Welfare Shelter","Austin");

-- Question 8
select shelterid,sum(donationamount) from donations group by shelterid;

-- Question 9
select p.name from pets p left join adoption a on a.petid=p.petid where a.adoptionid is null;

-- Question 10
select monthname(donationdate),year(donationdate),sum(donationamount) from donations group by year(donationdate),monthname(donationdate) having sum(donationamount) is not null order by year(donationdate) desc, monthname(donationdate)asc;

-- Question 11
select distinct(breed) from pets where age between 1 and 3 or age>5;

-- Question 12 
select name,shelterid from pets where availableforadoption=1;

-- Question 13
select count(*) as Total_Participants from participants p inner join adoptionevents a on p.eventid=a.eventid where location="Miami Beach Park"; 
    
-- Question 14
select distinct(breed) from pets where age between 1 and 5;

-- Question 15
select p.name from adoption a right join pets p on a.petid=p.petid where a.petid is null;

-- Question 16
select p.name as Pet_Name,pa.participantname as Owner_Name from pets p inner join adoption a on p.petid=a.petid inner join participants pa on pa.participantid=a.participantid ;

-- Question 17
select shelterid,count(petid) from pets group by shelterid;

-- Question 18
select p1.petid , p1.name, p2.petid, p2.name, p1.breed, s.name
from pets p1
join pets p2 on p1.breed = p2.breed and p1.petid < p2.petid
join shelters s on p1.shelterid = s.shelterid and p2.shelterid = s.shelterid;

-- Question 19
select a.eventname,s.name from adoptionevents a inner join shelters s on s.shelterid=a.shelterid;

-- Question20
select name from shelters where shelterid in( select shelterid from pets group by shelterid having count(*)=(
select count(*) from pets group by shelterid order by count(*)desc limit 1));

