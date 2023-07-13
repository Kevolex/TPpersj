import PjService from "./src/services/pjs-services.js";
import PsService from "./src/services/pelis-services.js";
import  express  from "express";
const app = express();
import cors from "cors";
const port = 5000;
const svc1 = new PjService();
const svc2 = new PsService();

app.use(express.urlencoded());
app.use(express.json());
app.use(cors());


//server
app.listen(port,() =>{
    console.log('ESCUCHANDO PORT 5000')
})

app.get('/',async (req,res) =>{
    res.send("pone /personajes para mostrar personajes o /pelis para mostrar las peliculas")
})
//personajes
app.get('/personajes',async (req,res) =>{
    const todosPjs = await svc1.getAll();
    return res.status(200).json(todosPjs);
})
//pelis
app.get('/pelis',async (req,res) =>{
    const todosPs = await svc2.getAll();
    return res.status(200).json(todosPs);
})
//buscarporidpelicula
app.get('/pelis/:id',async (req,res) =>{
    const peliId = await svc2.getById(req.params.id);
    return res.status(200).json(peliId)
});
//buscarpornombre
app.get('/buscarpersonajepornombre/:nombre',async (req,res) =>{
    const personaje = await svc1.getByNombre(req.params.nombre);
    return res.status(200).json(personaje)
});
//buscarporedad
app.get('/personajes/:edad',async (req,res) =>{
    const PjEdad = await svc1.getByEdad(req.params.edad);
    return res.status(200).json(PjEdad)
});