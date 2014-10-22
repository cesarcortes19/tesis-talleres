package com.cursos.action.reporte;

import com.cursos.model.TallerModel;
import com.cursos.service.reporte.ReporteService;
import com.cursos.service.taller.TallerService;
import com.cursos.to.ReporteTo;
import com.opensymphony.xwork2.ActionSupport;
import net.sf.jasperreports.engine.JasperExportManager;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;

/**
 * Created by Cesar on 21/10/2014.
 */
public class ReporteAction extends ActionSupport implements ServletResponseAware {

    private ReporteService reporteService;
    private TallerService tallerService;
    private List<TallerModel>tallerModelList;
    private TallerModel tallerModel;
    private ReporteTo reporteTo;
    private HttpServletResponse response;

    public String cargarReporte() throws Exception {
        tallerModelList = tallerService.getAllTaller();
        return "success";
    }

    public String generarReporte() throws Exception {

        reporteTo.setNombre("downloadReport");
        reporteTo.setFileReportName("TallerReport");
        reporteService.generarReporte(reporteTo);
        downloadReport(reporteTo);
        return "success";
    }


    public String downloadReport(ReporteTo reporteTo) throws Exception {

        File file = File.createTempFile("Download_Reporte", ".pdf");

        byte[] result = null;
        try {
            JasperExportManager.exportReportToPdfFile(reporteTo.getJasperPrint(), file.getPath());
            result = IOUtils.toByteArray(new FileInputStream(file));
            //las FileUtils de Apache son dependencia de Struts 2
            FileUtils.writeByteArrayToFile(file, result);
            response = ServletActionContext.getResponse();
            response.setContentLength(result.length);
            response.setContentType("application/pdf");
            //attachment: el fichero se ofrece para descargar
            //inline: se solicita al navegador que lo abra él mismo si tiene el plugin adecuado
            //o puede mostrar el tipo de archivo
            response.setHeader("Content-Disposition", "attachment; filename=" + reporteTo.getNombre() + ".pdf");

            ServletOutputStream out = response.getOutputStream();
            out.write(result);
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        } finally {
            try {
                if (file != null) {
                    FileUtils.forceDelete(file);
                }
            } catch (Throwable ignored) {
            }
        }
        return SUCCESS;
    }


    public void setReporteService(ReporteService reporteService) {
        this.reporteService = reporteService;
    }

    public ReporteService getReporteService() {
        return reporteService;
    }

    public void setTallerService(TallerService tallerService) {
        this.tallerService = tallerService;
    }

    public TallerService getTallerService() {
        return tallerService;
    }

    public List<TallerModel> getTallerModelList() {
        return tallerModelList;
    }

    public void setTallerModelList(List<TallerModel> tallerModelList) {
        this.tallerModelList = tallerModelList;
    }

    public TallerModel getTallerModel() {
        return tallerModel;
    }

    public void setTallerModel(TallerModel tallerModel) {
        this.tallerModel = tallerModel;
    }

    public ReporteTo getReporteTo() {
        return reporteTo;
    }

    public void setReporteTo(ReporteTo reporteTo) {
        this.reporteTo = reporteTo;
    }

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public HttpServletResponse getResponse() {
        return response;
    }

    public void setResponse(HttpServletResponse response) {
        this.response = response;
    }

}
