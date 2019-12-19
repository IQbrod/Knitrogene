const express = require('express');
const router = express.Router();

router.get('/app/default', (req,res) => res.status(200).send("Hello world"));

module.exports = router;