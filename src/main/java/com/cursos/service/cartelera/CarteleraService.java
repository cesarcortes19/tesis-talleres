package com.cursos.service.cartelera;

import com.cursos.dao.cartelera.CarteleraDao;
import com.cursos.dao.usuario.UsuarioDao;
import com.cursos.model.NoticiaModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Cesar on 25/08/2014.
 */
@Transactional
public class CarteleraService {
    private CarteleraDao carteleraDao;


    public int getContadorNoticias() throws Exception {
        return carteleraDao.getContadorNoticias();
    }

    public List<NoticiaModel> getNoticias(Integer from, Integer to) throws Exception {
        return carteleraDao.getNoticias(from, to);
    }

    public void eliminarNoticia (Integer id) throws Exception{
        carteleraDao.eliminarNoticia(id);
    }

    public void setCarteleraDao(CarteleraDao carteleraDao) {
        this.carteleraDao = carteleraDao;
    }

    public CarteleraDao getCarteleraDao() {
        return carteleraDao;
    }

    public void guardar(NoticiaModel noticiaModel)throws Exception{
        carteleraDao.guardar(noticiaModel);
    }
}

