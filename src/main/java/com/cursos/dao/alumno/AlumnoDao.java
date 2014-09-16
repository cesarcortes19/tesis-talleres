package com.cursos.dao.alumno;

import com.cursos.model.AlumnoModel;
import org.hibernate.SessionFactory;

/**
 * Created by Cesar on 17/08/2014.
 */
public class AlumnoDao {
    private SessionFactory sessionFactory;

    public AlumnoModel getAlumnoById(int id){
        return (AlumnoModel)sessionFactory.getCurrentSession().get(AlumnoModel.class,id);
    }

    public void updateAlumno(AlumnoModel alumnoModel) throws Exception{
         sessionFactory.getCurrentSession().update(alumnoModel);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
