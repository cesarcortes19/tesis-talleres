package com.cursos.action.taller;

import com.cursos.ViewNames;
import com.cursos.excepciones.NotFoundException;
import com.cursos.excepciones.TallerMaximaCapacidadException;
import com.cursos.model.*;
import com.cursos.service.alumno.AlumnoService;
import com.cursos.service.pagos.PagosService;
import com.cursos.service.taller.TallerService;
import com.cursos.service.usuario.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Cesar on 27/07/2014.
 */
public class TallerAction extends ActionSupport {
    private TallerModel tallerModel;
    private List<TallerModel> tallerList;
    private TallerService tallerService;
    private UserModel userModel;
    private UsuarioService usuarioService;
    private AuthenticationManager authenticationManager;
    private AlumnoModel alumnoModel;
    private AlumnoService alumnoService;
    private AlumnoTallerModel alumnoTallerModel;
    private PagosModel pagosModel;
    private String modoPago;
    private PagosService pagosService;
    private int cantidadTalleresPorInscribir;
    private Map<String, Object> model = new HashMap<String, Object>();
    private File fileUpload;


    public String cargar() {
        return SUCCESS;
    }

    public String cargarEditar() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        try {
            tallerModel = tallerService.getTallerById(tallerModel.getId());
            Map<Integer, byte[]> pictureMap = new HashMap<Integer, byte[]>();

                pictureMap.put(tallerModel.getId(), tallerModel.getPicture());

            session.removeAttribute("pictureMap");
            session.setAttribute("pictureMap", pictureMap);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    /*Carga todos los talleres, lo utilizan todos los roles*/
    public String cargarAdministrar() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        try {
            tallerList = tallerService.getAllTaller();
            Map<Integer, byte[]> pictureMap = new HashMap<Integer, byte[]>();
            for (TallerModel tm : tallerList) {
                pictureMap.put(tm.getId(), tm.getPicture());
            }
            session.removeAttribute("pictureMap");
            session.setAttribute("pictureMap", pictureMap);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String guardar() {
        try {
            if(fileUpload!=null) {
                Path path = Paths.get(fileUpload.getPath());
                byte[] data = Files.readAllBytes(path);
                tallerModel.setPicture(data);
            }
            tallerService.guardarTaller(tallerModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "cargarAdministrarTaller";
    }

    public String guardarEditar() {
        try {
            tallerService.updateTaller(tallerModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarAdministrarTaller";
    }

    public String guardarEliminar() {
        try {
            tallerService.eliminarTaller(tallerModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarAdministrarTaller";
    }

    /*Busca usuario por numero de cedula para mostrar sus representados e inscribirlos
    * via administrador*/
    public String buscar() {
        try {
            userModel = usuarioService.getUsuarioByCi(userModel);
        } catch (Exception e) {
            if (e instanceof NotFoundException) {
                addActionMessage(((NotFoundException) e).getElem() + " Usuario no encontrado");
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        return "cargarRepresentadosInscribirTaller";
    }

    public String cargarRepresentadosInscribir() {
        HttpServletRequest request = ServletActionContext.getRequest();

        try {
            if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
                userModel = usuarioService.getUsuarioByCi(userModel);
                cantidadTalleresPorInscribir = tallerService.getTalleresNoInscritos(alumnoModel).size();
            } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                userModel = new UserModel();
                Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                User userAuth = (User) auth.getPrincipal();
                userModel.setCedula(userAuth.getUsername());
                userModel = usuarioService.getUsuarioByCi(userModel);
                cantidadTalleresPorInscribir = tallerService.getTalleresNoInscritos(alumnoModel).size();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }

        Hibernate.initialize(userModel.getAlumnoModelSet());
        if (model.get(ViewNames.MENSAJE) != null) {
            addActionMessage((String) model.get(ViewNames.MENSAJE));
        }
        return "listadoRepresentadosInscribir";
    }

    public String cargarTallerInscribir() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        try {
            tallerList = tallerService.getTalleresNoInscritos(alumnoModel);
            Map<Integer, byte[]> pictureMap = new HashMap<Integer, byte[]>();
            for (TallerModel tm : tallerList) {
                pictureMap.put(tm.getId(), tm.getPicture());
            }
            session.removeAttribute("pictureMap");
            session.setAttribute("pictureMap", pictureMap);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "listadoTallerInscribir";
    }

    /**
     * .
     * Metodo que recibe el id del alumno y el ide del taller que inscribio
     *
     * @return
     */
    public String guardarInscribir() {
        try {
            /*Se define como se pago*/
            if (modoPago.equals("1"))
                pagosModel.setModoPago(PagosModel.ModoPago.DEPOSITO);
            else if (modoPago.equals("2"))
                pagosModel.setModoPago(PagosModel.ModoPago.TRANSFERENCIA);
            else if (modoPago.equals("3"))
                pagosModel.setModoPago(PagosModel.ModoPago.EFECTIVO);
            else return ERROR;
            pagosModel.setTipoPago(PagosModel.TipoPago.INSCRIPCION);
            /*Se defino quien realizo el pago*/

            tallerService.realizarInscripcion(alumnoModel.getId(), tallerModel.getId());
            pagosService.realizarPagoTaller(alumnoModel,tallerModel, pagosModel);

        } catch (Exception e) {
            if (e instanceof TallerMaximaCapacidadException) {
                addActionMessage(((NotFoundException) e).getMessage());
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        model.put(ViewNames.MENSAJE,getText("mensaje.transaccion.exitosa")+" (Inscripción)");
        return "cargarRepresentadosInscribirTaller";
    }

    public String realizarDesinscripcion() {
        try {
            tallerService.realizarDesinscripcion(alumnoTallerModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        model.put(ViewNames.MENSAJE,getText("mensaje.transaccion.exitosa")+" (Desinscripción)");
        return "cargarRepresentadosInscribirTaller";
    }


    public TallerModel getTallerModel() {
        return tallerModel;
    }

    public void setTallerModel(TallerModel tallerModel) {
        this.tallerModel = tallerModel;
    }

    public TallerService getTallerService() {
        return tallerService;
    }

    public void setTallerService(TallerService tallerService) {
        this.tallerService = tallerService;
    }

    public List<TallerModel> getTallerList() {
        return tallerList;
    }

    public void setTallerList(List<TallerModel> tallerList) {
        this.tallerList = tallerList;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public UsuarioService getUsuarioService() {
        return usuarioService;
    }

    public void setUsuarioService(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    public AuthenticationManager getAuthenticationManager() {
        return authenticationManager;
    }

    public void setAuthenticationManager(AuthenticationManager authenticationManager) {
        this.authenticationManager = authenticationManager;
    }

    public AlumnoModel getAlumnoModel() {
        return alumnoModel;
    }

    public void setAlumnoModel(AlumnoModel alumnoModel) {
        this.alumnoModel = alumnoModel;
    }

    public AlumnoService getAlumnoService() {
        return alumnoService;
    }

    public void setAlumnoService(AlumnoService alumnoService) {
        this.alumnoService = alumnoService;
    }

    public AlumnoTallerModel getAlumnoTallerModel() {
        return alumnoTallerModel;
    }

    public void setAlumnoTallerModel(AlumnoTallerModel alumnoTallerModel) {
        this.alumnoTallerModel = alumnoTallerModel;
    }

    public PagosModel getPagosModel() {
        return pagosModel;
    }

    public void setPagosModel(PagosModel pagosModel) {
        this.pagosModel = pagosModel;
    }

    public String getModoPago() {
        return modoPago;
    }

    public void setModoPago(String modoPago) {
        this.modoPago = modoPago;
    }

    public void setPagosService(PagosService pagosService) {
        this.pagosService = pagosService;
    }

    public PagosService getPagosService() {
        return pagosService;
    }

    public Map<String, Object> getModel() {
        return model;
    }

    public void setModel(Map<String, Object> model) {
        this.model = model;
    }

    public int getCantidadTalleresPorInscribir() {
        return cantidadTalleresPorInscribir;
    }

    public void setCantidadTalleresPorInscribir(int cantidadTalleresPorInscribir) {
        this.cantidadTalleresPorInscribir = cantidadTalleresPorInscribir;
    }

    public File getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(File fileUpload) {
        this.fileUpload = fileUpload;
    }
}
