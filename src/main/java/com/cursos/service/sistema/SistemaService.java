package com.cursos.service.sistema;

import com.cursos.dao.sistema.SistemaDao;

/**
 * Created by Cesar on 27/10/2014.
 */
public class SistemaService {
    private SistemaDao sistemaDao;

    public void setSistemaDao(SistemaDao sistemaDao) {
        this.sistemaDao = sistemaDao;
    }

    public SistemaDao getSistemaDao() {
        return sistemaDao;
    }
}
