package com.cursos.action.taller;

import com.cursos.excepciones.NotFoundException;
import com.cursos.excepciones.TallerMaximaCapacidadException;
import com.cursos.model.AlumnoModel;
import com.cursos.model.TallerModel;
import com.cursos.model.UserModel;
import com.cursos.service.alumno.AlumnoService;
import com.cursos.service.taller.TallerService;
import com.cursos.service.usuario.UsuarioService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.springframework.security.authentication.AuthenticationManager;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Set;

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
            if (request.isUserInRole("ROLE_ADMIN")) {

            } else {
                userModel = usuarioService.getUsuarioByCi(userModel);
            }/*TODO comprobar role autenticado*/
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        Hibernate.initialize(userModel.getAlumnoModelSet());
        return "listadoRepresentadosInscribir";
    }

    public String cargarTallerInscribir() {
        try {
            tallerList = tallerService.getTalleresNoInscritos(alumnoModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "listadoTallerInscribir";
    }

    /**.
     * Metodo que recibe el id del alumno y el ide del taller que inscribio
     * @return
     */
    public String guardarInscribir() {
        try {
            tallerService.realizarInscripcion(alumnoModel.getId(),tallerModel.getId());
        } catch (Exception e) {
            if(e instanceof TallerMaximaCapacidadException)
            {
                addActionMessage(((NotFoundException) e).getMessage());
                return INPUT;
            }
            e.printStackTrace();
            return ERROR;
        }
        return "listadoRepresentadosInscribir";
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

    public void setAlumnoService(AlumnoService alumnoService) {
        this.alumnoService = alumnoService;
    }

    public AlumnoService getAlumnoService() {
        return alumnoService;
    }
}
