package com.cursos.dao.taller;

import com.cursos.model.AlumnoTallerModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 17/09/2014.
 */
public class AlumnoTallerDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public AlumnoTallerModel getAlumnoTallerModel(AlumnoTallerModel alumnoTallerModel) throws Exception{
        return (AlumnoTallerModel)sessionFactory.getCurrentSession().get(alumnoTallerModel.getClass(), alumnoTallerModel.getId());
    }

    public void updateAlumnoTallerModel(AlumnoTallerModel alumnoTallerModel) {
        sessionFactory.getCurrentSession().update(alumnoTallerModel);
    }

    public Integer getContadorAllTalleresByUser(int idUsuario)throws Exception{
        try {
            int list = ((Long) getSessionFactory().getCurrentSession()
                    .createQuery("select count (*) from AlumnoTallerModel where alumnoModel.userModel.id =:idUsuario")
                    .setParameter("idUsuario", idUsuario)
                    .uniqueResult()).intValue();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<AlumnoTallerModel> getAllTalleresByUser(int idUsuario) throws Exception{

        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel where alumnoModel.userModel.id =:idUsuario")
                    .setParameter("idUsuario", idUsuario);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<AlumnoTallerModel> getAllTalleresAllUsuarios() {
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel");
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }
}
