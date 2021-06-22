-- Get all cohorts with 18 or more students.

SELECT cohorts.name,COUNT(students.cohort_id) AS student_count
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.cohort_id) >= 18
ORDER BY student_count ASC;