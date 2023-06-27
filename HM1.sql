create table employees(
id serial primary key,
employee_name varchar(50) not null
);

insert into employees(employee_name)
values ('Kris15'),
       ('Nikita15'),
       ('Nilou15'),
       ('Zamay15'),
       ('Gleb15');


select * from employees;

delete from employees
where id > 70 ;

create table salary (
id serial primary key,
monthly_salary int not null);
 
select* from salary

drop table employee_salary cascade

insert into salary (monthly_salary)
values (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
       
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null,
foreign key (salary_id) references salary(id)
);

insert into employee_salary(employee_id, salary_id)
values (53,1),
       (32,10),
       (67,2),
       (39,5),
       (71,6),
       (72,7),
       (73,8),
       (74,9),
       (75,10),
       (76,11),
       (77,12),
       (78,13),
       (79,13),
       (80,14),
       (81,15),
       (11,11),
       (5,1),
       (1,5),
       (2,6),
       (3,14),
       (9,13),
       (8,12),
       (40,10),
       (69,7),
       (56,3),
       (55,5),
       (33,14),
       (22,13),
       (29,10),
       (20,15),
       (38,1),
       (17,3),
       (66,2),
       (65,2),
       (64,3),
       (63,4),
       (13,14),
       (26,13),
       (43,5),
       (25,7);
       

delete from employee_salary
where id = 
      
select * from employee_salary;

create table roles(
id serial primary key,
role_name int not null unique
);

alter table roles 
alter column role_name TYPE varchar(30);

insert into roles (role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');
       
 select * from roles;
 
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id) references employees(id),
foreign key (role_id) references roles(id)
);

insert into roles_employee(employee_id, role_id)
values (56,2),
       (63,15),
       (48,16),
       (58,4),
       (55,10),
       (6,1),
       (54,4),
       (53,18),
       (32,20),
       (20,20),
       (66,19),
       (46,3),
       (39,5),
       (12,9),
       (33,13),
       (60,7),
       (30,1),
       (43,16),
       (51,4),
       (28,10),
        (59,18),
        (22,2),
        (61,3),
        (36,7),
        (29,8),
        (1,9),
        (2,20),
        (3,19),
(4,16),
(5,1),
(11,3),
(21,13),
(13,12),
(41,10),
(15,5),
(34,8),
(38,19),
(65,20),
(45,11),
(31,15);
       
select * from roles_employee;

