package com.cursos.service.pagos;

import com.cursos.dao.pagos.PagosDao;
import com.cursos.model.PagosModel;
import org.hibernate.Hibernate;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Cesar on 14/09/2014.
 */
@Transactional
public class PagosService {
    private PagosDao pagosDao;

    public void setPagosDao(PagosDao pagosDao) {
        this.pagosDao = pagosDao;
    }

    public PagosDao getPagosDao() {
        return pagosDao;
    }

    public List<PagosModel> getHistorialPagosAllUsuarios() throws Exception{

        List<PagosModel> pagosModels = pagosDao.getHistorialPagosAllUsuarios();
        for(PagosModel pagosModel:pagosModels ){
            Hibernate.initialize(pagosModel.getUserModel());
        }

        return pagosModels;
    }

    public List<PagosModel> getHistorialPagosByUsuario(int id) throws Exception{
        return pagosDao.getHistorialPagosByUsuario(id);
    }
}
