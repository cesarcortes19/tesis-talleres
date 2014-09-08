package com.cursos.action.taller;

import com.cursos.excepciones.NotFoundException;
import com.cursos.model.TallerModel;
import com.cursos.model.UserModel;
import com.cursos.service.taller.TallerService;
import com.cursos.service.usuario.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 * Created by Cesar on 27/07/2014.
 */
public class TallerAction extends ActionSupport {
    private TallerModel tallerModel;
    private List<TallerModel> tallerList;
    private TallerService tallerService;
    private UserModel userModel;
    private UsuarioService usuarioService;

    public String cargar() {
        return SUCCESS;
    }

    public String cargarEditar() {
        try {
            tallerModel = tallerService.getTallerById(tallerModel.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String cargarAdministrar() {
        try {
            tallerList = tallerService.getAllTaller();
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String guardar() {
        try {
            tallerService.guardarTaller(tallerModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
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
            usuarioService.getUsuarioByCi(userModel);
        } catch (Exception e) {
            if (e instanceof NotFoundException){
                addActionMessage(((NotFoundException) e).getElem() + " Usuario no encontrado");
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        return "cargarRepresentadosInscribirTaller";
    }

    public String cargarRepresentadosInscribir(){
/*TODO identificar que role tiene por spring*/
        try {
            if(userModel.getRoleModel().getName() == "Admin"){

            }else{
                userModel = usuarioService.getUsuarioByCi(userModel);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }

        return SUCCESS;
    }

    public String cargarInscribir() {
        int idRepresentado=0;
        try {
            tallerList = tallerService.getTalleresNoInscritos(idRepresentado);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
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
}
