package com.cursos.action.talleres;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Cesar on 27/07/2014.
 */
public class TalleresAction extends ActionSupport{

    public String cargar(){
        return "talleresPrincipal";
    }

    public String crear(){
        return "talleresCrear";
    }
}
