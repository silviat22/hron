-- ESERCIZI SLIDE M28 10 E 11

-- select *
-- from employee;

select first_name, last_name, phone, hired
from employee
ORDER BY last_name, first_name;

select first_name, last_name, phone, hired
from employee
where first_name = 'David' OR first_name = 'Peter';

select first_name, last_name, phone, hired
from employee
where department_id = 6;

select first_name, last_name, phone, hired
from employee
where department_id in (3, 5);

select first_name, last_name, phone, hired, salary
from employee
where salary > 10000;

select first_name, last_name, phone, hired, salary
from employee
where salary < 4000 OR salary > 15000;

select first_name, last_name, phone, hired, salary, department_id
from employee
where department_id in (5, 8) AND (salary < 4000 OR salary > 15000);

select salary
from employee
where department_id = 8;


select first_name, last_name, hired
from employee
where hired between '2015-01-01' and '2015-12-31';
-- la data è espressa in stringa 

select first_name, last_name, hired
from employee
where hired::varchar like '2015%';

select first_name, last_name, hired
from employee
where hired between '2015-01-01' and '2015-12-31'
order by hired;

select distinct job_id
from employee
order by job_id;

select first_name, last_name, salary, commission
from employee
where commission is not null
order by commission;


select first_name, last_name
from employee
where first_name ilike '%a%' or last_name ilike '%a%';

select distinct name
from department
order by name;


select state_province, street_address
from location
where country_id like 'IT';