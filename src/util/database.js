const mysql = require('mysql');
const constants = require('../constants/secret');

const conn = mysql.createPool({
    host: constants.DB_HOST,
    user: constants.DB_USERNAME,
    password: constants.DB_PASSWORD,
    database: constants.DB_NAME,
    connectionLimit: 10
});

module.exports = conn;