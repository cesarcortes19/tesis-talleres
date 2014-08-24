package com.cursos.action.representado;

import com.cursos.service.representado.RepresentadoService;

/**
 * Created by Cesar on 17/08/2014.
 */
public class RepresentadoAction {
    private RepresentadoService representadoService;


    public void setRepresentadoService(RepresentadoService representadoService) {
        this.representadoService = representadoService;
    }

    public RepresentadoService getRepresentadoService() {
        return representadoService;
    }
}
