import config from '../../dbconfig-env.js';
import sql from 'mssql';

class PjService {
    getAll = async () => {
        let returnArray = null;
        console.log('PJService.getAll() funciona?');
        try {
            let pool   = await sql.connect(config);
            let result = await pool.request().query("SELECT * from Pizzas");
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error);
        }
        return returnArray;
    }

    getAllseriesPelis = async () => {
        let returnArray = null;
        console.log('PjServie.getAllseriesPelis() funciona?');
        try {
            let pool   = await sql.connect(config);
            let result = await pool.request().query("SELECT * from seriesPelis");
            returnArray = result.recordsets[0];
        }
        catch (error) {
            console.log(error);
        }
        return returnArray;
    }

    getById = async (id) => {
        let returnEntity = null;
        console.log('PJService.getById(id) funciona?');
        try {
            let pool   = await sql.connect(config);
            let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('SELECT * FROM Personaje WHERE id = @pId');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    insert = async (Personaje) => {
        let rowsAffected = 0;
        console.log('PJService.insert(Personaje) funciona?');

        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
            .input('pImagen', sql.NVarChar, Personaje?.imagen ?? '')
            .input('pNombre', sql.NVarChar, Personaje?.nombre ?? '')
            .input('pEdad', sql.Int , Personaje?.edad ?? 0)
            .input('pPeso', sql.NVarChar , Personaje?.peso ?? '')
            .input('pHistoria', sql.NVarChar   , Personaje?.historia ?? '')
            .input('pPeliculasSeries', sql.NVarChar   , Personaje?.PeliculasSeries ?? '')
            .query(`INSERT INTO Personaje (Imagen, Nombre, Edad, Peso, Historia, PeliculasSeries) VALUES (@pImagen, @pNombre, @pEdad, @pPeso, @pHistoria, @pPeliculasSeries)`);
            rowsAffected = result.rowsAffected;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }

    update = async (Personaje) => {
        let rowsAffected = 0;
        console.log('Estoy en: PjService.update(Personaje)');

        try {
            let pool = await sql.connect(config);
            let result = await pool.request()
                .input('pId', sql.Int, Personaje?.id ?? 0)
                .input('pImagen', sql.NVarChar, Personaje?.imagen ?? '')
                .input('pNombre', sql.NVarChar, Personaje?.nombre ?? '')
                .input('pEdad', sql.Int , Personaje?.edad ?? 0)
                .input('pPeso', sql.NVarChar , Personaje?.peso ?? '')
                .input('pHistoria', sql.NVarChar   , Personaje?.historia ?? '')
                .input('pPeliculasSeries', sql.NVarChar   , Personaje?.PeliculasSeries ?? '')
                .query(`UPDATE Personaje SET Imagen = @pImagen, Nombre = @pNombre, Edad = @pEdad, Peso = @pPeso, Historia = @pHistoria, PeliculasSeries = @pPeliculasSeries WHERE Id=@pId`);
                rowsAffected = result.rowsAffected;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
    
    deleteById = async (id) => {
        let rowsAffected = 0;
        console.log('Estoy en: PJService.deleteById(id)');
        try {
            let pool   = await sql.connect(config);
            let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('DELETE FROM Personaje WHERE id = @pId');
            rowsAffected = result.rowsAffected;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}

export default PjService;

