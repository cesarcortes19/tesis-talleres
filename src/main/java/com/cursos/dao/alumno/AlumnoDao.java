package com.cursos.dao.alumno;

import org.hibernate.SessionFactory;

/**
 * Created by Cesar on 17/08/2014.
 */
public class AlumnoDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
