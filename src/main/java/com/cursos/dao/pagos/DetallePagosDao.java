package com.cursos.dao.pagos;

import com.cursos.model.DetallePagoModel;
import com.cursos.model.PagosModel;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 14/09/2014.
 */
public class DetallePagosDao {
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void guardar(DetallePagoModel detallePagoModel) throws Exception  {
        sessionFactory.getCurrentSession().save(detallePagoModel);
    }
}
