package com.cursos.to;

import net.sf.jasperreports.engine.JasperPrint;

/**
 * Created by Cesar on 21/10/2014.
 */
public class ReporteTo {
    private String seccion;
    private String grado;
    private String taller;
    private JasperPrint jasperPrint;
    private String nombre;
    private String fileReportName;

    public String getSeccion() {
        return seccion;
    }

    public void setSeccion(String seccion) {
        this.seccion = seccion;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public String getTaller() {
        return taller;
    }

    public void setTaller(String taller) {
        this.taller = taller;
    }

    public JasperPrint getJasperPrint() {
        return jasperPrint;
    }

    public void setJasperPrint(JasperPrint jasperPrint) {
        this.jasperPrint = jasperPrint;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getFileReportName() {
        return fileReportName;
    }

    public void setFileReportName(String fileReportName) {
        this.fileReportName = fileReportName;
    }
}
