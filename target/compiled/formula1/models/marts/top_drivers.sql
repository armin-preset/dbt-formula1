with

races as (
    select * from `armin-playground`.`formula1`.`stg_formula1__races`
),

drivers as (
    select * from `armin-playground`.`formula1`.`stg_formula1__drivers`
),

results as (
    select * from `armin-playground`.`formula1`.`stg_formula1__results`
),

races_drivers_results_joined as (
    select year, name, round, surname, forename, grid, position, points, laps, time, fastestLapTime, fastestLapSpeed, fastestLap
    from results
    inner join drivers on results.driverId = drivers.driverId
    inner join races on results.raceId = races.raceId
    where position = 1
    order by year DESC, round ASC
)

select * from races_drivers_results_joined