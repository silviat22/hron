-- examples on subquery

-- most common subquery: select - where

-- employees in department 'IT' (slightly unsafe, departments could have duplicated names)
select concat(first_name, ' ', last_name)
from employee
where department_id = (
    select department_id
    from department
    where name = 'IT');

-- who is the manager of John Chen
-- fine, but risky: first + last name should be unique!
-- could get SQL Error [21000]: more than one row returned by a subquery used as an expression
select employee_id, first_name, last_name, salary
from employee
where employee_id = (
	select manager_id
	from employee
	where first_name = 'John' and last_name = 'Chen');

-- self join
select m.employee_id, m.first_name, m.last_name, m.salary
from employee e join employee m -- m=tabella manager
-- join on perché PK e FK hanno nomi diversi
on e.manager_id = m.employee_id -- (FK manager id, PK employee id?)
where e.first_name = 'John' and e.last_name = 'Chen';


-- a safer version select - where, using "in" and checking for null
-- who are the manager of employees having last name starting with 'K' (null not included)
select first_name, last_name
from employee
where employee_id in ( -- meglio in se il result set è più corposo
	select manager_id
	from employee
	where last_name like 'K%' and manager_id is not null);

-- subquery in select - group by - having + another one in select - from
-- step 1: average salaries for each department
select round(avg(salary)) as "avg_sal"
from employee
group by department_id
order by avg_sal desc;

-- step 2: highest salary among the average salary for each department
select round(max(tmp.avg_sal)) from (
	select avg(salary) avg_sal
	from employee
	group by department_id) tmp;

-- average salaries for each department (no null), excluding the topmost one
select department_id, round(avg(salary)) as "avg_sal"
from employee
group by department_id having avg(salary) < (select max(x.sal) from (
	select avg(salary) sal
	from employee
	group by department_id) x
    where department_id is not null)
order by avg_sal desc;

-- subquery in select - from - join
-- how many countries for each region
select name, c.country_count
from region natural join (
    select region_id, count(*) country_count
    from country
    group by region_id) c;

-- multirow subquery in select - where
-- to get manager names
select first_name, last_name
from employee
where employee_id in (
    select distinct manager_id
    from employee
    where manager_id is not null)
order by last_name;
