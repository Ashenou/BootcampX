-- Get the total number of assignments for each day of bootcamp.

SELECT day, count(*) as total_assignments 
FROM assignments
GROUP BY day
ORDER BY day;


-- The same query as before, but only return rows where total assignments is greater than or equal to 10.

SELECT day, COUNT(*) AS Total_assignments
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
Order by day ASC;


-- Get all cohorts with 18 or more students.

SELECT cohorts.name,COUNT(students.cohort_id) AS student_count
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING COUNT(students.cohort_id) >= 18
ORDER BY student_count ASC;

-- Get the total number of assignment submissions for each cohort.

SELECT cohorts.name,COUNT(assignment_submissions.*) AS total_submissions 
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;


-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.

SELECT students.name as student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignments.id = assignment_id
WHERE end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;