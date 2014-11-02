package com.cursos.dao.sistema;

import com.cursos.model.ConfiguracionModel;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 27/10/2014.
 */
public class SistemaDao {
    private SessionFactory sessionFactory;

    public ConfiguracionModel getConfigurationModel(){
        List<ConfiguracionModel> configuracionModels =
                sessionFactory.getCurrentSession().createQuery("from ConfiguracionModel").list();
        return configuracionModels==null?null:configuracionModels.get(0);
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}
