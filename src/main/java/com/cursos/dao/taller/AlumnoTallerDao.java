package com.cursos.dao.taller;

import com.cursos.model.AlumnoModel;
import com.cursos.model.AlumnoTallerModel;
import com.cursos.model.TallerModel;
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

    public AlumnoTallerModel getAlumnoTallerModel(AlumnoTallerModel alumnoTallerModel) throws Exception {
        return (AlumnoTallerModel) sessionFactory.getCurrentSession().get(alumnoTallerModel.getClass(), alumnoTallerModel.getId());
    }

    public void updateAlumnoTallerModel(AlumnoTallerModel alumnoTallerModel) throws Exception {
        sessionFactory.getCurrentSession().update(alumnoTallerModel);
    }

    public Integer getContadorAllTalleresByUser(int idUsuario) throws Exception {
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

    public List<AlumnoTallerModel> getAllTalleresByUser(int idUsuario) throws Exception {

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

    public List<AlumnoTallerModel> getTallerByUserAndTallerId(int idUsuario, int idTaller) throws Exception {

        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel where alumnoModel.userModel.id =:idUsuario and tallerModel.id =: idTaller")
                    .setParameter("idUsuario", idUsuario)
                    .setParameter("idTaller", idTaller);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<AlumnoTallerModel> getAllTalleresAllUsuarios() {
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel order by alumnoModel.userModel.apellido asc ");
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public AlumnoTallerModel getAlumnoTallerByTallerAndAlumno(AlumnoModel alumnoModel, TallerModel tallerModel) throws Exception {
        try {
            return (AlumnoTallerModel) getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel where alumnoModel.id=:idAlumno and tallerModel.id=:idTaller")
                    .setParameter("idAlumno", alumnoModel.getId())
                    .setParameter("idTaller", tallerModel.getId())
                    .uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public AlumnoTallerModel getAlumnoTallerById(AlumnoTallerModel alumnoTallerModel) throws Exception {
        try {
            return (AlumnoTallerModel) getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel where id=:id")
                    .setParameter("id", alumnoTallerModel.getId())
                    .uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public List<AlumnoTallerModel> getAllUserByTallerId(int id) throws Exception {
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from AlumnoTallerModel where tallerModel.id=:id order by alumnoModel.userModel.apellido asc ").setParameter("id", id);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void deleteAlumnoTallerById(int id) throws Exception {
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("DELETE AlumnoTallerModel where alumnoModel.id=:id").setParameter("id", id);
            query.executeUpdate();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public AlumnoTallerModel getAlumnoTallerByTallerAndAlumno(int idAlumno, int idTaller) throws Exception{
        AlumnoModel alumnoModel2 = new AlumnoModel();
        TallerModel tallerModel2 = new TallerModel();
        alumnoModel2.setId(idAlumno);
        tallerModel2.setId(idTaller);
        return getAlumnoTallerByTallerAndAlumno(alumnoModel2,tallerModel2);
    }


    public void borrarTODOS() throws Exception{
        Query query = getSessionFactory().getCurrentSession().
                createQuery("delete from AlumnoTallerModel ");
        query.executeUpdate();
    }
}
