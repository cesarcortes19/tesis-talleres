package com.cursos.action.pagos;

import com.cursos.ViewNames;
import com.cursos.excepciones.NotFoundException;
import com.cursos.model.PagosModel;
import com.cursos.model.TallerModel;
import com.cursos.model.UserModel;
import com.cursos.service.pagos.PagosService;
import com.cursos.service.taller.TallerService;
import com.cursos.service.usuario.UsuarioService;
import com.cursos.to.PagosTo;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Cesar on 14/09/2014.
 */
public class PagosAction extends ActionSupport {
    private PagosService pagosService;
    private UserModel userModel;
    private UsuarioService usuarioService;
    private TallerService tallerService;
    private TallerModel tallerModel;
    private List<TallerModel> tallerModelList;
    private PagosTo pagosTo;
    private String modoPago;
    private PagosModel pagosModel;
    private String idPago;
    private String msg;

    public String execute() {
        return SUCCESS;
    }

    public String cargar() {
        return SUCCESS;
    }

    /**/
    public String buscarUsuario() {

        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
                userModel = usuarioService.getUsuarioByCi(userModel);
            } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                    userModel = new UserModel();
                    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                    User userAuth = (User) auth.getPrincipal();
                    userModel.setCedula(userAuth.getUsername());
                    userModel = usuarioService.getUsuarioByCi(userModel);
                }
            }
        } catch (Exception e) {
            if (e instanceof NotFoundException) {
                addActionMessage(((NotFoundException) e).getElem() + " Usuario no encontrado");
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        return "infoPagosUsuario";
    }

    public String cargarTodosUsuarios() {

        try {
            tallerModelList = tallerService.getAllTaller();
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "infoPagosTodosUsuario";
    }

    public UserModel getUsuarioAutenticado() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        return (UserModel) auth;
    }

    public String cargarCedulaHistorial() {
        return SUCCESS;
    }

    public String buscarUsuarioHistorial() {

        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
                userModel = usuarioService.getUsuarioByCi(userModel);
            } else if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                if (request.isUserInRole(ViewNames.REPRESENTATE)) {
                    userModel = new UserModel();
                    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                    User userAuth = (User) auth.getPrincipal();
                    userModel.setCedula(userAuth.getUsername());
                    userModel = usuarioService.getUsuarioByCi(userModel);
                }

            }
        } catch (Exception e) {
            if (e instanceof NotFoundException) {
                addActionMessage(((NotFoundException) e).getElem() + " Usuario no encontrado");
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        return "historialPagosUsuario";
    }

    /*Realiza el pago */
    public String realizarGestionPago() {
        try {
            pagosService.realizarPagoTaller(pagosService.contruirObjetoPagos(pagosTo), pagosTo);
            userModel = usuarioService.getUsuarioById(userModel.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "infoPagosUsuario";
    }

    public String aceptarPago() throws Exception {
        try {
            pagosService.aceptarPago(idPago);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String rechazarPago() throws Exception {
        try {
            pagosService.rechazarPago(idPago);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String cargarTodosHistorial() {
        return "historialPagosTodosUsuario";
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public PagosService getPagosService() {
        return pagosService;
    }

    public void setPagosService(PagosService pagosService) {
        this.pagosService = pagosService;
    }

    public UsuarioService getUsuarioService() {
        return usuarioService;
    }

    public void setUsuarioService(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    public TallerService getTallerService() {
        return tallerService;
    }

    public void setTallerService(TallerService tallerService) {
        this.tallerService = tallerService;
    }

    public TallerModel getTallerModel() {
        return tallerModel;
    }

    public void setTallerModel(TallerModel tallerModel) {
        this.tallerModel = tallerModel;
    }

    public List<TallerModel> getTallerModelList() {
        return tallerModelList;
    }

    public void setTallerModelList(List<TallerModel> tallerModelList) {
        this.tallerModelList = tallerModelList;
    }

    public PagosTo getPagosTo() {
        return pagosTo;
    }

    public void setPagosTo(PagosTo pagosTo) {
        this.pagosTo = pagosTo;
    }

    public String getIdPago() {
        return idPago;
    }

    public void setIdPago(String idPago) {
        this.idPago = idPago;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
