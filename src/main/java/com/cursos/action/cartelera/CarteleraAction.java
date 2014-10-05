package com.cursos.action.cartelera;

import com.cursos.ViewNames;
import com.cursos.model.NoticiaModel;
import com.cursos.service.cartelera.CarteleraService;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Cesar on 29/06/14.
 */
public class CarteleraAction extends ActionSupport {


    private List<NoticiaModel> noticiaList;
    private NoticiaModel noticiaModel;
    private CarteleraService carteleraService;
    private String idNoticia;
    private String error;
    private File fileUpload;
    private Map <String, Object> model = new HashMap<String, Object>();

    public String execute() {
        return SUCCESS;
    }

    public String crear() {
        return "carteleraCrear";
    }

    public String cargar() {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        try {
            if (model.get(ViewNames.MENSAJE) != null) {
                addActionMessage((String) model.get(ViewNames.MENSAJE));
            }
            noticiaList = carteleraService.getNoticias(null, null);
            //put list images on session

            Map<Integer, byte[]> pictureMap = new HashMap<Integer, byte[]>();
            for (NoticiaModel nm : noticiaList) {
                pictureMap.put(nm.getId(), nm.getPicture());
            }
            session.removeAttribute("pictureMap");
            session.setAttribute("pictureMap", pictureMap);

        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "carteleraPrincipal";
    }

    public String cargarEliminar() {
        try {
            noticiaList = carteleraService.getNoticias(null, null);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "carteleraEliminar";
    }

    public String eliminar() {
        try {
            carteleraService.eliminarNoticia(Integer.parseInt(idNoticia));
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarEliminarCartelera";
    }

    public String guardar() {
        try {
            if(fileUpload!=null) {
                Path path = Paths.get(fileUpload.getPath());
                byte[] data = Files.readAllBytes(path);
                noticiaModel.setPicture(data);
            }
            carteleraService.guardar(noticiaModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        addActionMessage(getText("mensaje.transaccion.exitosa"));
        return "cargarCartelera";
    }

    public CarteleraService getCarteleraService() {
        return carteleraService;
    }

    public void setCarteleraService(CarteleraService carteleraService) {
        this.carteleraService = carteleraService;
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

    public Map<String, Object> getModel() {
        return model;
    }

    public void setModel(Map<String, Object> model) {
        this.model = model;
    }
}
