package com.cursos.dao.reporte;

import com.cursos.model.AlumnoModel;
import com.cursos.model.AlumnoTallerModel;
import org.hibernate.SessionFactory;

import java.util.List;

/**
 * Created by Cesar on 26/10/2014.
 */
public class ReporteDao {
    private SessionFactory sessionFactory;

    /*taller*/
    public List<AlumnoTallerModel> getAlumnos(int idTaller) {
        return getSessionFactory().getCurrentSession()
                .createQuery("from AlumnoTallerModel where tallerModel.id=:idTaller")
                .setParameter("idTaller", idTaller).list();
    }

    /*taller grado*/
    public List<AlumnoTallerModel> getAlumnos(int idTaller, String grado) {
        return getSessionFactory().getCurrentSession()
                .createQuery("from AlumnoTallerModel where tallerModel.id=:idTaller and alumnoModel.grado=:grado")
                .setParameter("idTaller", idTaller)
                .setParameter("grado", grado)
                .list();
    }

    /*taller grado seccion*/
    public List<AlumnoTallerModel> getAlumnos(int idTaller, String grado, String seccion) {
        return getSessionFactory().getCurrentSession()
                .createQuery("from AlumnoTallerModel where " +
                        "tallerModel.id=:idTaller and alumnoModel.grado=:grado and  alumnoModel.seccion=:seccion")
                .setParameter("idTaller", idTaller)
                .setParameter("grado", grado)
                .setParameter("seccion", seccion)
                .list();
    }

    /*seccion grado*/
    public List<AlumnoTallerModel> getAlumnos(String grado, String seccion) {
        return getSessionFactory().getCurrentSession()
                .createQuery("from AlumnoTallerModel where " +
                        "alumnoModel.grado=:grado and  alumnoModel.seccion=:seccion")
                .setParameter("grado", grado)
                .setParameter("seccion", seccion)
                .list();
    }

/*grado*/

    public List<AlumnoTallerModel> getAlumnos(String grado) {
        return getSessionFactory().getCurrentSession()
                .createQuery("from AlumnoTallerModel where " +
                        "alumnoModel.grado=:grado")
                .setParameter("grado", grado)
                .list();
    }


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
