package com.cursos.util.convertidor;

import com.cursos.interfaces.UsuarioInterface;
import com.cursos.model.UserModel;
import com.cursos.to.UsuarioTo;

/**
 * Created by Cesar on 31/08/2014.
 */
public class UsuarioConverter {

    public static UserModel convertirAdministrador(UserModel userModelForm, UserModel userModelBD ) {
        userModelBD.setNombre(userModelForm.getNombre());
        userModelBD.setApellido(userModelForm.getApellido());
        userModelBD.setCedula(userModelForm.getCedula());
        userModelBD.setEmail(userModelForm.getEmail());
        userModelBD.setEmail2(userModelForm.getEmail2());
        userModelBD.setTelefono1(userModelForm.getTelefono1());
        userModelBD.setTelefono2(userModelForm.getTelefono2());
        userModelBD.setDireccion(userModelForm.getDireccion());
        userModelBD.setObservaciones(userModelForm.getObservaciones());
        return userModelBD;
    }


    public static UserModel convertirUsuario(UserModel userModelForm, UserModel userModelBD) {
        userModelBD.setNombre(userModelForm.getNombre());
        userModelBD.setApellido(userModelForm.getApellido());
        userModelBD.setCedula(userModelForm.getCedula());
        userModelBD.setEmail(userModelForm.getEmail());
        userModelBD.setEmail2(userModelForm.getEmail2());
        userModelBD.setTelefono1(userModelForm.getTelefono1());
        userModelBD.setTelefono2(userModelForm.getTelefono2());
        userModelBD.setDireccion(userModelForm.getDireccion());
        userModelBD.setObservaciones(userModelForm.getObservaciones());
        return userModelBD;
    }
}
