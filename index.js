import PjService from "./src/services/pjs-services.js";
import PsService from "./src/services/pelis-services.js";
import  Express  from "express";
const app = Express();
const port = 5000;
const svc1 = new PjService();
const svc2 = new PsService();


app.get('/',async (req,res) =>{
    res.send("pone /personajes para mostrar personajes o /pelis para mostrar las peliculas")
})
//personajes
app.get('/personajes',async (req,res) =>{
    const todosPjs = await svc1.getAll();
    return res.status(200).json(todosPjs);
})
//buscarporidpelicula
app.get('/buscarpersonajeporidpelicula/:id',async (req,res) =>{
    const peliId = await svc1.getById(req.params.id);
    return res.status(200).json(peliId)
});
//buscarpornombre
app.get('/buscarpersonajepornombre/:nombre',async (req,res) =>{
    const personaje = await svc1.getByNombre(req.params.nombre);
    return res.status(200).json(personaje)
});
//buscarporedad
app.get('/buscarpersonajeporedad/:edad',async (req,res) =>{
    const personaje = await svc1.getByedad(req.params.edad);
    return res.status(200).json(personaje)
});
//server
app.listen(port,() =>{
    console.log('ESCUCHANDO PORT 5000')
})
//peliculas
app.get('/movies',async (req,res) =>{
    const peliculasyseries = await svc2.getIdImagenTituloFecha();
    return res.status(200).json(peliculasyseries);
})
//peliculas
app.get('/buscarpelipornombre/:nombre',async (req,res) =>{
    const peliculasyseries = await svc2.getByNombre(req.params.nombre);
    return res.status(200).json(peliculasyseries);
})