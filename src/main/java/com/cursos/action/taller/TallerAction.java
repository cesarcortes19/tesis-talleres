package com.cursos.action.taller;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Cesar on 27/07/2014.
 */
public class TallerAction extends ActionSupport{

    public String cargar(){
        return "tallerPrincipal";
    }

    public String crear(){
        return SUCCESS;
    }
}
