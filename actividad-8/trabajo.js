const express = require('express');
const mongoose = require('mongoose');

mongoose.connect("mongodb+srv://juanhoyos0422:juan123456789@actividad8.wribw0o.mongodb.net/");
const db = mongoose.connection;

db.on('error', (error) => console.error(error));
db.once('open', function () {
  console.log('Conectado a la base de datos');


  // Definir el esquema para empresas
  const personasSchema = new mongoose.Schema({
    nombre: String,
    apellidos: String
  });

  // Definir el modelo para empresas
  const personas = mongoose.model("personas", personasSchema);

  const app = express();
  app.use(express.json());

  // Endpoint para obtener todos los usuarios
  app.get("/api/personas", async (req, res) => {
    const persona = await personas.find();
    res.json(persona);
  });

  //Obtener todos los usuarios que sean mayores de 18 años.

  app.get("/api/personas/age18", async (req, res) => {
    const ejercicio1 = await personas.find({ edad: { $gte: 18 } });
    res.json(ejercicio1);
  });

  //Obtener todos los usuarios que sean de Londres o de París.

  app.get("/api/personas/amor", async (req, res) => {
    const ejercicio2 = await personas.find({ ciudad: { $in: ["Londres", "París"] } });
    res.json(ejercicio2);
  });

  //Obtener a todos los usuarios que ganen más de $2000 al mes y tengan menos de 30 años.

  app.get("/api/personas/salario", async (req, res) => {
    const ejercicio3 = await personas.find({ salario: { $gte: 2000 }, edad: { $lt: 30 } });
    res.json(ejercicio3);
  });

  //Obtener a todos los usuarios que sean de España y ganen más de $3000 al mes.

  app.get("/api/personas/españa", async (req, res) => {
    const ejercicio4 = await personas.find({ ciudad: "españa", salario: { $gte: 3000 } });
    res.json(ejercicio4);
  });

  //Obtener todos los usuarios que tengan entre 25 y 35 años.

  app.get("/api/personas/edad", async (req, res) => {
    const ejercicio5 = await personas.find({ edad: { $gte: 25, $lte: 35 } });
    res.json(ejercicio5);
  });

  //Obtener a todos los usuarios que no sean de Estados Unidos.

  app.get("/api/personas/estados", async (req, res) => {
    const ejercicio6 = await personas.find({ pais: { $ne: "Estados Unidos" } });
    res.json(ejercicio6);
  });

  //Obtener a todos los usuarios que sean de Londres y que ganen más de $65000 o que tengan más de 30 años.

  app.get("/api/personas/londres", async (req, res) => {
    const ejercicio7 = await personas.find({ ciudad: "Londres", salario: { $gte: 65000 }, edad: { $gte: 30 } });
    res.json(ejercicio7);
  });

  //Obtener a todos los usuarios que sean de Australia y tengan un peso mayor a 140 libras.

  app.get("/api/personas/australia", async (req, res) => {
    const ejercicio8 = await personas.find({ ciudad: "Australia", peso: { $gte: 140 } });
    res.json(ejercicio8);
  });

  // Obtener a todos los usuarios que no sean de Londres ni de París.

  app.get("/api/personas/paris", async (req, res) => {
    const ejercicio9 = await personas.find({ ciudad: { $nin: ["Londres", "París"] } });
    res.json(ejercicio9);
  });

  // Obtener a todos los usuarios que ganen menos de $3000 al mes o que tengan más de 40 años.

  app.get("/api/personas/salario", async (req, res) => {
    const ejercicio10 = await personas.find({ $or: [{ salario: { $lt: 3000 } }, { edad: { $gte: 40 } }] });
    res.json(ejercicio10);
  });

  //  Obtener a todos los usuarios que sean de Canadá y ganen más de $2000 al mes o que tengan una altura mayor a 180 cm.

  app.get("/api/personas/canada", async (req, res) => {
    const ejercicio11 = await personas.find({ ciudad: "Canada", $or: [{ salario: { $gte: 2000 } }, { altura: { $gte: 180 } }] });
    res.json(ejercicio11);
  });

  //  Obtener todos los usuarios que sean de Italia y tengan entre 20 y 30 años.

  app.get("/api/personas/italia", async (req, res) => {
    const ejercicio12 = await personas.find({ ciudad: "Italia", edad: { $gte: 20, $lte: 30 } });
    res.json(ejercicio12);
  });

  //Obtener todos los usuarios que no tengan un correo electrónico registrado.

  app.get("/api/personas/correo", async (req, res) => {
    const ejercicio13 = await personas.find({ correo: { $exists: false } });
    res.json(ejercicio13);
  });

  //Obtener todos los usuarios que sean de Francia y que su salario esté entre $70000 y $80000 al mes.

  app.get("/api/personas/francia", async (req, res) => {
    const ejercicio14 = await personas.find({ ciudad: "Francia", $and: [{ salario: { $gte: 70000, $lte: 80000 } }] });
    res.json(ejercicio14);
  });

  // Obtener todos los usuarios que sean de Brasil y que tengan un peso menor a 120 libras o más de 140 libras.

  app.get("/api/personas/brasil", async (req, res) => {
    const ejercicio15 = await personas.find({ ciudad: "Brasil", $or: [{ peso: { $lt: 120 } }, { peso: { $gte: 140 } }] });
    res.json(ejercicio15);
  });

  //Obtener todos los usuarios que sean de Argentina o de Chile y que tengan una edad menor a 25 años.

  app.get("/api/personas/argentina", async (req, res) => {
    const ejercicio16 = await personas.find({ $or: [{ ciudad: "Argentina" }, { ciudad: "Chile" }] });
    res.json(ejercicio16);
  });

  //Obtener a todos los usuarios que no sean de España ni de México y que ganen menos de $70000 al mes.

  app.get("/api/personas/eeuu", async (req, res) => {
    const ejercicio17 = await personas.find({ $and: [{ ciudad: { $nin: ["EEUU", "Mexico"] } }, { salario: { $lt: 70000 } }] });
    res.json(ejercicio17);
  });

  //Obtener todos los usuarios que sean de Alemania y que tengan un salario menor a $5000 o una edad mayor a 35 años.

  app.get("/api/personas/alemania", async (req, res) => {
    const ejercicio18 = await personas.find({ ciudad: "Alemania", $or: [{ salario: { $lt: 5000 } }, { edad: { $gte: 35 } }] });
    res.json(ejercicio18);
  });

  //Obtener todos los usuarios que no sean de Colombia y que su altura sea menor a 170 cm.

  app.get("/api/personas/colombia", async (req, res) => {
    const ejercicio19 = await personas.find({ ciudad: "Colombia", altura: { $lt: 170 } });
    res.json(ejercicio19);
  });

  //Obtener todos los usuarios que sean de India y que no tengan un salario registrado.

  app.get("/api/personas/india", async (req, res) => {
    const ejercicio20 = await personas.find({ ciudad: "India", $or: [{ salario: { $exists: false } }] });
    res.json(ejercicio20);
  });


  app.listen(3000, function () {
    console.log("Server listening on port 3000");
  });
});