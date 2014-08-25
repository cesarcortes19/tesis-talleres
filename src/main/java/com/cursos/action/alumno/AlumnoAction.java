package com.cursos.action.alumno;

import com.cursos.service.alumno.AlumnoService;

/**
 * Created by Cesar on 17/08/2014.
 */
public class AlumnoAction {
    private AlumnoService alumnoService;


    public void setAlumnoService(AlumnoService alumnoService) {
        this.alumnoService = alumnoService;
    }

    public AlumnoService getAlumnoService() {
        return alumnoService;
    }
}
