package com.cursos.action.sistema;

import com.cursos.ViewNames;
import com.cursos.service.sistema.SistemaService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Cesar on 27/10/2014.
 */
public class SistemaAction extends ActionSupport {
    private SistemaService sistemaService;

    public SistemaService getSistemaService() {
        return sistemaService;
    }

    public void setSistemaService(SistemaService sistemaService) {
        this.sistemaService = sistemaService;
    }

    public String cargarReiniciarSistema() throws Exception {
        return "success";
    }

    public String reiniciarSistema() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        if (request.isUserInRole(ViewNames.ADMINISTRADOR)) {
            sistemaService.reiniciarSistema();
        }
        return "success";
    }
}
