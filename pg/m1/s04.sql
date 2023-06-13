-- examples on select

-- select all
select *
from region;

-- a common select, filtered on rows and columns
select name -- colonne
from region -- tabella
where region_id = 1; -- riga

-- select a full single column
select manager_id -- singola colonna dei manager 
-- select * -- tutte le colonne
from employee;

-- select only distinct values in a column
select distinct manager_id -- distinct: no duplicati
from employee;

-- using column name alias -- si usa as, cambia per il result set e non su postgres
select title, min_salary as "min salary", min_salary as min --rinomimare colonna min_salary in min (appaiono entrambe)
-- select *
from job;

-- a result set with changed data (and column names)
select title, --nome lavoro
    min_salary,
    min_salary + 200 as "option 1", -- alias, rinominare colonna
    trunc(min_salary + (min_salary * 0.05) ) as "option 2" -- rendi il numero intero
from job;

-- no table involved in this select
select current_date,
    sqrt(25) as "squared root",
    5 / 2 as "integer division";

-- concatenation by operator ||
select region_id || ': ' || country_id as "the countries"
from country;

-- concatenation by concat()
select concat(region_id, ': ', country_id) as "the countries"
from country;

-- limit to get result set with a specified size
select first_name, last_name
from employee
limit 10; -- le prime 10 righe della tabella

-- second page
select first_name, last_name
from employee
offset 10 limit 10; -- scartane 10 e prendi gli altri 10

-- eleventh page
select first_name, last_name
from employee
limit 10 offset 100; --dammi dal 101 per 10 nomi(se ce ne sono di meno, danne di meno)
