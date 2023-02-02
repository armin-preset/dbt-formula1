{{ config(schema='formula1') }}

with

source_drivers as (
    select * from {{ source('formula1', 'drivers') }}
), 

stg_drivers as (
    select driverId, forename, surname from source_drivers
)

select * from stg_drivers