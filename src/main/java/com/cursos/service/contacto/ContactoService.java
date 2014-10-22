package com.cursos.service.contacto;

import com.cursos.dao.contacto.ContactoDao;
import com.cursos.model.ContactoModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Christian on 20/10/2014.
 */
@Transactional
public class ContactoService {
    private ContactoDao contactoDao;


    public List<ContactoModel> getAllContacto(){
        return contactoDao.getContactos();
    }

    public void updateContacto(ContactoModel contactoModel){
        contactoDao.updateContacto(contactoModel);
    }

    public ContactoDao getContactoDao() {
        return contactoDao;
    }

    public void setContactoDao(ContactoDao contactoDao) {
        this.contactoDao = contactoDao;
    }
}
