package com.cursos.dao.cartelera;

import com.cursos.model.NoticiaModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.Date;
import java.util.List;

/**
 * Created by Cesar on 25/08/2014.
 */
public class CarteleraDao {
    private SessionFactory sessionFactory;


    public List<NoticiaModel> getNoticias(Integer from, Integer to) throws Exception{
        try {
            Query query = getSessionFactory().getCurrentSession().
                    createQuery("from NoticiaModel");
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


    public int getContadorNoticias() throws Exception {
        try {
            int list = ((Long) getSessionFactory().getCurrentSession()
                    .createQuery("select count (*) from NoticiaModel ")
                    .uniqueResult()).intValue();
            return list;
        } catch (HibernateException e) {
            e.printStackTrace();
            throw e;
        }
    }



    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void eliminarNoticia(Integer id) throws Exception{
        Query query = getSessionFactory().getCurrentSession().
                createQuery("delete NoticiaModel where id =:idNoticia")
                .setParameter("idNoticia",id);
        query.executeUpdate();
    }

    public void guardar(NoticiaModel noticiaModel) throws Exception{
        noticiaModel.setFechaCreacion(new Date());
        getSessionFactory().getCurrentSession().save(noticiaModel);
    }
}
