package com.cursos.action.cartelera;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by Cesar on 29/06/14.
 */
public class CarteleraAction extends ActionSupport {

    public String execute(){
        return SUCCESS;
    }

    public String cargar(){
        return "cartelera";
    }







}