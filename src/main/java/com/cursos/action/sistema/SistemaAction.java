package com.cursos.action.sistema;

import com.cursos.service.sistema.SistemaService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Cesar on 27/10/2014.
 */
public class SistemaAction extends ActionSupport {
    private SistemaService sistemaService;

    public void setSistemaService(SistemaService sistemaService) {
        this.sistemaService = sistemaService;
    }

    public SistemaService getSistemaService() {
        return sistemaService;
    }

    public String reiniciarSistema() throws Exception {
        return "success";
    }

    public String cargarReiniciarSistema() throws Exception {
        return "success";
    }
}
