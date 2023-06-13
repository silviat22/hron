-- esercizi m02 slide 11

-- sbagliata: alias con doppi apici
select first_name, last_name, name as "department_name"
from employee e full outer join department d
on e.department_id = d.department_id;


select e.first_name, e.last_name, j.title
from employee e join job j
on e.job_id = j.job_id;


select e.first_name, e.last_name, city, country_id
from employee e join department using(department_id)
join location using (location_id)
where country_id = 'UK';

-- select name as "department_name", manager_id

-- esercizio a parte, in classe, team_id, employee_id
select e.first_name, e.last_name, name as "team_name"
from employee e join team_employee te -- alias di tabella si pò usare come abbreviazione
on e.employee_id = te.employee_id
join team using(team_id)
where name = 'Green' -- alias di colonna va scritto ORIGINALE
order by last_name; -- alias.xxx facoltativo

-- esercizio m30 slide 5
select first_name, last_name, hired, (current_date - hired) as "days passed from hired until today"
from employee
limit 5;

-- sbagliata

select first_name, last_name, salary as "current salary", 
    round(salary + (salary/100 * 8.5), 2) as "increased salary"
from employee
limit 10;
-- round(salary *1.085, 2)...


select first_name, last_name, salary, coalesce(commission::varchar, 'No value')
from employee
limit 20;