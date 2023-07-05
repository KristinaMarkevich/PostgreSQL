create table roles_salary (
id serial primary key,
id_role int not null,
id_salary int not null,
foreign key(id_role) references roles(id),
foreign key(id_salary) references salary(id)
)

insert into roles_salary(id_role, id_salary)
values (1,10),
       (2,5),
       (3,4),
       (4,14),
       (5,11),
       (6,1),
       (7,2),
       (8,3),
       (9,7),
       (10,6),
       (11,9),
       (12,12),
       (13,15),
       (14,13),
       (15,1),
       (16,8),
       (17,3),
       (18,4),
       (19,14),
       (20,15);

select * from employee_salary

      
1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select emp.employee_id, salary.monthly_salary  from employee_salary emp
join salary on salary.id = emp.salary_id 


 2. Вывести всех работников у которых ЗП меньше 2000.
 
 select emp.employee_id  from employee_salary emp
 join salary on salary.id = emp.salary_id
 where salary.monthly_salary  < '2000'
 
  select employees.employee_name , emp.employee_id  from employee_salary emp
 join salary on salary.id = emp.salary_id
 left join employees on employees.id = emp.employee_id 
 where salary.monthly_salary  < '2000'
 
 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
 select emp.salary_id from employee_salary emp  
 where employee_id > '70'
 
 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
 
 select emp.salary_id from employee_salary emp 
 join salary on salary.id = emp.salary_id 
 where salary.monthly_salary < '2000' and employee_id > '70'
 
5. Найти всех работников кому не начислена ЗП.
 
 select emp.id , emp.employee_name  from employees emp 
 left join employee_salary s on s.employee_id = emp.id 
 where s.id is null 
 order by emp.id
 
 
 6. Вывести всех работников с названиями их должности.
 
 select employees.employee_name , roles.role_name  from roles_employee r
 join roles on roles.id = r.role_id 
 join employees on employees.id = r.employee_id 
 
 
 7. Вывести имена и должность только Java разработчиков.
 
 select employees.employee_name , roles.role_name  from roles_employee r
 join employees on employees.id = r.employee_id 
 join roles on roles.id = r.role_id 
 where roles.role_name like '%Java%'
 
 8. Вывести имена и должность только Python разработчиков.
 
 select employees.employee_name , roles.role_name from roles_employee r
 join employees on employees.id = r.employee_id 
 join roles on roles.id = r.role_id 
 where roles.role_name like '%Python%'
 
 9. Вывести имена и должность всех QA инженеров.
 
 select employees.employee_name , roles.role_name from roles_employee r
 join employees on employees.id = r.employee_id 
 join roles on roles.id = r.role_id 
 where roles.role_name like '%QA%'
 
 10. Вывести имена и должность ручных QA инженеров.
 
 select e.employee_name , ro.role_name from roles_employee r
 join employees e on e.id = r.employee_id 
 join roles ro on ro.id = r.role_id 
 where ro.role_name like '%Manual%'
 
 11. Вывести имена и должность автоматизаторов QA
 
 select e.employee_name , ro.role_name from roles_employee r
 join employees e on e.id = r.employee_id 
 join roles ro on ro.id = r.role_id 
 where ro.role_name like '%Automation%'
 
 12. Вывести имена и зарплаты Junior специалистов
 
 select e.employee_name , sl.monthly_salary  from roles_employee r
 join employees e on e.id = r.employee_id 
 join roles ro on ro.id = r.role_id 
 join roles_salary sa on sa.id_role = r.role_id
 join salary sl on sl.id = sa.id_salary
 where ro.role_name like '%Junior%'
 
   
 13. Вывести имена и зарплаты Middle специалистов
 
 select e.employee_name, s.monthly_salary  from employee_salary emp
 join employees e on e.id = emp.employee_id 
 join salary s on s.id = emp.salary_id 
 join roles_employee ro on ro.employee_id = emp.employee_id 
 join roles rs on rs.id = ro.role_id 
 where rs.role_name like '%Middle%'
 
 14. Вывести имена и зарплаты Senior специалистов
 
 select emp.employee_name, s.monthly_salary  from roles_salary rs
 join salary s on s.id = rs.id_salary 
 join roles r on r.id = rs.id_role 
 join employee_salary es on es.salary_id = rs.id_salary 
 join employees emp on emp.id = es.employee_id
 where r.role_name like '%Senior%' 
   
 15. Вывести зарплаты Java разработчиков
 
 select s.monthly_salary  from roles_salary rs
 join roles r on r.id = rs.id_role 
 join salary s on s.id = rs.id_salary 
 where r.role_name like '%Java%'
   
 16. Вывести зарплаты Python разработчиков
 
 select s.monthly_salary  from roles_salary rs
 join roles r on r.id = rs.id_role 
 join salary s on s.id = rs.id_salary 
 where r.role_name like '%Python%'
 
 17. Вывести имена и зарплаты Junior Python разработчиков
 
 select emp.employee_name, s.monthly_salary  from roles_salary rs
 join roles r on r.id = rs.id_role
 join salary s on s.id = rs.id_salary
 join roles_employee re on re.role_id = rs.id_role
 join employees emp on emp.id = re.employee_id 
 where r.role_name like '%Junior Python%'
 
 18. Вывести имена и зарплаты Middle JS разработчиков
 
 select e.employee_name , s.monthly_salary  from employee_salary es
 join employees e on e.id = es.employee_id 
 join salary s on s.id = es.salary_id 
 join roles_employee re on re.employee_id = es.employee_id 
 join roles r on r.id = re.role_id 
 where r.role_name like '%Middle Java%'
 
 19. Вывести имена и зарплаты Senior Java разработчиков
 
 select e.employee_name , s.monthly_salary  from employee_salary es
 join employees e on e.id = es.employee_id 
 join salary s on s.id = es.salary_id 
 join roles_employee re on re.employee_id = es.employee_id 
 join roles r on r.id = re.role_id 
 where r.role_name like '%Senior Java%'
  
 20. Вывести зарплаты Junior QA инженеров
 
