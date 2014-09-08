package com.cursos.service.taller;

import com.cursos.dao.taller.TallerDao;
import com.cursos.model.TallerModel;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Cesar on 03/08/2014.
 */
@Transactional
public class TallerService {


    private TallerDao tallerDao;

    public void setTallerDao(TallerDao tallerDao) {
        this.tallerDao = tallerDao;
    }

    public TallerDao getTallerDao() {
        return tallerDao;
    }


    public List<TallerModel> getAllTaller() throws Exception{
        return tallerDao.getTallers();
    }

    public TallerModel getTallerById(Integer id) throws Exception {
        return tallerDao.getTallerById(id);
    }


    public void guardarTaller(TallerModel tallerModel){
        tallerDao.saveTaller(tallerModel);
    }

    public void eliminarTaller(TallerModel tallerModel) throws Exception {
        tallerModel = getTallerById(tallerModel.getId());
        tallerDao.eliminarTaller(tallerModel);
    }

    public void updateTaller(TallerModel tallerModel) {
        tallerDao.updateTaller(tallerModel);
    }

    public List<TallerModel> getTalleresNoInscritos(int idRepresentado) throws Exception{
        return tallerDao.getTalleresNoInscritos(idRepresentado);
    }
}
