-- examples on comparison operators

-- equality comparison to numeric value
select *
from region
where region_id = 1;

-- equality comparison to string
select *
from region
where name = 'Asia';

-- non-equality comparison
select *
from region
where region_id != 2;

-- non-equality comparison, alternative notation
select *
from region
where region_id <> 2;

-- strictly less than
select *
from region
where region_id < 3;

-- less or equal (to string)
select *
from region
where name <= 'Asia'; -- controllo alfabetico sulle stringhe e date

-- less or equal (to numeric)
select *
from region
where region_id <= 3;

-- simple pattern matching (case sensitive)
select first_name, last_name
from employee
where last_name like '_ull%';

-- simple pattern matching (case insensitive)
select first_name, last_name
from employee
where last_name ilike 'b%'; -- ilike significa insensitive like, non dà importanza alle maiuscole/minuscole

-- like is standard SQL, ilike is a PG extension
select first_name, last_name
from employee
where last_name like 'B%';

select first_name, last_name
from employee
where last_name like '__ll%'; -- 2 underscore all'inizio: solo 2 caratteri prima di ll...

select first_name, last_name
from employee
where last_name like '%ull_';

select last_name
from employee
where last_name like '___';

select last_name
from employee
where last_name ilike 'sul%'; -- ilike può essere o non essere la lettera minuscola o maiuscola

select first_name, last_name
from employee
where first_name ilike '%tr%' OR last_name ilike '%ll';

-- interval check by BETWEEN
select *
from region
where region_id between 1 and 3;

select *
from country
where name between 'A' and 'China';

select *
from country
where name >= 'A' and name <= 'China';

select *
from country
where name between 'C' and 'China';

-- check if (not) in a set by operator IN
select *
from region
where region_id not in (2, 4);

select *
from region
where region_id in (4, 2); -- l'ordine non è significativo

-- case sensitive!
select *
from region
where name in ('Europe', 'asia'); -- asia non lo prende perché scritto minuscolo

-- beware of null
select *
from region
where region_id not in (2, 3, null); -- il null spacca tutto, non risulta nulla

select *
from region
where name not in ('Europe', null);

-- can't compare a 'good' value with null
select *
from region
where region_id not in (null) or region_id in (null);

select *
from region
where region_id is not null or region_id is null;

-- this works fine
select *
from employee
where commission in (0.10, 0.15);

-- this does not select anything!
select *
from employee
where commission in (null); -- spacca tutto per via dell'=

-- "is null" is the only way to check it
select *
from employee
where commission is null;
