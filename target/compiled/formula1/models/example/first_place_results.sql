with first_place_winners as (
    select year, races.name, races.round, drivers.surname, drivers.forename, grid, position, points, laps, results.time, fastestLapTime, fastestLapSpeed, fastestLap
    from `armin-playground`.`formula1`.`results` as results
    inner join `armin-playground`.`formula1`.`drivers` as drivers on results.driverId = drivers.driverId
    inner join `armin-playground`.`formula1`.`races` as races on results.raceId = races.raceId
    where position = 1
    order by year DESC, round ASC
)

select * from first_place_winners