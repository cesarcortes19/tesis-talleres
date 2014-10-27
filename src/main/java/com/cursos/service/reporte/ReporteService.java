package com.cursos.service.reporte;

import com.cursos.dao.contacto.ContactoDao;
import com.cursos.dao.reporte.ReporteDao;
import com.cursos.model.AlumnoTallerModel;
import com.cursos.to.AlumnoTallerTo;
import com.cursos.to.ReporteTo;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

/**
 * Created by Cesar on 21/10/2014.
 */
@Transactional
public class ReporteService {

    private DriverManagerDataSource dataSource;
    private static URL pathReport = Thread.currentThread().getContextClassLoader().getResource("reportsFiles");
    private ReporteDao reporteDao;

    public boolean generarReporte(ReporteTo reporteTo) throws Exception {
        String path;
        Map parameters = new HashMap();
        Path currentRelativePath = Paths.get("");
        String filePath = ServletActionContext.getServletContext().getRealPath("");
        InputStream is = new FileInputStream(filePath+"\\resources\\images\\Logo_Ceapucv2.jpg");

        List<AlumnoTallerTo> alumnoTallerModels
                = obtenerAlumnosParaReporte(Integer.parseInt(reporteTo.getTaller()),reporteTo.getGrado(),reporteTo.getSeccion());
        /*setear parametros de busqueda*/
        if(alumnoTallerModels.size()==0){
            return false;
        }
        path = URLDecoder.decode(pathReport.getPath(), "UTF-8")+"ReporteTaller.jasper";
        parameters.put("alumnoTaller", alumnoTallerModels);
        parameters.put("fecha", new Date());
        parameters.put("titulo", reporteTo.getTitulo());
        parameters.put("logo", is);
        JasperReport reporte = (JasperReport) JRLoader.loadObject(new File(path));
        reporteTo.setJasperPrint(JasperFillManager.fillReport(reporte, parameters, new JREmptyDataSource()));

        reporteTo.setNombre("download_report");

        return true;
    }



    public List<AlumnoTallerTo> obtenerAlumnosParaReporte(int taller, String grado, String seccion){
        List<AlumnoTallerModel> alumnoTallerModels = new LinkedList<AlumnoTallerModel>();
        if(taller==-1){
            if(seccion.equals("")){
                alumnoTallerModels = reporteDao.getAlumnos(grado);
            }else{
                alumnoTallerModels = reporteDao.getAlumnos(grado,seccion);
            }
        }else{
            if(grado.equals("")){
                alumnoTallerModels = reporteDao.getAlumnos(taller);
            }else{
                if(seccion.equals("")){
                    alumnoTallerModels = reporteDao.getAlumnos(taller,grado);
                }else{
                    alumnoTallerModels = reporteDao.getAlumnos(taller,grado,seccion);
                }
            }
        }

        List<AlumnoTallerTo> alumnoTallerToList = new LinkedList<AlumnoTallerTo>();
        AlumnoTallerTo alumnoTallerTo;
        for(AlumnoTallerModel atm: alumnoTallerModels){
            alumnoTallerTo= new AlumnoTallerTo();
            alumnoTallerTo.setAlumnoNombre(atm.getAlumnoModel().getNombre()+" "+atm.getAlumnoModel().getApellido());
            alumnoTallerTo.setGrado(atm.getAlumnoModel().getGrado());
            alumnoTallerTo.setTaller(atm.getTallerModel().getName());
            alumnoTallerTo.setSeccion(atm.getAlumnoModel().getSeccion());
            alumnoTallerToList.add(alumnoTallerTo);
        }

        return alumnoTallerToList;
    }


    public void setDataSource(DriverManagerDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DriverManagerDataSource getDataSource() {
        return dataSource;
    }

    public void setReporteDao(ReporteDao reporteDao) {
        this.reporteDao = reporteDao;
    }

    public ReporteDao getReporteDao() {
        return reporteDao;
    }
}
