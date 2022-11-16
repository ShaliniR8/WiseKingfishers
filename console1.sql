-- Separate beats by "side". All beats < 1000 will be considered south.
drop table if exists data_area_beat;
create temp table data_area_beat as (select name from data_area where area_type='beat');
ALTER TABLE data_area_beat
ALTER COLUMN name TYPE integer using name::integer;
alter table data_area_beat add column side text;
update data_area_beat set side='south' where name<1000;
update data_area_beat set side='north' where name>1000;

-- convert trr_datetime to year so that we can compute yearly trr count later
drop table if exists trr_side_temp;
create temp table trr_side_temp as
(select
    beat,
    extract(year from trr_datetime) as years
from trr_trr
where id is not null
and beat is not null);

-- add side column
drop table if exists trr_side;
create temp table trr_side as
(select beat, years, side from trr_side_temp
    inner join data_area_beat dab on trr_side_temp.beat = dab.name);


-- number of trrs by year and side;
drop table if exists trr_count_by_year_side;
create temp table trr_count_by_year_side as
    select beat, side, years, count(*) from trr_side group by (beat, side, years);
select * from trr_count_by_year_side;

-- number of trrs by year
drop table if exists trr_count_by_year;
create temp table trr_count_by_year as
    select array_agg(distinct beat), years, count(years) from trr_side group by (years);
select * from trr_count_by_year;




-- relevant officer information

-- officer history

-- officer badge number

-- did officer receive award?

-- award details

-- salary