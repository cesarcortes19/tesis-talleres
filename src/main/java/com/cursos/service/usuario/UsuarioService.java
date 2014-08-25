package com.cursos.service.usuario;

import com.cursos.dao.usuario.UsuarioDao;
import com.cursos.model.UserModel;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by Cesar on 12/08/2014.
 */
@Transactional(readOnly = false)
public class UsuarioService {
    private UsuarioDao usuarioDao;


    public void guardar(UserModel userModel) throws Exception{
        usuarioDao.guardar(userModel);
    }

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }
}
