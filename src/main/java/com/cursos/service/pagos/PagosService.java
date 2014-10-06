package com.cursos.service.pagos;

import com.cursos.ViewNames;
import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.dao.pagos.PagosDao;
import com.cursos.dao.taller.AlumnoTallerDao;
import com.cursos.dao.taller.TallerDao;
import com.cursos.model.AlumnoModel;
import com.cursos.model.AlumnoTallerModel;
import com.cursos.model.PagosModel;
import com.cursos.model.TallerModel;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Cesar on 14/09/2014.
 */
@Transactional
public class PagosService {
    private PagosDao pagosDao;
    private AlumnoTallerDao alumnoTallerDao;
    private TallerDao tallerDao;
    private AlumnoDao alumnoDao;

    public PagosDao getPagosDao() {
        return pagosDao;
    }

    public void setPagosDao(PagosDao pagosDao) {
        this.pagosDao = pagosDao;
    }

    public List<PagosModel> getHistorialPagosAllUsuarios() throws Exception {
        List<PagosModel> pagosModels = pagosDao.getHistorialPagosAllUsuarios();
        for (PagosModel pagosModel : pagosModels) {
            Hibernate.initialize(pagosModel.getUserModel());
        }
        return pagosModels;
    }

    public void realizarPagoTaller(AlumnoTallerModel alumnoTallerModel) {

    }

    public void realizarPagoTaller(AlumnoModel alumnoModel, TallerModel tallerModel, PagosModel pagosModel) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        java.util.Date utilDate = new java.util.Date();
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

        AlumnoTallerModel alumnoTallerModel = alumnoTallerDao.getAlumnoTallerByTallerAndAlumno(alumnoModel, tallerModel);

        if (pagosModel.getTipoPago() == PagosModel.TipoPago.INSCRIPCION) {
            alumnoTallerModel.setInscripcion(true);
            alumnoTallerModel.setFechaInscripcion(sqlDate);
            pagosModel.setMesesPagos(0);
        }
        pagosModel.setUserModel(alumnoTallerModel.getAlumnoModel().getUserModel());
        pagosModel.setMontoIngresado(alumnoTallerModel.getTallerModel().getCostoInscripcion());
        pagosModel.setMontoCalculado(alumnoTallerModel.getTallerModel().getCostoInscripcion());
        if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
            pagosModel.setStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR);
        } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
            pagosModel.setStatus(PagosModel.StatusType.REALIZADO_POR_REPRESENTANTE);
        }
        pagosModel.setLogTransaccion(construirLogTransaccionInscripcionPago(pagosModel));
        pagosModel.setFechaPago(sqlDate);
        pagosDao.guardar(pagosModel);
        alumnoTallerDao.updateAlumnoTallerModel(alumnoTallerModel);
    }



    public String construirLogTransaccionInscripcionPago(PagosModel pagosModel) {
        String usuarioCedula="Usuario: "+ pagosModel.getUserModel().getUserInfo()+" - ";
        String tipoPago = pagosModel.getTipoPago().toString()+" - ";
        String modoPago = pagosModel.getModoPago().toString()+" - ";
        String cantidad = "Monto: "+pagosModel.getMontoIngresado() + "Bs. - ";
        String comprobante = pagosModel.getNumeroComprobante()==""?"":"Número comprobante: "+pagosModel.getNumeroComprobante();
        String log = usuarioCedula +tipoPago+modoPago+cantidad+comprobante;
        return log;
    }

    public List<PagosModel> getHistorialPagosByUsuario(int id) throws Exception {
        return pagosDao.getHistorialPagosByUsuario(id);
    }

    public AlumnoTallerDao getAlumnoTallerDao() {
        return alumnoTallerDao;
    }

    public void setAlumnoTallerDao(AlumnoTallerDao alumnoTallerDao) {
        this.alumnoTallerDao = alumnoTallerDao;
    }

    public TallerDao getTallerDao() {
        return tallerDao;
    }

    public void setTallerDao(TallerDao tallerDao) {
        this.tallerDao = tallerDao;
    }

    public AlumnoDao getAlumnoDao() {
        return alumnoDao;
    }

    public void setAlumnoDao(AlumnoDao alumnoDao) {
        this.alumnoDao = alumnoDao;
    }
}
