-- Examples on logical operators

-- a plain select
select employee_id, first_name, last_name, department_id
from employee
where department_id = 2;

-- "not" is to get it the other way round
select employee_id, first_name, last_name, department_id
from employee
where not department_id > 2;

-- "and" is when both conditions should hold
select employee_id, first_name, last_name, department_id, salary
from employee
where salary < 3000 and employee_id > 160;

-- "or" is when one or the other should hold
select employee_id, first_name, last_name, department_id, salary
from employee
where salary < 2200 or last_name = 'King';

select first_name, last_name, salary
from employee
where salary > 2800 AND salary < 3100;