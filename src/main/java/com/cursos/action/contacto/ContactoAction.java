package com.cursos.action.contacto;

import com.cursos.model.ContactoModel;
import com.cursos.service.contacto.ContactoService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 * Created by Christian on 20/10/2014.
 */
public class ContactoAction extends ActionSupport {
    private ContactoModel contactoModel;
    private List<ContactoModel> contactoList;
    private ContactoService contactoService;

    public String execute() {
        return SUCCESS;
    }

    public String cargarContacto(){
        try {
        contactoList = contactoService.getAllContacto();
        contactoModel = contactoList.get(0);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return SUCCESS;
    }
    public String cargarEditar() {
        contactoList = contactoService.getAllContacto();
        contactoModel = contactoList.get(0);
        return SUCCESS;
    }
    public String guardarEditar() {
        try {
            contactoService.updateContacto(contactoModel);
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
        return "cargarVerContactanos";
    }

    public ContactoModel getContactoModel() {
        return contactoModel;
    }

    public void setContactoModel(ContactoModel contactoModel) {
        this.contactoModel = contactoModel;
    }

    public List<ContactoModel> getContactoList() {
        return contactoList;
    }

    public void setContactoList(List<ContactoModel> contactoList) {
        this.contactoList = contactoList;
    }

    public ContactoService getContactoService() {
        return contactoService;
    }

    public void setContactoService(ContactoService contactoService) {
        this.contactoService = contactoService;
    }
}
