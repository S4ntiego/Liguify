const { Pool } = require("pg");

const pool = new Pool();

module.exports = {
  query: (name, text, params) => pool.query(name, text, params),
};
