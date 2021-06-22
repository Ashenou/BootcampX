SELECT teachers.name as teacher, cohorts.NAME as cohort
FROM teachers
JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY teachers.name,cohorts.NAME
HAVING cohorts.name = 'JUL02';
