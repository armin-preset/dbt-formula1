{{ config(schema='formula1') }}

with

source_results as (
    select * from {{ source('formula1', 'results') }}
),

stg_results as (
    select driverId, raceId, grid, position, points, laps, time, fastestLapTime, fastestLapSpeed, fastestLap from source_results
)

select * from stg_results