select s.monthly_salary  from roles_salary rs
join roles r on r.id = rs.id_role 
join salary s on s.id = rs.id_salary 
where r.role_name like '%Junior%' and r.role_name like '%QA%' 
 
 21. Вывести среднюю зарплату всех Junior специалистов
 
 select avg(s.monthly_salary) from employee_salary es
 join salary s on s.id = es.salary_id 
 join roles_employee re on re.employee_id = es.employee_id 
 join roles r on r.id = re.role_id 
 where r.role_name like '%Junior%'
 
 22. Вывести сумму зарплат JS разработчиков
 
 select * from employee_salary rs
 
 select sum(s.monthly_salary) as avgJS from employee_salary rs
 join salary s on s.id = rs.salary_id 
 join roles_salary r on r.id_salary = rs.salary_id 
 join roles ro on ro.id = r.id_role  
 where ro.role_name like '%JavaScript%' 

 23. Вывести минимальную ЗП QA инженеров
 
 select min(s.monthly_salary) from roles_employee re
 join roles r on r.id = re.role_id 
 join employee_salary emp on emp.employee_id = re.employee_id 
 join salary s on s.id = emp.salary_id 
 where r.role_name like '%QA%'
 
 24. Вывести максимальную ЗП QA инженеров
 
 select max(s.monthly_salary) from roles_employee re
 join roles r on r.id = re.role_id 
 join employee_salary emp on emp.employee_id = re.employee_id 
 join salary s on s.id = emp.salary_id 
 where r.role_name like '%QA%'
 
 25. Вывести количество QA инженеров
 
 select count(r.role_name) from roles_employee re
 join roles r on r.id = re.role_id 
 where r.role_name like '%QA%'
 
 26. Вывести количество Middle специалистов.
 
 select count(r.role_name) from roles_employee re
 join roles r on r.id = re.role_id 
 where r.role_name like '%Middle%'
 
 27. Вывести количество разработчиков
 
 select count(r.role_name) from roles_employee re
 join roles r on r.id = re.role_id 
 where r.role_name like '%developer%'
 
 28. Вывести фонд (сумму) зарплаты разработчиков.
 
 select sum(s.monthly_salary) from employee_salary es
 join salary s on s.id = es.salary_id 
 join roles_employee re on re.employee_id = es.employee_id 
 join roles r on r.id = re.role_id 
 where r.role_name like '%developer%'
 
 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
 
 select e.employee_name , s.monthly_salary, r.role_name  from employee_salary es 
 join employees e on e.id = es.employee_id 
 join salary s on s.id = es.salary_id 
 join roles_salary rs on rs.id_salary = s.id 
 join roles r on r.id = rs.id_role
 order by s.monthly_salary  
 
 
 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
 
 select e.employee_name , r.role_name , s.monthly_salary  from roles_employee re
 join employees e on e.id = re.employee_id 
 join roles r on r.id = re.role_id 
 join employee_salary es on es.employee_id = e.id 
 join salary s on s.id = es.salary_id 
 where s.monthly_salary between 1700 and 2300
 order by s.monthly_salary 
 
31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
 
 select e.employee_name , r.role_name , s.monthly_salary  from roles_employee re
 join employees e on e.id = re.employee_id 
 join roles r on r.id = re.role_id 
 join employee_salary es on es.employee_id = e.id 
 join salary s on s.id = es.salary_id 
 where s.monthly_salary < 2300
 order by s.monthly_salary  
 
 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
      
 select e.employee_name , r.role_name,s.monthly_salary from employee_salary es 
 join employees e on e.id = es.employee_id 
 join salary s on s.id = es.salary_id 
 join roles_salary rs on rs.id_salary = s.id 
 join roles r on r.id = rs.id_role
 where s.monthly_salary in(1100, 1500, 2000)
 order by s.monthly_salary 
 
