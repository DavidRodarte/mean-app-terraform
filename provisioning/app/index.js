const MongoClient = require('mongodb').MongoClient;
const express = require('express');

const app = express();
const port = 3000;

const uri = "mongodb://superadmin:root1234@3.87.101.114:27017/test_db";

const client = new MongoClient(uri);

async function run() {
  try {
    const database = client.db('test_db');
    const todo = database.collection('todo');
    const doc = {title: "Tarea 1", description: "Prueba de conexion con servidor MongoDB"}
    const result = await todo.insertOne(doc)
    console.log(result);
  } finally {
    await client.close();
  }
}

run().catch(console.dir);

app.get('/', (req, res) => {
  run().catch(console.dir);
  res.send('Hello, World!');  

});

app.listen(port, () => {
  console.log(`Server listening  
 on port ${port}`);
});
