

  create or replace view `armin-playground`.`formula1`.`stg_formula1__drivers`
  OPTIONS()
  as with

source_drivers as (
    select * from `armin-playground`.`formula1`.`drivers`
), 

stg_drivers as (
    select driverId, forename, surname from source_drivers
)

select * from stg_drivers;

