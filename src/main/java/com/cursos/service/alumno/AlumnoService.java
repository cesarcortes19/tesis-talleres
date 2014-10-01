package com.cursos.service.alumno;

import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.model.AlumnoModel;
import com.cursos.model.TallerModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Cesar on 17/08/2014.
 */
@Transactional
public class AlumnoService {
    private AlumnoDao alumnoDao;

    public void updateAlumno(AlumnoModel alumnoModel) throws Exception {
        alumnoDao.updateAlumno(alumnoModel);
    }

    public AlumnoModel getAlumnoById(int id) throws Exception{
        return alumnoDao.getAlumnoById(id);
    }
    public List<AlumnoModel> getAlumnoByIdRepresentante(int id) throws Exception{
        return alumnoDao.getAlumnoByIdRepresentante(id);
    }

    public void setAlumnoDao(AlumnoDao alumnoDao) {
        this.alumnoDao = alumnoDao;
    }

    public AlumnoDao getAlumnoDao() {
        return alumnoDao;
    }
}
