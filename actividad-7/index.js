const express = require('express');
const mongoose = require('mongoose');

mongoose.connect("mongodb+srv://juanhoyos0422:juan123456789@actividad8.wribw0o.mongodb.net/");
const db = mongoose.connection;

db.on('error', (error) => console.error(error));
db.once('open', function () {
  console.log('Conectado a la base de datos');

  // Definir el esquema para usuarios
  const userSchema = new mongoose.Schema({
    name: String,
    apellidos: String
  });

  // Definir el modelo para usuarios
  const User = mongoose.model("User", userSchema);

  // Definir el esquema para empresas
  const empresaSchema = new mongoose.Schema({
    nombre: String,
    direccion: String
  });

  // Definir el modelo para empresas
  const Empresa = mongoose.model("Empresa", empresaSchema);

  const app = express();
  app.use(express.json());

  // Endpoint para obtener los 10 primeros usuarios
  app.get("/api/users", async (req, res) => {
    const users = await User.find();
    res.json(users);
  });

  app.get("/api/users/top10", async (req, res) => {
    const users10 = await User.find().limit(10);
    res.json(users10);
  });

  // listado de usuarios que sean de la empresa id 5.
  app.get("/api/users/id5", async (req, res) => {
    const users5 = await User.find({ empresa_id: 5 });
    res.json(users5);
  });

  //listado de usuarios que sean de Bangladesh.
  app.get("/api/users/ciudadbangladesh", async (req, res) => {
    const userscity5 = await User.find({ pais: "Bangladesh" });
    res.json(userscity5);
  });

  //listado de empresas de la ciudad Bangladesh.
  app.get("/api/empresas/citybangladesh", async (req, res) => {
    const empresas5 = await Empresa.find({ pais: "Bangladesh" });
    res.json(empresas5);
  });


  // Endpoint para obtener todas las empresas
  app.get("/api/empresas", async (req, res) => {
    const empresas = await Empresa.find();
    res.json(empresas);
  });

  app.listen(3000, function () {
    console.log("Server listening on port 3000");
  });
});