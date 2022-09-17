-- examples on delete

-- the current table status
select *
from service;

-- delete a single row, if exists
delete from service
where service_id = 5;

-- multiline delete - be extra careful with it!
delete from service
where service_id > 3;

-- even more careful here!
-- !!! here another table references some of these rows !!!
-- !!! the operation won't succeed on them !!!
delete from service;

-- spoiler: how to drop a table, if it exists
drop table if exists x;

-- spoiler: how to create a table, if it does not exists
create table x (
	a integer primary key
);

select * from x;

insert into x (a) values
	(42), (4), (2), (22);

delete from x;
