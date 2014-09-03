package com.cursos.service.usuario;

import com.cursos.dao.usuario.UsuarioDao;
import com.cursos.model.UserModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Cesar on 12/08/2014.
 */
@Transactional(readOnly = false)
public class UsuarioService {
    private UsuarioDao usuarioDao;

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public void guardar(UserModel userModel) throws Exception {
        usuarioDao.guardar(userModel);
    }

    public List<UserModel> getAll(Integer from, Integer to) throws Exception {
        return usuarioDao.getAll(from, to);
    }

    public void update(UserModel userModel) throws Exception {
        usuarioDao.update(userModel);
    }

    public Integer getContador() throws Exception {
        return usuarioDao.getContador();
    }


    public UserModel getUsuarioById(int id) throws Exception{
        return usuarioDao.getUsuarioById(id);
    }

    public void eliminar(UserModel usuarioModel) throws Exception{
        usuarioModel = usuarioDao.getUsuarioById(usuarioModel.getId());
        usuarioDao.eliminar(usuarioModel);
    }
}
