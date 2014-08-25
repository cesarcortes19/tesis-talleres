package com.cursos.service.alumno;

import com.cursos.dao.alumno.AlumnoDao;

/**
 * Created by Cesar on 17/08/2014.
 */
public class AlumnoService {
    private AlumnoDao alumnoDao;

    public void setAlumnoDao(AlumnoDao alumnoDao) {
        this.alumnoDao = alumnoDao;
    }

    public AlumnoDao getAlumnoDao() {
        return alumnoDao;
    }
}
