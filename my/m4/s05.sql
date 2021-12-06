-- examples on subquery
use hron;

-- A) Employees in the IT department

-- A1) Get the id of the IT department, then query the employee table
select department_id
from department
where name = 'IT';

select concat(first_name, ' ', last_name) as IT
from employee
where department_id = 6;

-- A2) Same, but with a join
select concat(e.first_name, ' ', e.last_name) as IT
from employee e join department d
using (department_id)
where d.name = 'IT';

-- A3) Same, but with a subquery
select concat(first_name, ' ', last_name) as IT
from employee
where department_id in (
	select department_id
	from department
	where name = 'IT'
);

-- B) Who is the John Chen's manager?

-- B1) Given the manager id ...
select manager_id
from employee
where first_name = 'John' and last_name = 'Chen';

-- It is easy to write a plain query to get Nancy Greenberg
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id = 108;

-- B2) Same, but using a self join
select concat(m.first_name, ' ', m.last_name) as Manager
from employee e join employee m
on e.manager_id = m.employee_id
where e.first_name = 'John' and e.last_name = 'Chen';

-- B3) Same, but using a subquery
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id = (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen');

-- B4) safer version using "in" and checking for null
select concat(first_name, ' ', last_name) as Manager
from employee
where employee_id in (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen' and manager_id is not null);

-- C) managers of employees having last name starting with 'K'
select first_name, last_name
from employee
where employee_id in (
	select manager_id
	from employee
	where last_name like 'K%' and manager_id is not null);

-- D) subquery in select - group by - having + another one in select - from
-- D1) average salaries for each department
select avg(salary)
from employee
group by department_id
order by 1 desc;

-- D2) highest salary among the average salary for each department
select max(tmp.avg_sal) from (
	select avg(salary) avg_sal
	from employee
	group by department_id) tmp;

-- D3) average salaries for each department (no null), excluding the topmost one
select department_id, round(avg(salary))
from employee
group by department_id having avg(salary) < (select max(x.sal) from (
	select avg(salary) sal
	from employee
	group by department_id) x
    where department_id is not null)
order by 2 desc;

-- E) how many countries for each region
-- subquery in select - from - join
select name, c.country_count
from region natural join (
    select region_id, count(*) country_count
    from country
    group by region_id) c;

select r.name, count(*)
from country c join region r
using (region_id)
group by c.region_id;
