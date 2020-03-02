const express = require('express');
const bodyparser = require('body-parser');
const logger = require('./util/logger');
const morgan = require('morgan');

// Define server and port
const app = express();;
const port = 3200;

//Define logger
app.use(morgan(':date :method :status :url :response-time ms', { stream: logger.stream }));

//HTTP Request body parser
app.use(bodyparser.urlencoded({extended: false}));

// Define routes used by the server
const router = express.Router();
const default_route = require('./routes/default.ts')(router);
app.use(default_route);

// Start server
app.listen(port, _ => logger.info("Server listening port " + port + " ..."));