{{ config(schema='formula1') }}

with

source_races as (
    select * from {{ source('formula1', 'races') }}
),

stg_races as(
    select raceId, year, name, round from source_races
)

select * from stg_races