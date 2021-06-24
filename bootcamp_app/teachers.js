const { Pool } = require("pg");

const pool = new Pool({
  user: "vagrant",
  password: "123",
  host: "localhost",
  database: "bootcampx",
});

pool
  .connect()
  .then(() => {
    console.log("connected :)");
  })
  .catch((e) => {
    console.log("-------- Error -------");
    console.log(e);
  });
const values = [`%${process.argv[2]}%`];
const querystring = `SELECT teachers.name as teacher, cohorts.NAME as cohort
  FROM teachers
  JOIN assistance_requests ON assistance_requests.teacher_id = teachers.id
  JOIN students ON students.id = assistance_requests.student_id
  JOIN cohorts ON students.cohort_id = cohorts.id
  GROUP BY teachers.name,cohorts.NAME
  HAVING cohorts.name Like $1`;

pool.query(querystring, values).then((res) => {
  res.rows.forEach((query) => console.log(`${query.cohort}: ${query.teacher}`));
});
