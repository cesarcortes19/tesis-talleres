package com.cursos.service.pagos;

import com.cursos.ViewNames;
import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.dao.pagos.PagosDao;
import com.cursos.dao.taller.AlumnoTallerDao;
import com.cursos.dao.taller.TallerDao;
import com.cursos.model.*;
import com.cursos.service.taller.TallerService;
import com.cursos.to.PagosTo;
import com.cursos.util.DateUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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

    public void realizarPagoTaller(AlumnoModel alumnoModel, TallerModel tallerModel, PagosModel pagosModel) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        AlumnoTallerModel alumnoTallerModel = alumnoTallerDao.getAlumnoTallerByTallerAndAlumno(alumnoModel, tallerModel);

        if (pagosModel.getTipoPago() == PagosModel.TipoPago.INSCRIPCION) {
            alumnoTallerModel.setInscripcion(true);
            alumnoTallerModel.setFechaInscripcion(DateUtil.getCurrentDate());
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
        pagosModel.setFechaPago(DateUtil.getCurrentDate());
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


    /*.
    Obtiene el objeto con el json obtenido de los pagos, los construye como objeto y lo retorna
     */
    public List<PagosTo> contruirObjetoPagos(PagosTo pagosTo) throws Exception{
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<PagosTo>>() {
        }.getType();
        List<PagosTo> pagosTos = new LinkedList<PagosTo>();
        pagosTos  = gson.fromJson(pagosTo.getJsonPagos(), listType);
        return pagosTos;
    }

    /*Realiza el pago la mensualidad del taller*/
    public void realizarPagoTaller(List<PagosTo> pagosTos, PagosTo pagosTo) throws Exception{
        PagosModel pagosModel = new PagosModel();
        UserModel userModel = new UserModel();
        Double montoCalculado = Double.valueOf(0);
        try {
            for(PagosTo pt: pagosTos){
                AlumnoTallerModel alumnoTaller = alumnoTallerDao.getAlumnoTallerById(new AlumnoTallerModel(pt.getId()));

                userModel = alumnoTaller.getAlumnoModel().getUserModel();

                if(pt.getEnero()==true && alumnoTaller.getEnero()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setEnero(pt.getEnero());

                if(pt.getFebrero()==true && alumnoTaller.getFebrero()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setFebrero(pt.getFebrero());

                if(pt.getMarzo()==true && alumnoTaller.getMarzo()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setMarzo(pt.getMarzo());

                if(pt.getAbril()==true && alumnoTaller.getAbril()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setAbril(pt.getAbril());

                if(pt.getMayo()==true && alumnoTaller.getMayo()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setMayo(pt.getMayo());

                if(pt.getJunio()==true && alumnoTaller.getJunio()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setJunio(pt.getJunio());

                if(pt.getJulio()==true && alumnoTaller.getJulio()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setJulio(pt.getJulio());

                if(pt.getAgosto()==true && alumnoTaller.getAgosto()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setAgosto(pt.getAgosto());

                if(pt.getSeptiembre()==true && alumnoTaller.getSeptiembre()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setSeptiembre(pt.getSeptiembre());

                if(pt.getOctubre()==true && alumnoTaller.getOctubre()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setOctubre(pt.getOctubre());

                if(pt.getNoviembre()==true && alumnoTaller.getNoviembre()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setNoviembre(pt.getNoviembre());

                if(pt.getDiciembre()==true && alumnoTaller.getDiciembre()!=true){
                    montoCalculado = montoCalculado + alumnoTaller.getTallerModel().getCosto();
                }
                alumnoTaller.setDiciembre(pt.getDiciembre());

                alumnoTallerDao.updateAlumnoTallerModel(alumnoTaller);

            }

            pagosModel.setFechaPago(DateUtil.getCurrentDate());
            pagosModel.setTipoPago(PagosModel.TipoPago.MENSUALIDAD);
            /*TODO GENERAR LOG*/
            pagosModel.setLogTransaccion("Log transaccion");
            if (pagosTo.getModoPago().equals("1"))
                pagosModel.setModoPago(PagosModel.ModoPago.DEPOSITO);
            else if (pagosTo.getModoPago().equals("2"))
                pagosModel.setModoPago(PagosModel.ModoPago.TRANSFERENCIA);
            else if (pagosTo.getModoPago().equals("3"))
                pagosModel.setModoPago(PagosModel.ModoPago.EFECTIVO);
            else
                return;

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
        }

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
