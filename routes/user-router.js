'use strict';

const UserController = require('../controllers/user-controller'),
      express = require('express'),
      router = express.Router(),
      uc = new UserController();

router 
    .get('/', uc.getAll)
    .get('/agregar', uc.addForm)
    .post('/', uc.save)
    .get('/editar/:email', uc.getOne)
    .put('/actualizar/:email', uc.save)
    .delete('/eliminar/:email', uc.delete)
    .use( uc.error404 );

module.exports = router;