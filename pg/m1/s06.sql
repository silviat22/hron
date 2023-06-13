-- examples on null

-- check null
select employee_id, first_name, last_name, commission 
from employee
where commission is null
	and last_name = 'King';

select employee_id, first_name, last_name, commission
from employee
where commission is not null 
	and last_name = 'King';

-- !!! WRONG !!! check null
select employee_id, first_name, last_name, commission
from employee
where commission = null -- uguale è confronto non assegnamento
	and last_name = 'King';

-- !!! WRONG !!!
select employee_id, first_name, last_name, commission
from employee
where commission != null
	and last_name = 'King';

-- null in operations
select first_name, last_name, salary, commission,
	salary * commission as "quota"
from employee
where last_name = 'King'; -- per chi non ha commission, uscirà null

-- coalesce: if commission is null use 0 instead
select first_name, last_name, salary, commission,
    salary * coalesce(commission, 0) as "quota"
from employee
where last_name = 'King';
