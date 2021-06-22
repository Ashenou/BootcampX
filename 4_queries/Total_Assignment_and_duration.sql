SELECT day,COUNT(id) as number_of_assignments ,SUM(duration) asduration 
FROM assignments
GROUP BY day
ORDER BY day;