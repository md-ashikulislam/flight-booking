set linesize 250
set pagesize 150

drop table landson;
drop table airport;
drop table airplane;
drop table passenger;
drop table booking;
drop table b_office;
drop table flight;
drop table route;
drop table fare;
drop table airline;


create table airline(
airline_code varchar(20),
airline_name varchar(30),
primary key(airline_code)
);
	
create table fare(
fare_type varchar(20),
description varchar(20),
fare_rate number(10),
seat_Selection varchar(20),
refund varchar(10),
beggage varchar(20),
primary key(fare_type) 
);

create table route(
route_no varchar(10),
fare_type varchar(20),
route_desc varchar(20),
primary key(route_no),
foreign key(fare_type) references fare
);

create table flight(
flight_no varchar(10),
airline_code varchar(20),
route_no varchar(10),
From_ varchar(10),
To_ varchar(10),
dep_date varchar(10),
dep_time varchar(10),
arr_date varchar(10),
arr_time varchar(10),
primary key(flight_no),
foreign key(airline_code) references airline,
foreign key(route_no) references route
);

create table b_office(
office_name varchar(20),
office_id number(10),
primary key(office_id)
);

create table booking(
office_id number(10),
flight_no varchar(10),
foreign key(office_id) references b_office,
foreign key(flight_no) references flight
);

create table passenger(
p_id number(5),
office_id number(10),
name varchar(10),
age number(5),
sex varchar(8),
contact number(15),
email varchar(30),
address varchar(10),
primary key(p_id),
foreign key(office_id) references b_office
);

insert into airline values('BG','Biman Bangladesh Airline');
insert into airline values('BS','US Bangla Airline');
insert into airline values('VQ','Novoair');
insert into airline values('2A','Air Astra');
insert into airline values('AA','American Airline');
insert into airline values('QK','Qatar Airways');
insert into airline values('CZ','China Southern');

insert into fare values('Basic Economy','cheapest',2500,'NO','NO','15kg');
insert into fare values('Economy','Standard',3000,'NO','Limited','20kg');
insert into fare values('Premium Economy','Classy',4000,'YES','Limited','25kg');
insert into fare values('Business Class','Delux',5000,'YES','FULL','30kg');
insert into fare values('First Class','Luxury',8000,'YES','FULL','35kg');

insert into route values('V1234','Basic Economy','DAC to CGP');
insert into route values('V4567','Premium Economy','DAC to DEL to DXB');
insert into route values('V6789','Business Class','DAC to CXB');
insert into route values('V1357','Business Class','JSR to DAC');
insert into route values('V2468','Economy','SYL to CGP');
insert into route values('V2568','First Class','DAC to ZYL');


insert into flight values('BG147','BG','V1234','Dhaka','Chittagong','12 NOV','12:45','12 NOV','1:25');
insert into flight values('VQ901','VQ','V1234','Dhaka','Chittagong','12 NOV','7:20','12 NOV','8:25');
insert into flight values('CZ615','CZ','V6789','Dhaka','Coxsbazar','13 NOV','8:45','13 NOV','9:45');
insert into flight values('BS333','BS','V1357','Jessore','Dhaka','13 NOV','9:30','13 NOV','10:25');
insert into flight values('2A419','2A','V2468','Sylhet','Chittagong','12 NOV','14:45','12 NOV','15:10');
insert into flight values('QK420','QK','V2568','Dhaka','Dubai','14 NOV','22:40','15 NOV','8:20');

insert into b_office values('GoZayaan',101);
insert into b_office values('Obokash',102);
insert into b_office values('Flight Expert',103);

insert into booking values(101,'BG147');
insert into booking values(102,'BS333');
insert into booking values(103,'QK420');

insert into passenger values(015,101,'Ashik',22,'Male',01851498242,'islam1909015@stud.kuet.ac.bd','Dhaka');
insert into passenger values(032,102,'Nabil',22,'Male',01898317404,'nabil1909032@stud.kuet.ac.bd','Dhaka');
insert into passenger values(012,103,'Jahid',22,'Male',01701309390,'jahid1909012@stud.kuet.ac.bd','Madaripur');
insert into passenger values(013,103,'Alvi',22,'Male',01558437420,null,'Noakhali');
insert into passenger values(05,101,'Joita',22,'Male',null,'joita1909005@stud.kuet.ac.bd','Dhaka');

create table airplane(
reg_no varchar(20),
airline_code varchar(10),
airplane_model varchar(15),
type varchar(25),
seats number(10),
primary key(reg_no),
foreign key(airline_code) references airline
);

create table airport(
code varchar(20),
airport_name varchar(30),
country varchar(15),
city varchar(10),
primary key(code)
);
create table landson(
code varchar(20),
reg_no varchar(20),
foreign key(code) references airport,
foreign key(reg_no) references airplane
);

insert into airplane values('S2_ABCD','BG','Boeing-777','commercial airline',180);
insert into airplane values('S2_BCDE','BS','Airbus-320','commercial airline',250);
insert into airplane values('S2_EFCD','QK','Boeing-747','commercial airline',150);
insert into airplane values('S2_CDAD','2A','ATR-72','business jet',50);

insert into airport values('DAC','Shahjalal airport','Bangladesh','Dhaka');
insert into airport values('CGP','Shah Amanat airport','Bangladesh','Chittagong');
insert into airport values('ZYL','Dubai Int. Airport','UAE','Dubai');
insert into airport values('DEL','Indira Gandhi Airport','India','Delhi');
insert into airport values('JSR','Jessore Airport','Bangladesh','Jessore');


insert into landson values('DAC','S2_ABCD');
insert into landson values('CGP','S2_CDAD');
insert into landson values('ZYL','S2_EFCD');

select * from airline;
select * from fare;
select * from route;
select * from flight;
select * from b_office;
select * from booking;
select * from passenger;
select * from airplane;
select * from airport;
select * from landson;