drop table if exists data_area_beat;
create temp table data_area_beat as (select name from data_area where area_type='beat');
ALTER TABLE data_area_beat
    ALTER COLUMN name TYPE integer using name::integer;
alter table data_area_beat add column side text;
update data_area_beat set side='south' where name<1000;
update data_area_beat set side='north' where name>1000;

select * from data_area_beat