package com.cursos.dao.sistema;

import org.hibernate.SessionFactory;

/**
 * Created by Cesar on 27/10/2014.
 */
public class SistemaDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
