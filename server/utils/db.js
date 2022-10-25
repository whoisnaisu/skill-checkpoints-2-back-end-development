import * as pg from "pg";
const { Pool } = pg.default;

const pool = new Pool({
  user: "postgres",
  host: "localhost",
  database: "skillcheckpoints2",
  password: "1999.8/",
  port: 5432,
});

export { pool };
