-- Minimal SQL

-- select all
select * -- per leggere dati
from service;

select name
from region;

-- insert a new row
insert into service (name) values ('Scratchaway'); -- nome colonna tra parentesi, values, nome che interessa tra apici e tonde

-- update a row
update service
set location_id = 1400 -- operazione su colonna
-- where name = 'Scratchaway'; -- where + campo
where service_id = 4;

-- delete a row
delete from service
-- where name = 'Scratchaway';
where service_id = 5;