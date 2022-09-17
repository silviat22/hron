-- examples on inner join: using / on / natural

-- join-using, handier
select r.name as "region name", c.name as "country name" 
from region r join country c using (region_id)
where r.name = 'Europe'
order by r.name, c.name;

-- join-on, more flexible
select r.name as "region name", c.name as "country name"
from region r join country c
on r.region_id = c.region_id
where r.name = 'Americas'
order by c.name;

-- natural join
select e.first_name, e.last_name, j.title 
from employee e natural join job j
where first_name like 'A%';

-- natural join -- here it does not work!
select r.name, c.name
from region r natural join country c;
