const express = require('express');
const router = express.Router();
const service = require('../services/default_service')

router.get('/app/default', (req,res) => service.getDefault(req,res));

module.exports = router;