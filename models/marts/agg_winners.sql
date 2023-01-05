with

winners as (
    select CONCAT(forename, " ", surname) as full_name, 
           COUNT(position) as total_wins,
           SUM(points) as total_points,
           SUM(laps) as total_laps,
    from {{ ref('int_all_winners') }}
    group by full_name
    order by total_wins DESC
),

winners_with_rank as (
    select *, RANK() OVER( ORDER BY total_wins DESC ) as rank
    from winners
)

select * from winners_with_rank