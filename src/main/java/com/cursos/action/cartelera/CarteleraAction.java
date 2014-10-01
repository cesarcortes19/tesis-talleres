package com.cursos.action.cartelera;

import com.cursos.model.NoticiaModel;
import com.cursos.service.cartelera.CarteleraService;
import com.opensymphony.xwork2.ActionSupport;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 * Created by Cesar on 29/06/14.
 */
public class CarteleraAction extends ActionSupport{


    private List<NoticiaModel> noticiaList;
    private NoticiaModel noticiaModel;
    private CarteleraService carteleraService;
    private String idNoticia;
    private String error;
    private File fileUpload;

    public String execute(){
        return SUCCESS;
    }
    public String crear(){
        return "carteleraCrear";
    }

    public String cargar(){
    try {
        if(error!=null)
        {
            addActionMessage(error);
        }
            noticiaList = carteleraService.getNoticias(null,null);

        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "carteleraPrincipal";
    }

    public String cargarEliminar(){
    try {
            noticiaList = carteleraService.getNoticias(null,null);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "carteleraEliminar";
    }

    public String eliminar(){
        try {
            carteleraService.eliminarNoticia(Integer.parseInt(idNoticia));
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarEliminarCartelera";
    }

    public String guardar(){
        try {
            Path path = Paths.get(fileUpload.getPath());
            byte[] data = Files.readAllBytes(path);
            noticiaModel.setPicture(data);
            carteleraService.guardar(noticiaModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarCartelera";
    }

    public void setCarteleraService(CarteleraService carteleraService) {
        this.carteleraService = carteleraService;
    }

    public CarteleraService getCarteleraService() {
        return carteleraService;
    }

    public List<NoticiaModel> getNoticiaList() {
        return noticiaList;
    }

    public void setNoticiaList(List<NoticiaModel> noticiaList) {
        this.noticiaList = noticiaList;
    }

    public String getIdNoticia() {
        return idNoticia;
    }

    public void setIdNoticia(String idNoticia) {
        this.idNoticia = idNoticia;
    }

    public NoticiaModel getNoticiaModel() {
        return noticiaModel;
    }

    public void setNoticiaModel(NoticiaModel noticiaModel) {
        this.noticiaModel = noticiaModel;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public File getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(File fileUpload) {
        this.fileUpload = fileUpload;
    }
}
