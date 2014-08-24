package com.cursos.service.representado;

import com.cursos.dao.representado.RepresentadoDao;

/**
 * Created by Cesar on 17/08/2014.
 */
public class RepresentadoService {
    private RepresentadoDao representadoDao;

    public void setRepresentadoDao(RepresentadoDao representadoDao) {
        this.representadoDao = representadoDao;
    }

    public RepresentadoDao getRepresentadoDao() {
        return representadoDao;
    }
}
