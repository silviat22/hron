-- examples on insert

-- the current table status
select *
from service;

-- plain insert -- 20 è primary key, meglio non inserirla così sql genera automaticamente e si evitano sovrapposizioni con codici scritti da altri
insert into service (service_id, name, location_id) values
    (20, 'Mirdor Shifty Solutions', 1100);

-- multiline insert
insert into service (service_id, name, location_id) values
	(22, 'Old Gondor Messingup', 1200),
	(23, 'Rohan Leather Finitures', 1300);

-- column with default value (nullable or other) could be skipped
insert into service (service_id, name) values
    (32, 'Kerr & Reetch Associates');

-- auto-incremented value for pk
insert into service (name) values ('Multiple Oz');

-- using default values for each column
insert into service (name) values (DEFAULT);

-- insert relying on column definition on table
insert into service values
    (33, 'Rainydays Carwash', null);
