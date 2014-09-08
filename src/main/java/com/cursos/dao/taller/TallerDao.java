package com.cursos.dao.taller;

import com.cursos.model.TallerModel;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Cesar on 03/08/2014.
 */
public class TallerDao {
    private SessionFactory sessionFactory;

    public TallerModel getTallerById(int id) throws Exception{

        //return (CountryModel)getSessionFactory().getCurrentSession().get(CountryModel.class, id);
        try {
            return (TallerModel) getSessionFactory().getCurrentSession()
                    .createQuery("from TallerModel where id=?")
                    .setParameter(0, id).uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            throw e;
        }
    }

    public void saveTaller(TallerModel tallerModel) {

        try {
            getSessionFactory().getCurrentSession().save(tallerModel);
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
        }

    }

    public void updateTaller(TallerModel tallerModel) {
        try {
            getSessionFactory().getCurrentSession().update(tallerModel);
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
        }

    }

    public List<TallerModel> getTallers() {

        try {
            List list = getSessionFactory().getCurrentSession().createQuery("from TallerModel").list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            return new ArrayList<TallerModel>();
        }
    }

    public void eliminarTaller(TallerModel tallerModel) {
        try {
            getSessionFactory().getCurrentSession().delete(tallerModel);
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

    public List<TallerModel> getTalleresNoInscritos(int idRepresentado) {
        try {
            List list = getSessionFactory().getCurrentSession().createQuery("from TallerModel where id not in ").list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            return new ArrayList<TallerModel>();
        }
    }
}
