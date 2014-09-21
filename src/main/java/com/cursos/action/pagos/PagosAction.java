package com.cursos.action.pagos;

import com.cursos.excepciones.NotFoundException;
import com.cursos.model.TallerModel;
import com.cursos.model.UserModel;
import com.cursos.service.pagos.PagosService;
import com.cursos.service.taller.TallerService;
import com.cursos.service.usuario.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

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

    public String execute(){
        return SUCCESS;
    }

    public String cargar(){
        return SUCCESS;
    }

    /**/
    public String buscarUsuario(){

        HttpServletRequest request = ServletActionContext.getRequest();
        try {
            if (request.isUserInRole("ROLE_ADMIN")) {
                userModel = usuarioService.getUsuarioByCi(userModel);
            } else {
                //if (request.isUserInRole("ROLE_REPRESENTANTE"))
                //userModel = getUsuarioAutenticado();
                userModel = usuarioService.getUsuarioByCi(userModel);
            }/*TODO comprobar role autenticado*/
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

    public String cargarTodosUsuarios(){

        try {
            tallerModelList = tallerService.getAllTaller();
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "infoPagosTodosUsuario";
    }

    public UserModel getUsuarioAutenticado(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        return (UserModel)auth;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public void setPagosService(PagosService pagosService) {
        this.pagosService = pagosService;
    }

    public PagosService getPagosService() {
        return pagosService;
    }

    public void setUsuarioService(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    public UsuarioService getUsuarioService() {
        return usuarioService;
    }

    public void setTallerService(TallerService tallerService) {
        this.tallerService = tallerService;
    }

    public TallerService getTallerService() {
        return tallerService;
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
}
