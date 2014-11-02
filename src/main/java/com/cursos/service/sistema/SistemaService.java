package com.cursos.service.sistema;

import com.cursos.dao.alumno.AlumnoDao;
import com.cursos.dao.cartelera.CarteleraDao;
import com.cursos.dao.pagos.DetallePagosDao;
import com.cursos.dao.pagos.PagosDao;
import com.cursos.dao.sistema.SistemaDao;
import com.cursos.dao.taller.AlumnoTallerDao;
import com.cursos.dao.taller.TallerDao;
import com.cursos.dao.usuario.UsuarioDao;
import com.cursos.model.ConfiguracionModel;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * Created by Cesar on 27/10/2014.
 */
@Transactional
public class SistemaService {
    private SistemaDao sistemaDao;
    private DriverManagerDataSource dataSource;
    private CarteleraDao carteleraDao;
    private UsuarioDao usuarioDao;
    private AlumnoDao alumnoDao;
    private TallerDao tallerDao;
    private AlumnoTallerDao alumnoTallerDao;
    private PagosDao pagosDao;
    private DetallePagosDao detallePagosDao;

    public void setSistemaDao(SistemaDao sistemaDao) {
        this.sistemaDao = sistemaDao;
    }

    public SistemaDao getSistemaDao() {
        return sistemaDao;
    }

    public void reiniciarSistema() throws Exception {
        try {
            ConfiguracionModel configuracionModel = sistemaDao.getConfigurationModel();
            DateFormat dateFormat = new SimpleDateFormat("yyyy");
            Date date = new Date();
            String respaldoDBname = "dbTalleres"+dateFormat.format(date)+".sql";
            respaldoDBname = configuracionModel.getCarpetaScriptRespaldo() +respaldoDBname;
            Process process  = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","mysqldump -u "+dataSource.getUsername()+" -p"+dataSource.getPassword()+" db_taller -r "+respaldoDBname});
            InputStream is = process.getInputStream();
            int in = -1;
            while ((in = is.read()) != -1) {
                System.out.print((char)in);
            }
            borrarDataBd();

        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public void borrarDataBd() throws Exception{
        try {
            detallePagosDao.borrarTODOS();
            pagosDao.borrarTODOS();
            alumnoTallerDao.borrarTODOS();
            tallerDao.borrarTODOS();
            alumnoDao.borrarTODOS();
            usuarioDao.borrarTODOS();
            carteleraDao.borrarTODOS();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
    }

    public ConfiguracionModel getConfiguracion(){
        return sistemaDao.getConfigurationModel();
    }

    public void setDataSource(DriverManagerDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DriverManagerDataSource getDataSource() {
        return dataSource;
    }

    public void setCarteleraDao(CarteleraDao carteleraDao) {
        this.carteleraDao = carteleraDao;
    }

    public CarteleraDao getCarteleraDao() {
        return carteleraDao;
    }

    public void setUsuarioDao(UsuarioDao usuarioDao) {
        this.usuarioDao = usuarioDao;
    }

    public UsuarioDao getUsuarioDao() {
        return usuarioDao;
    }

    public void setAlumnoDao(AlumnoDao alumnoDao) {
        this.alumnoDao = alumnoDao;
    }

    public AlumnoDao getAlumnoDao() {
        return alumnoDao;
    }

    public void setTallerDao(TallerDao tallerDao) {
        this.tallerDao = tallerDao;
    }

    public TallerDao getTallerDao() {
        return tallerDao;
    }

    public void setAlumnoTallerDao(AlumnoTallerDao alumnoTallerDao) {
        this.alumnoTallerDao = alumnoTallerDao;
    }

    public AlumnoTallerDao getAlumnoTallerDao() {
        return alumnoTallerDao;
    }

    public void setPagosDao(PagosDao pagosDao) {
        this.pagosDao = pagosDao;
    }

    public PagosDao getPagosDao() {
        return pagosDao;
    }

    public void setDetallePagosDao(DetallePagosDao detallePagosDao) {
        this.detallePagosDao = detallePagosDao;
    }

    public DetallePagosDao getDetallePagosDao() {
        return detallePagosDao;
    }
}
