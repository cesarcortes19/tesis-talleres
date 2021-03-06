package com.cursos.service.pagos;

import com.cursos.ViewNames;
import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.dao.pagos.PagosDao;
import com.cursos.dao.taller.AlumnoTallerDao;
import com.cursos.dao.taller.TallerDao;
import com.cursos.model.*;
import com.cursos.to.PagosTo;
import com.cursos.util.DateUtil;
import com.cursos.util.Email;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.util.*;

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

    /*solo para inscripcion*/
    public void realizarPagoTaller(AlumnoModel alumnoModel, TallerModel tallerModel, PagosModel pagosModel) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH);
        AlumnoTallerModel alumnoTallerModel = alumnoTallerDao.getAlumnoTallerByTallerAndAlumno(alumnoModel, tallerModel);

        if (pagosModel.getTipoPago() == PagosModel.TipoPago.INSCRIPCION) {
            alumnoTallerModel.setInscripcion(true);
            alumnoTallerModel.setFechaInscripcion(DateUtil.getCurrentDate());
            pagosModel.setMesesPagos(0);
        }
        pagosModel.setUserModel(alumnoTallerModel.getAlumnoModel().getUserModel());
        pagosModel.setMontoIngresado(alumnoTallerModel.getTallerModel().getCostoInscripcion()+alumnoTallerModel.getTallerModel().getCosto());
        pagosModel.setMontoCalculado(alumnoTallerModel.getTallerModel().getCostoInscripcion()+alumnoTallerModel.getTallerModel().getCosto());
        if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
            pagosModel.setStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR);
        } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
            pagosModel.setStatus(PagosModel.StatusType.REALIZADO_POR_REPRESENTANTE);
        }
        String logTransaccion = "Taller: "+alumnoTallerModel.getTallerModel().getName()+
                " - Representado: "+ alumnoTallerModel.getAlumnoModel().getNombre() +
                " - Pago: Inscripción y mensualidad-"+pagosModel.getModoPago().toString();
        pagosModel.setLogTransaccion(logTransaccion);
        java.util.Date date= new java.util.Date();
        pagosModel.setFechaPago(new Timestamp(date.getTime()));

        Set<DetallePagoModel> detallePagoModelList = new HashSet<DetallePagoModel>();
        DetallePagoModel detallePagoModel = new DetallePagoModel();
        if(currentMonth==0){
            alumnoTallerModel.setEnero(true);
            detallePagoModel.setEnero(true);
        }
        if(currentMonth==1){
            alumnoTallerModel.setFebrero(true);
            detallePagoModel.setFebrero(true);
        }
        if(currentMonth==2){
            alumnoTallerModel.setMarzo(true);
            detallePagoModel.setMarzo(true);
        }
        if(currentMonth==3){
            alumnoTallerModel.setAbril(true);
            detallePagoModel.setAbril(true);
        }
        if(currentMonth==4){
            alumnoTallerModel.setMayo(true);
            detallePagoModel.setMayo(true);
        }
        if(currentMonth==5){
            alumnoTallerModel.setJunio(true);
            detallePagoModel.setJunio(true);
        }
        if(currentMonth==6){
            alumnoTallerModel.setJulio(true);
            detallePagoModel.setJulio(true);
        }
        if(currentMonth==7){
            alumnoTallerModel.setAgosto(true);
            detallePagoModel.setAgosto(true);
        }
        if(currentMonth==8){
            alumnoTallerModel.setSeptiembre(true);
            detallePagoModel.setSeptiembre(true);
        }
        if(currentMonth==9){
            alumnoTallerModel.setOctubre(true);
            detallePagoModel.setOctubre(true);
        }
        if(currentMonth==10){
            alumnoTallerModel.setNoviembre(true);
            detallePagoModel.setNoviembre(true);
        }
        if(currentMonth==11){
            alumnoTallerModel.setDiciembre(true);
            detallePagoModel.setDiciembre(true);
        }
        detallePagoModel.setAlumnoTallerModel(alumnoTallerModel);
        detallePagoModel.setInscripcion(true);
        detallePagoModel.setPagosModel(pagosModel);
        detallePagoModelList.add(detallePagoModel);
        pagosModel.setDetallePagoModels(detallePagoModelList);
        pagosDao.guardar(pagosModel);
        alumnoTallerDao.updateAlumnoTallerModel(alumnoTallerModel);
    }

    /*.
    Obtiene el objeto con el json obtenido de los pagos, los construye como objeto y lo retorna
     */
    public List<PagosTo> contruirObjetoPagos(PagosTo pagosTo) throws Exception {
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<PagosTo>>() {
        }.getType();
        List<PagosTo> pagosTos = new LinkedList<PagosTo>();
        pagosTos = gson.fromJson(pagosTo.getJsonPagos(), listType);
        return pagosTos;
    }

    /*Realiza el pago la mensualidad del taller*/
    public void realizarPagoTaller(List<PagosTo> pagosTos, PagosTo pagosTo) throws Exception {
        PagosModel pagosModel = new PagosModel();
        Set<DetallePagoModel> detallePagoModelList = new HashSet<DetallePagoModel>();
        DetallePagoModel detallePagoModel;
        UserModel userModel = new UserModel();
        Double montoCalculado = Double.valueOf(0);
        boolean banderaPago;
        String logTransaccion = "";
        String logTransaccionGeneral = "";
        try {
            for (PagosTo pt : pagosTos) {
                logTransaccion = "";
                AlumnoTallerModel alumnoTaller = alumnoTallerDao.getAlumnoTallerById(new AlumnoTallerModel(pt.getId()));
                detallePagoModel = new DetallePagoModel();
                detallePagoModel.setAlumnoTallerModel(alumnoTaller);
                userModel = alumnoTaller.getAlumnoModel().getUserModel();
                banderaPago = false;

                if (pt.getInscripcion() == true && alumnoTaller.getInscripcion() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCostoInscripcion();
                    detallePagoModel.setInscripcion(true);
                    logTransaccion = logTransaccion +"Inscripción ";
                    banderaPago = true;
                }
                alumnoTaller.setInscripcion(pt.getInscripcion());


                if (pt.getEnero() == true && alumnoTaller.getEnero() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setEnero(true);
                    logTransaccion = logTransaccion +"Enero ";
                    banderaPago = true;

                }
                alumnoTaller.setEnero(pt.getEnero());

                if (pt.getFebrero() == true && alumnoTaller.getFebrero() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setFebrero(true);
                    logTransaccion = logTransaccion + "Febrero ";
                    banderaPago = true;
                }
                alumnoTaller.setFebrero(pt.getFebrero());

                if (pt.getMarzo() == true && alumnoTaller.getMarzo() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setMarzo(true);
                    logTransaccion = logTransaccion + "Marzo ";
                    banderaPago = true;
                }
                alumnoTaller.setMarzo(pt.getMarzo());

                if (pt.getAbril() == true && alumnoTaller.getAbril() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setAbril(true);
                    logTransaccion = logTransaccion + "Abril ";
                    banderaPago = true;
                }
                alumnoTaller.setAbril(pt.getAbril());

                if (pt.getMayo() == true && alumnoTaller.getMayo() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setMayo(true);
                    logTransaccion = logTransaccion + "Mayo ";
                    banderaPago = true;
                }
                alumnoTaller.setMayo(pt.getMayo());

                if (pt.getJunio() == true && alumnoTaller.getJunio() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setJunio(true);
                    logTransaccion = logTransaccion + "Junio ";
                    banderaPago = true;
                }
                alumnoTaller.setJunio(pt.getJunio());

/*                if(pt.getJulio()==true && alumnoTaller.getJulio()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setJulio(true);
                }
                alumnoTaller.setJulio(pt.getJulio());

                if(pt.getAgosto()==true && alumnoTaller.getAgosto()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setAgosto(true);
                }
                alumnoTaller.setAgosto(pt.getAgosto());*/

                if (pt.getSeptiembre() == true && alumnoTaller.getSeptiembre() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setSeptiembre(true);
                    logTransaccion = logTransaccion + "Septiembre ";
                    banderaPago = true;
                }
                alumnoTaller.setSeptiembre(pt.getSeptiembre());

                if (pt.getOctubre() == true && alumnoTaller.getOctubre() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setOctubre(true);
                    logTransaccion = logTransaccion + "Octubre ";
                    banderaPago = true;
                }
                alumnoTaller.setOctubre(pt.getOctubre());

                if (pt.getNoviembre() == true && alumnoTaller.getNoviembre() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setNoviembre(true);
                    logTransaccion = logTransaccion + "Noviembre ";
                    banderaPago = true;
                }
                alumnoTaller.setNoviembre(pt.getNoviembre());

                if (pt.getDiciembre() == true && alumnoTaller.getDiciembre() != true) {
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                    detallePagoModel.setDiciembre(true);
                    logTransaccion = logTransaccion + "Diciembre ";
                    banderaPago = true;
                }
                alumnoTaller.setDiciembre(pt.getDiciembre());

                alumnoTallerDao.updateAlumnoTallerModel(alumnoTaller);
                detallePagoModel.setPagosModel(pagosModel);
                if(banderaPago){
                    detallePagoModelList.add(detallePagoModel);
                    logTransaccion = "Taller: "+alumnoTaller.getTallerModel().getName()
                            + " - Representado: "+alumnoTaller.getAlumnoModel().getNombre() +" - Meses: "+logTransaccion+" / ";
                    logTransaccionGeneral = logTransaccionGeneral +logTransaccion;
                }
            }

            pagosModel.setDetallePagoModels(detallePagoModelList);
            java.util.Date date= new java.util.Date();
            pagosModel.setFechaPago(new Timestamp(date.getTime()));
            pagosModel.setTipoPago(PagosModel.TipoPago.MENSUALIDAD);

            if (pagosTo.getModoPago().equals("1"))
                pagosModel.setModoPago(PagosModel.ModoPago.DEPOSITO);
            else if (pagosTo.getModoPago().equals("2"))
                pagosModel.setModoPago(PagosModel.ModoPago.TRANSFERENCIA);
            else if (pagosTo.getModoPago().equals("3"))
                pagosModel.setModoPago(PagosModel.ModoPago.EFECTIVO);
            else
                return;
            logTransaccionGeneral =logTransaccionGeneral + pagosModel.getModoPago().toString();
            pagosModel.setLogTransaccion(logTransaccionGeneral);
            pagosModel.setUserModel(userModel);
            /*Comprobacion de quien esta logueado para realizar el apgo*/
            HttpServletRequest request = ServletActionContext.getRequest();
            if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
                pagosModel.setStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR);
            } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                pagosModel.setStatus(PagosModel.StatusType.REALIZADO_POR_REPRESENTANTE);
            }
            pagosModel.setMontoCalculado(montoCalculado);
            pagosModel.setNumeroComprobante(pagosTo.getNumeroComprobante());
            pagosDao.guardar(pagosModel);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }


    public PagosModel aceptarPago(String idPago) throws Exception{
        PagosModel pagosModel = pagosDao.getPagoById(Integer.parseInt(idPago));
        pagosModel.setStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR);
        pagosDao.actualizar(pagosModel);
        pagosModel.getUserModel().getEmail();
        return pagosModel;
    }


    public PagosModel rechazarPago(String idPago) throws Exception {
        PagosModel pagosModel = pagosDao.getPagoById(Integer.parseInt(idPago));
        try {

            for (DetallePagoModel dpm : pagosModel.getDetallePagoModels()) {
                AlumnoTallerModel alumnoTallerModel = dpm.getAlumnoTallerModel();


                if (dpm.getEnero() != null && dpm.getEnero() == true) {
                    alumnoTallerModel.setEnero(false);
                }
                if (dpm.getFebrero() != null && dpm.getFebrero() == true) {
                    alumnoTallerModel.setFebrero(false);
                }

                if (dpm.getMarzo() != null && dpm.getMarzo() == true) {
                    alumnoTallerModel.setMarzo(false);
                }

                if (dpm.getAbril() != null && dpm.getAbril() == true) {
                    alumnoTallerModel.setAbril(false);
                }

                if (dpm.getMayo() != null && dpm.getMayo() == true) {
                    alumnoTallerModel.setMayo(false);
                }

                if (dpm.getJunio() != null && dpm.getJunio() == true) {
                    alumnoTallerModel.setJunio(false);
                }

                if (dpm.getSeptiembre() != null && dpm.getSeptiembre() == true) {
                    alumnoTallerModel.setSeptiembre(false);
                }

                if (dpm.getOctubre() != null && dpm.getOctubre() == true) {
                    alumnoTallerModel.setOctubre(false);
                }

                if (dpm.getNoviembre() != null && dpm.getNoviembre() == true) {
                    alumnoTallerModel.setNoviembre(false);
                }

                if (dpm.getDiciembre() != null && dpm.getDiciembre() == true) {
                    alumnoTallerModel.setDiciembre(false);
                }

                if (dpm.getInscripcion() != null && dpm.getInscripcion() == true) {
                    alumnoTallerModel.setInscripcion(false);
                }

                alumnoTallerDao.updateAlumnoTallerModel(alumnoTallerModel);


            }
            pagosModel.setStatus(PagosModel.StatusType.PAGO_RECHAZADO);
            pagosDao.actualizar(pagosModel);
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
        pagosModel.getUserModel().getEmail();
        return pagosModel;
    }

    public String construirMensajeRechazo(PagosModel pagosModel){
        return "Estimado(a) "+pagosModel.getUserModel().getFullName()+", lamentamos informarle que el " +
                "pago asociado al comprobante: "+pagosModel.getNumeroComprobante()+", por el monto de: "+pagosModel.getMontoCalculado()+ "Bs. fue marcado como rechazado por el administrador" +
                "del sistema, por favor ponerse en contacto";
    }

    public String construirMensajeAceptacion(PagosModel pagosModel){
        return "Estimado(a) "+pagosModel.getUserModel().getFullName()+", le informamos que el " +
                "pago asociado al comprobante: "+pagosModel.getNumeroComprobante()+", por el monto de: "+pagosModel.getMontoCalculado()+ "Bs. fue marcado como ACEPTADO por el administrador" +
                "del sistema.";
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


    public List<PagosModel> getHistorialPagosByUsuarioAndStatus(String id, int userModelId) throws Exception{

        if(id.equals("1")){
            return pagosDao.getHistorialPagosByUsuarioAndStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR,userModelId);
        }
        if(id.equals("2")){
            return pagosDao.getHistorialPagosByUsuarioAndStatus(PagosModel.StatusType.PAGO_RECHAZADO,userModelId);
        }

        if(id.equals("3")){
            return pagosDao.getHistorialPagosByUsuarioAndStatus(PagosModel.StatusType.REALIZADO_POR_REPRESENTANTE,userModelId);
        }

        return null;

    }

    public List<PagosModel> getHistorialPagosBAllUsuariosAndStatus(String modoPago) {

        List<PagosModel> pagosModels = null;

        if(modoPago.equals("1")){
            pagosModels = pagosDao.getHistorialPagosAllUsuariosAndStatus(PagosModel.StatusType.PAGO_APROBADO_ADMINISTRADOR);
        }
        if(modoPago.equals("2")){
            pagosModels = pagosDao.getHistorialPagosAllUsuariosAndStatus(PagosModel.StatusType.PAGO_RECHAZADO);
        }

        if(modoPago.equals("3")){
            pagosModels = pagosDao.getHistorialPagosAllUsuariosAndStatus(PagosModel.StatusType.REALIZADO_POR_REPRESENTANTE);
        }

        for (PagosModel pagosModel : pagosModels) {
            Hibernate.initialize(pagosModel.getUserModel());
        }


        return pagosModels;
    }
}
