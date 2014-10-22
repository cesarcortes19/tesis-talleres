package com.cursos.dao.contacto;

import com.cursos.model.ContactoModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Christian on 19/10/2014.
 */
public class ContactoDao {
    private SessionFactory sessionFactory;

    public List<ContactoModel> getContactos(){
        try {
            List list = getSessionFactory().getCurrentSession().createQuery("from ContactoModel").list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            return new ArrayList<ContactoModel>();
        }
    }

    public void updateContacto(ContactoModel contactoModel) {
        try {
            getSessionFactory().getCurrentSession().update(contactoModel);
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
        }

    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
