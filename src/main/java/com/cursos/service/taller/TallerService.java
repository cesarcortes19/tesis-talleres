package com.cursos.service.taller;

import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.dao.taller.AlumnoTallerDao;
import com.cursos.dao.taller.TallerDao;
import com.cursos.excepciones.TallerMaximaCapacidadException;
import com.cursos.model.AlumnoModel;
import com.cursos.model.AlumnoTallerModel;
import com.cursos.model.TallerModel;
import org.springframework.transaction.annotation.Transactional;


import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Cesar on 03/08/2014.
 */
@Transactional
public class TallerService {


    private TallerDao tallerDao;
    private AlumnoDao alumnoDao;
    private AlumnoTallerDao alumnoTallerDao;

    public void setTallerDao(TallerDao tallerDao) {
        this.tallerDao = tallerDao;
    }

    public TallerDao getTallerDao() {
        return tallerDao;
    }


    public List<TallerModel> getAllTaller() throws Exception{
        return tallerDao.getTallers();
    }

    public TallerModel getTallerById(Integer id) throws Exception {
        return tallerDao.getTallerById(id);
    }


    public void guardarTaller(TallerModel tallerModel){
        tallerDao.saveTaller(tallerModel);
    }

    public void eliminarTaller(TallerModel tallerModel) throws Exception {
        tallerModel = getTallerById(tallerModel.getId());
        tallerDao.eliminarTaller(tallerModel);
    }

    public void updateTaller(TallerModel tallerModel) {
        tallerDao.updateTaller(tallerModel);
    }

    public List<TallerModel> getTalleresNoInscritos(AlumnoModel alumnoModel) throws Exception{
        alumnoModel = alumnoDao.getAlumnoById(alumnoModel.getId());
        List<Integer> listIdsTalleres = new LinkedList<Integer>();
        listIdsTalleres.add(0);
        for(AlumnoTallerModel tm: alumnoModel.getAlumnoTallerModelSet()){

            listIdsTalleres.add(tm.getTallerModel().getId());
        }
        return tallerDao.getTalleresNoInscritos(alumnoModel,listIdsTalleres);
    }

    public void setAlumnoDao(AlumnoDao alumnoDao) {
        this.alumnoDao = alumnoDao;
    }

    public AlumnoDao getAlumnoDao() {
        return alumnoDao;
    }

    public void realizarInscripcion(int idAlumno, int idTaller) throws Exception{

        TallerModel tallerModel = getTallerById(idTaller);
        if(tallerModel.getCantidadAlumnosactual() >= tallerModel.getCantidadAlumnosMaxima()){
            throw new TallerMaximaCapacidadException(tallerModel.getName());
        }
        tallerModel.setCantidadAlumnosactual(tallerModel.getCantidadAlumnosactual() + 1);
        AlumnoModel alumnoModel = alumnoDao.getAlumnoById(idAlumno);
        AlumnoTallerModel alumnoTallerModel = new AlumnoTallerModel(tallerModel,alumnoModel);
        alumnoModel.getAlumnoTallerModelSet().add(alumnoTallerModel);
        //tallerModel.getAlumnoModelSet().add(alumnoModel);
        alumnoDao.updateAlumno(alumnoModel);
        tallerDao.updateTaller(tallerModel);
    }

    public void realizarDesinscripcion(AlumnoTallerModel alumnoTallerModel) throws Exception{
        Date utilDate = new Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        alumnoTallerModel = alumnoTallerDao.getAlumnoTallerModel(alumnoTallerModel);
        alumnoTallerModel.setFechaDesinscripcion(sqlDate);
        alumnoTallerDao.updateAlumnoTallerModel(alumnoTallerModel);
    }

    public Integer getContadorAllTalleresByUser(int idUsuario)throws Exception{
        return alumnoTallerDao.getContadorAllTalleresByUser(idUsuario);

    }

    public void setAlumnoTallerDao(AlumnoTallerDao alumnoTallerDao) {
        this.alumnoTallerDao = alumnoTallerDao;
    }

    public AlumnoTallerDao getAlumnoTallerDao() {
        return alumnoTallerDao;
    }


    public List<AlumnoTallerModel> getAllTalleresByUser(Integer id) throws Exception{
        return alumnoTallerDao.getAllTalleresByUser(id);
    }
}
