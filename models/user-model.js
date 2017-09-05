 'use strict';

 const conn = require('./model');

 class UserModel {
     getAll(cb) {
        conn.query('SELECT * FROM user', cb);
     }

     getOne(email, cb) {
         conn.query('SELECT * FROM user WHERE email = ?', email, cb);
     }

     save(data, cb) {
         conn.query('SELECT * FROM user WHERE email = ?', data.email, (err, rows) => {
            console.log(`Numero de registros: ${rows.length}`);
            if(!err) {
                return ( rows.length == 1 )
                ? conn.query('UPDATE user SET ? WHERE email = ?', [data, data.email], cb)
                : conn.query('INSERT INTO user SET ?', data, cb);
            }
         });
     }

     delete(email, cb) {
        conn.query('DELETE FROM user WHERE email = ?', email, cb); 
     }
 }

 module.exports = UserModel;