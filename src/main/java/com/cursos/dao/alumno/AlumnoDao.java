package com.cursos.dao.alumno;

import com.cursos.model.AlumnoModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 17/08/2014.
 */
public class AlumnoDao {
    private SessionFactory sessionFactory;

    public AlumnoModel getAlumnoById(int id) {
        return (AlumnoModel) sessionFactory.getCurrentSession().get(AlumnoModel.class, id);
    }

    public void updateAlumno(AlumnoModel alumnoModel) throws Exception {
        sessionFactory.getCurrentSession().update(alumnoModel);
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public List<AlumnoModel> getAlumnoByIdRepresentante(int idRepresentante) throws Exception {
        try {
            Query query = getSessionFactory().getCurrentSession().
                    createQuery("from AlumnoModel where userModel.id =:idRepresentante").setParameter("idRepresentante", idRepresentante);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }

    }
}
