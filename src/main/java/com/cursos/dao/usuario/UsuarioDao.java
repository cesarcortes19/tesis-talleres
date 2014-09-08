package com.cursos.dao.usuario;

import com.cursos.model.UserModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 12/08/2014.
 */
public class UsuarioDao {
    private SessionFactory sessionFactory;


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<UserModel> getAll(Integer from, Integer to) throws Exception {
        try {
            Query query = getSessionFactory().getCurrentSession().
                    createQuery("from UserModel");
            if (from == null) {
                from = 0;
            }
            query.setFirstResult(from);
            if (to != null) {
                query.setMaxResults(to);
            }
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public int getContador() throws Exception {
        try {
            int list = ((Long) getSessionFactory().getCurrentSession()
                    .createQuery("select count (*) from UserModel ")
                    .uniqueResult()).intValue();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void update(UserModel userModel) throws Exception {
        try {
            getSessionFactory().getCurrentSession().update(userModel);
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void guardar(UserModel userModel) throws Exception  {
        sessionFactory.getCurrentSession().save(userModel);
    }

    public UserModel getUsuarioById(int id) throws Exception{
        try {
            return (UserModel)getSessionFactory().getCurrentSession().get(UserModel.class,id);
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void eliminar(UserModel usuarioModel) throws Exception{
        try {
            getSessionFactory().getCurrentSession().delete(usuarioModel);
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }

    }

    public UserModel getUsuarioByCi(UserModel userModel) throws Exception{
        try {
            return (UserModel)getSessionFactory().getCurrentSession()
                    .createQuery("from UserModel where cedula =:ci")
                    .setParameter("ci",userModel.getCedula())
                    .uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
