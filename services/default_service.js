const conn = require('../util/database');
const logger = require('../util/logger');

exports.getDefault = function(req,res) {
    const query = "SELECT * FROM test;"
    conn.query(query, (err, rows, fields) => {
        if (err) {
            logger.error(err);
            res.sendStatus(500);
        } else {
            res.status(200).send("rows");
        }
    });
}