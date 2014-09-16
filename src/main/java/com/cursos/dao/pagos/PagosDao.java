package com.cursos.dao.pagos;

import org.hibernate.SessionFactory;

/**
 * Created by Cesar on 14/09/2014.
 */
public class PagosDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
