const express = require('express');

const mysql = require('mysql');

const app = express();

app.use(express.json());

// Configurar a conexão com o banco de dados

const db = mysql.createConnection({

host: 'your_mysql_host',

user: 'your_mysql_user',

password: 'your_mysql_password',

database: 'your_mysql_db'

});

// Conectar ao banco de dados

db.connect((err) => {

if (err) {

console.error('Erro ao conectar ao banco de dados:', err);

return;

}

console.log('Conectado ao banco de dados.');

});

// Endpoint para inserir uma nova senha

app.post('/passwords', (req, res) => {

const { password } = req.body;

const query = `INSERT INTO passwords (password, created_at) VALUES (?, NOW())`;

 

db.query(query, [password], (err, result) => {

if (err) {

return res.status(500).send('Erro ao inserir a senha.');

}

res.send('Senha inserida com sucesso, Arthur Santos!');

});

});

// Endpoint para listar todas as senhas

app.get('/passwords', (req, res) => {

const query = `SELECT * FROM passwords`;

 

db.query(query, (err, results) => {

if (err) {

return res.status(500).send('Erro ao recuperar as senhas.');

}

res.json(results);

});

});

// Iniciar o servidor na porta 3000

app.listen(3000, () => {

console.log('API rodando na porta 3000');

});
