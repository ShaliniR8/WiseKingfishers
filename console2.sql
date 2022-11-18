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
        first_name,
        last_name,
        tags,
        middle_initial,
        suffix_name,
        resignation_date,
        complaint_percentile,
        middle_initial2,
        civilian_allegation_percentile,
        honorable_mention_percentile,
        internal_allegation_percentile,
        trr_percentile,
        allegation_count,
        sustained_count,
        civilian_compliment_count,
        current_badge,
        current_salary,
        discipline_count,
        honorable_mention_count,
        last_unit_id,
        major_award_count,
        trr_count,
        unsustained_count,
        beat,
        extract(year from trr_datetime) as years
    from data_officer inner join trr_trr tt on data_officer.id = tt.officer_id;

select * from officer_trr;
