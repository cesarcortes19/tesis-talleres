package com.cursos.dao.usuario;

import org.hibernate.SessionFactory;

/**
 * Created by Cesar on 12/08/2014.
 */
public class UsuarioDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
