package com.cursos.util;

import org.apache.commons.beanutils.BeanMap;
import org.hibernate.Hibernate;
import org.hibernate.proxy.HibernateProxy;

import java.util.Iterator;

/**
 * Created by Alejandro Mendez on 09/04/2014.
 */
public class HibernateUtil {

    public static void initializeLazyFields(Object bean) {
        for (Iterator iter = new BeanMap(bean).valueIterator(); iter.hasNext(); ) {
            try {
                Object object = iter.next();
                if (object instanceof HibernateProxy) {
                    Hibernate.initialize(object);
                    initializeLazyFields(((HibernateProxy) object).getHibernateLazyInitializer().getImplementation());
                }
            } catch (Exception ignored) {
                ignored.printStackTrace();
            }
        }
    }

    public static <T> T initializeAndUnproxy(T entity) {
        if (entity == null) {
            return null;
        }

        if (entity instanceof HibernateProxy) {
            Hibernate.initialize(entity);
            entity = (T) ((HibernateProxy) entity).getHibernateLazyInitializer().getImplementation();
        }
        return entity;
    }

}
