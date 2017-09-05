'use strict';

const UserModel = require('../models/user-model'),
      um = new UserModel();

class UserController {
    getAll(req, res, next) {
        um.getAll((err, data) => {
            if(!err) {
                res.render('index',  {
                    title: 'Welcome to Valoop',
                    data: data
                });
            }
        });
    }
        
    getOne(req, res, next) {
        let email = req.params.email;
        console.log(email);
        um.getOne(email, (err, data) => {
            if(!err) {
                res.render('edit', {
                    title: 'Edit Contact',
                    data: data
                });
            }
        });
    }

    save(req, res, next) {
        let user = {
            email: (req.body.email || 0),
            nick: req.body.nick,
            name: req.body.name,
            last_name: req.body.last_name,
            password: req.body.password,
        };

        console.log(user);

        um.save(user, (err) => {
            if(!err) {
                res.redirect('/');
            } else {
               return next( new Error('Registro no salvado'));
            }
        });
    }
        
    delete(req, res, next) {
        let email = req.params.email;

        um.delete(email, (err, data) => {
            if(!err) {
                res.redirect('/');
            } else {
                return next(new Error('Registro no encontrado'));
            }
        });
    }

    addForm(req, res, next) {
        res.render('add',  {
            title: 'Agregar user',
        });
    }

    error404(req, res, next) {
        let err = new Error();
        err.status = 404;
        err.statusText = 'NOT FOUND';
        res.render('error', {error: err});
    }
}

module.exports = UserController;