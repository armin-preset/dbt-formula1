

  create or replace view `armin-playground`.`formula1`.`stg_formula1__races`
  OPTIONS()
  as with

source_races as (
    select * from `armin-playground`.`formula1`.`races`
),

stg_races as(
    select raceId, year, name, round from source_races
)

select * from stg_races;

