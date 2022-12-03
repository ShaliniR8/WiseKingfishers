drop table if exists officer_trr;
create temp table officer_trr as
    select
        data_officer.id,
        gender,
        race,
        appointed_date,
        rank,
        active,
        birth_year,
        complaint_percentile,
        civilian_allegation_percentile,
        honorable_mention_percentile,
        internal_allegation_percentile,
        allegation_count,
        sustained_count,
        civilian_compliment_count,
        discipline_count,
        honorable_mention_count,
        major_award_count,
        trr_count,
        unsustained_count,
        beat,
        point(point),
        extract(year from trr_datetime) as trr_year
    from data_officer inner join trr_trr tt on data_officer.id = tt.officer_id;

select * from officer_trr;

-- select json(point)  from trr_trr







