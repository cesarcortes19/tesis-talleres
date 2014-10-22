package com.cursos.service.reporte;

import com.cursos.dao.contacto.ContactoDao;
import com.cursos.to.ReporteTo;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.HtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.export.Exporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimpleHtmlExporterOutput;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Cesar on 21/10/2014.
 */
public class ReporteService {

    private DriverManagerDataSource dataSource;
    private static URL pathReport = Thread.currentThread().getContextClassLoader().getResource("reportsFiles");

    public void generarReporte(ReporteTo reporteTo) throws Exception {
        String path;
        Map parameters = new HashMap();

        /*setear parametros de busqueda*/
        path = URLDecoder.decode(pathReport.getPath(), "UTF-8")+reporteTo.getFileReportName();
        parameters.put("taller", reporteTo.getTaller());
        parameters.put("grado", reporteTo.getGrado());
        parameters.put("seccion", reporteTo.getSeccion());

        JasperReport reporte = (JasperReport) JRLoader.loadObject(new File(path));
        reporteTo.setJasperPrint(JasperFillManager.fillReport(reporte, parameters, dataSource.getConnection()));

        reporteTo.setNombre("download_report");
    }

    public void setDataSource(DriverManagerDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public DriverManagerDataSource getDataSource() {
        return dataSource;
    }
}
