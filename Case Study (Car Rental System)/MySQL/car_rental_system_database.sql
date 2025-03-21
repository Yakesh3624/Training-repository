create database crs;

use crs;

create table vehicle(
vehicleID int auto_increment primary key,
make varchar(50) not null,
model varchar(50) not null,
year int not null,
dailyRate float not null,
status enum("available","notAvailable") not null,
passengerCapacity int not null,
engineCapacity float not null);


create table customer(
customerID int auto_increment primary key,
firstName varchar(50) not null,
lastName varchar(50),
email varchar(50)not null unique,
phoneNumber bigint not null unique);

create table lease(
leaseID int auto_increment primary key,
vehicleID int,
customerID int,
startDate date not null,
endDate date not null,
type varchar(12) check(type in("DailyLease","MonthlyLease")) not null,
foreign key(vehicleID) references vehicle(vehicleID) on delete cascade,
foreign key(customerID) references customer(customerID) on delete cascade
);

create table payment(
paymentID int auto_increment primary key,
leaseID int,
paymentDate date not null,
amount float not null,
foreign key(leaseID) references lease(leaseID) on delete cascade
);
