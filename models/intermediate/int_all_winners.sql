{{ config(schema='formula1') }}

with

races as (
    select * from {{ ref('stg_formula1__races') }}
),

drivers as (
    select * from {{ ref('stg_formula1__drivers') }}
),

results as (
    select * from {{ ref('stg_formula1__results') }}
),

races_drivers_results_joined as (
    select
        year,
        name as circuit_name,
        CONCAT(surname, ' ', forename) as driver_name,
        round,
        grid,
        position,
        points,
        laps,
        time,
        fastestLapTime,
        fastestLapSpeed,
        fastestLap
    from
        results
        inner join drivers on results.driverId = drivers.driverId
        inner join races on results.raceId = races.raceId
    where
        position = 1
    order by
        year DESC,
        round ASC
)

select * from races_drivers_results_joined