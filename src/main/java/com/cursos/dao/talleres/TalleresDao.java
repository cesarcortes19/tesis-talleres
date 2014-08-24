package com.cursos.dao.talleres;

import com.cursos.model.TalleresModel;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Cesar on 03/08/2014.
 */
public class TalleresDao {
    private SessionFactory sessionFactory;

    public TalleresModel getTalleresById(int id) {

        //return (CountryModel)getSessionFactory().getCurrentSession().get(CountryModel.class, id);
        try {
            return (TalleresModel) getSessionFactory().getCurrentSession()
                    .createQuery("from TalleresModel where idCountry=?")
                    .setParameter(0, id).uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            return null;
        }
    }

    public void saveTalleres(TalleresModel talleresModel) {

        try {
            getSessionFactory().getCurrentSession().save(talleresModel);
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
        }

    }

    public void updateTalleres(TalleresModel talleresModel) {

        try {
            getSessionFactory().getCurrentSession().update(talleresModel);
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
        }

    }

    public List<TalleresModel> getTalleress() {

        try {
            List list = getSessionFactory().getCurrentSession().createQuery("from TalleresModel").list();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();  //To change body of catch countryment use File | Settings | File Templates.
            return new ArrayList<TalleresModel>();
        }
    }


    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
