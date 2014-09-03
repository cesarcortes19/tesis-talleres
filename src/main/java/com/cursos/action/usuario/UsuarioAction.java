package com.cursos.action.usuario;

import com.cursos.model.AlumnoModel;
import com.cursos.model.AlumnoModel;
import com.cursos.model.UserModel;
import com.cursos.service.usuario.UsuarioService;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.PredicateUtils;

import java.lang.reflect.Type;
import java.util.*;

/**
 * Created by Cesar on 12/08/2014.
 */
public class UsuarioAction extends ActionSupport {

    private UserModel usuarioModel;
    private UsuarioService usuarioService;
    private String listaAlumnoJson;

    public String execute(){return SUCCESS;}

    public String cargar(){return SUCCESS;}

    public String cargarEditar(){
        try {
            usuarioModel=usuarioService.getUsuarioById(usuarioModel.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }

    public String guardar(){
        Gson gson = new Gson();
        Type listType = new TypeToken<ArrayList<AlumnoModel>>() {
        }.getType();

        List<AlumnoModel> alumnoModelSet;
        alumnoModelSet = (List<AlumnoModel>) CollectionUtils.select(gson.<Collection>fromJson(listaAlumnoJson, listType),
                PredicateUtils.notNullPredicate());
        for (AlumnoModel am: alumnoModelSet){
            am.setUserModel(usuarioModel);
        }
          /*alumnoModelSet.iterator().next().setUserModel(usuarioModel);*/
        Set<AlumnoModel> set = new HashSet<AlumnoModel>(alumnoModelSet);

        usuarioModel.setAlumnoModelSet(set);

        try{
            usuarioService.guardar(usuarioModel);
        }catch (Exception e){
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "cargarAdministrarUsuario";
    }

    public String guardarEditar(){
        try {
            usuarioService.update(usuarioModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "cargarAdministrarUsuario";
    }

    public String editarContrasena(){
        return SUCCESS;
    }

    public String guardarEliminar(){
        try {
            usuarioService.eliminar(usuarioModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "cargarAdministrarUsuario";
    }

    public UserModel getUsuarioModel() {
        return usuarioModel;
    }

    public void setUsuarioModel(UserModel usuarioModel) {
        this.usuarioModel = usuarioModel;
    }

    public String getListaAlumnoJson() {
        return listaAlumnoJson;
    }

    public void setListaAlumnoJson(String listaAlumnoJson) {
        this.listaAlumnoJson = listaAlumnoJson;
    }

    public void setUsuarioService(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    public UsuarioService getUsuarioService() {
        return usuarioService;
    }
}
