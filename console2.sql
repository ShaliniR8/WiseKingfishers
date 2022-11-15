-- Separate beats by "side". All beats < 1000 will be considered south.
drop table if exists data_area_beat;
create temp table data_area_beat as (select name from data_area where area_type='beat');
ALTER TABLE data_area_beat
ALTER COLUMN name TYPE integer using name::integer;
select name,  pg_typeof(name) from data_area_beat;

alter table data_area_beat add column side text;
update data_area_beat set side='south' where name<1000;
update data_area_beat set side='north' where name>1000;

-- all trr related tables
select * from trr_trr
         where id is not null
           and beat is not null;

select * from trr_actionresponse;

select * from trr_weapondischarge;

select * from trr_charge;

select * from trr_subjectweapon;