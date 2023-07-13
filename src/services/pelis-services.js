import config from '../../dbconfig-env.js';
import sql from 'mssql';

class PelisService {

    getById = async (id) => {
        let returnEntity = null;
        console.log('Estoy en: PelisService.getById(id)');
        try {
            let pool   = await sql.connect(config);
            let result = await pool.request()
            .input('pId', sql.Int, id)
            .query('SELECT * FROM seriesPelis WHERE id = @pId');
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }
}