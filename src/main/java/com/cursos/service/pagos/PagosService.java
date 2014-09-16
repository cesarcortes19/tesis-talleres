package com.cursos.service.pagos;

import com.cursos.dao.pagos.PagosDao;

/**
 * Created by Cesar on 14/09/2014.
 */
public class PagosService {
    private PagosDao pagosDao;

    public void setPagosDao(PagosDao pagosDao) {
        this.pagosDao = pagosDao;
    }

    public PagosDao getPagosDao() {
        return pagosDao;
    }
}
