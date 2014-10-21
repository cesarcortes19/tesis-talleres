package com.cursos.dao.pagos;

import com.cursos.model.AlumnoModel;
import com.cursos.model.PagosModel;
import com.cursos.model.TallerModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

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

    public List<PagosModel> getHistorialPagosAllUsuarios() throws Exception {
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from PagosModel order by fechaPago desc ");
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void guardar(PagosModel pagosModel) throws Exception  {
        sessionFactory.getCurrentSession().save(pagosModel);
    }

    public List<PagosModel> getHistorialPagosByUsuario(int id) throws Exception{
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from PagosModel where userModel.id=:id order by fechaPago desc ").setParameter("id",id);
            return query.list();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public PagosModel getPagoById(int id) throws Exception{
        try {
            Query query = getSessionFactory().getCurrentSession()
                    .createQuery("from PagosModel where id=:id").setParameter("id",id);
            return (PagosModel) query.uniqueResult();
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void actualizar(PagosModel pagosModel) throws Exception{
        try {
            getSessionFactory().getCurrentSession().update(pagosModel);
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }


}
