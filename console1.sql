-- Separate beats by "side". All beats < 1000 will be considered south.
drop table if exists data_area_beat;
create temp table data_area_beat as (select name from data_area where area_type='beat');
ALTER TABLE data_area_beat
ALTER COLUMN name TYPE integer using name::integer;
alter table data_area_beat add column side text;
update data_area_beat set side='south' where name<1000;
update data_area_beat set side='north' where name>1000;

select * from data_area_beat;
select * from trr_trr
         where id is not null
           and beat is not null;


-- -- trr_trr
-- select id, beat, trr_datetime, officer_assigned_beat, officer_on_duty, officer_in_uniform, officer_rank as rank_during_trr, officer_id from trr_trr
--          where id is not null
--            and beat is not null;

-- relevant officer information

-- officer history

-- officer badge number

-- did officer receive award?

-- award details

-- salary