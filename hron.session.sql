select * 
from service;

insert into service (name, location_id) values ('Albert', 2000);

select *
from job
where job_id = 15;

select *
from employee
where employee_id = 103;

select *
from department
where department_id = 6;

select *
from employee
where department_id = 6;

delete from employee 
where employee_id = 501;

select *
from region;

insert into region (region_id, name) values (22, 'Papuasia');

delete from region
where region_id = 22;


-- ESERCIZI 12 GIUGNO sub dipendenti dip. IT --

select first_name, last_name, salary
from employee
where department_id in (
        select department_id
        from department
        where name = 'IT'
);
 -- stessa query ma con join 
select first_name, last_name
from employee join department
using (department_id)
where name = 'IT';

update employee
set salary = salary + 100
where department_id in (
        select department_id
        from department
        where name = 'IT'
);


select first_name, last_name
from employee e join job j
using (job_id)
where j.title = 'Programmer';

select first_name, last_name
from employee
where job_id in (
        select job_id
        from job
        where title = 'Programmer'
);
        