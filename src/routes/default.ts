const service = require('../services/default_service.ts')

module.exports = (router) => {
    router.get('/app/default', (req,res) => service.getDefault(req,res));
    return router;
};