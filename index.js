import PjService from "./src/services/pjs-services.js"
import  Express  from "express";
const app = Express();
const port = 5000;
const svc1 = new PjService();

app.get(async (req,res) =>{
    const todosPjs = await svc1.getAll();
    return res.status(200).json(todosPjs);
})