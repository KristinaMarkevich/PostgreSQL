1. Создать таблицу employees
create table employees(
id serial primary key,
employee_name varchar(50) not null
);
2. Наполнить таблицу employee 70 строками. Наполняем разными данными, вызываем несколько раз функцию.
insert into employees(employee_name)
values ('Kris15'),
       ('Nikita15'),
       ('Nilou15'),
       ('Zamay15'),
       ('Gleb15');
3.Создать таблицу salary   
create table salary (
id serial primary key,
monthly_salary int not null);
4.Наполнить таблицу salary 15 строками:
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
5. Создать таблицу employee_salary
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null,
foreign key (salary_id) references salary(id)
);
6.Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
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
7.Создать таблицу roles
create table roles(
id serial primary key,
role_name int not null unique
);
8.Поменять тип столба role_name с int на varchar(30)
alter table roles 
alter column role_name TYPE varchar(30);
9.Наполнить таблицу roles 20 строками
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
10. Создать таблицу roles_employee
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id) references employees(id),
foreign key (role_id) references roles(id)
);
11. Наполнить таблицу roles_employee 40 строками:
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

