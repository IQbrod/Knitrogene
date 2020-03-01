var winston = require('winston');
require('winston-daily-rotate-file');

var logger = winston.createLogger({
    transports: [
      new (winston.transports.DailyRotateFile) ({
        level: 'verbose',
        datePattern: 'YYYY-MM-DD',
        zippedArchive: true,
        filename: 'app-%DATE%.log',
        dirname: './logs',
        maxSize: '10m',
        maxFiles: '28',
        handleExceptions: true
      }),
      new (winston.transports.DailyRotateFile)({
        level: 'error',
        datePattern: 'YYYY-MM-DD',
        zippedArchive: true,
        filename: 'err-%DATE%.log',
        dirname: './logs',
        maxSize: '100m',
        maxFiles: '28',
        handleExceptions: true
      })
    ],
    exitOnError: false
});

logger.stream = {
    write: function(message, encoding) {
        logger.verbose(message.substring(0,message.lastIndexOf('\n')));
    }
};

module.exports = logger;