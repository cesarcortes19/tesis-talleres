package com.cursos.util.convertidor;

import com.cursos.interfaces.UsuarioInterface;
import com.cursos.model.UserModel;
import com.cursos.to.UsuarioTo;

/**
 * Created by Cesar on 31/08/2014.
 */
public class UsuarioConverter {

    public static UsuarioInterface convertir(UsuarioInterface usuarioParam) {
        UsuarioInterface usuario;
        if (usuarioParam instanceof UserModel)
            usuario = new UsuarioTo();
        else
            usuario = new UserModel();

        usuario.setId(usuarioParam.getId());
        usuario.setNombre(usuarioParam.getNombre());
        usuario.setApellido(usuarioParam.getApellido());
        usuario.setCedula(usuarioParam.getCedula());
        usuario.setDireccion(usuarioParam.getDireccion());
        usuario.setEmail(usuarioParam.getEmail());
        usuario.setEmail2(usuarioParam.getEmail2());
        usuario.setAlumnoModelSet(usuarioParam.getAlumnoModelSet());
        usuario.setObservaciones(usuarioParam.getObservaciones());
        return usuario;
    }

}
