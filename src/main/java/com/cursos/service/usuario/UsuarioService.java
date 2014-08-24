package com.cursos.service.usuario;

import com.cursos.dao.usuario.UsuarioDao;

/**
 * Created by Cesar on 12/08/2014.
 */
public class UsuarioService {
    private UsuarioDao usuarioDao;

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }
}
