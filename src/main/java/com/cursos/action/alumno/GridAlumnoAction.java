package com.cursos.action.alumno;

import com.cursos.model.AlumnoModel;
import com.cursos.service.alumno.AlumnoService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Cesar on 17/08/2014.
 */


public class GridAlumnoAction extends ActionSupport {
    // Your result List
    private List<AlumnoModel> gridModel;
    // get how many rows we want to have into the grid - rowNum attribute in the
    // grid
    private Integer rows = 0;
    // Get the requested page. By default grid sets this to 1.
    private Integer page = 0;
    // sorting order - asc or desc
    private String sord;
    // get index row - i.e. user click to sort.
    private String sidx;
    // Search Field
    private String searchField;
    // The Search String
    private String searchString;
    // Limit the result when using local data, value form attribute rowTotal
    private Integer totalrows;
    // he Search Operation
    // ['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
    private String searchOper;
    // Your Total Pages
    private Integer total = 0;
    // All Records
    private Integer records = 0;
    private boolean loadonce = false;
    private Map<String, Object> session;
    private List<AlumnoModel> myCustomers;
    private AlumnoService alumnoService;
    private String cedulaRepresentante;


    public String execute() {
        return SUCCESS;
    }

    public String editar() {
        return SUCCESS;
    }

    public String cargar() {



        myCustomers = new ArrayList<AlumnoModel>();

        try {
            // Count all record (select count(*) from your_custumers)
            //records = alumnoService.countRows();

            if (totalrows != null) {
                records = totalrows;
            }

            // Calucalate until rows ware selected
            int to = (rows * page);

            // Calculate the first row to read
            int from = to - rows;

            // Set to = max rows
            if (to > records) to = records;


            myCustomers = alumnoService.getAlumnoByCedulaRepresentante(cedulaRepresentante);
            setGridModel(myCustomers);


            // Calculate total Pages
            total = (int) Math.ceil((double) records / (double) rows);

        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }

        return SUCCESS;
    }

    public String getJSON() {
        return execute();
    }

    /**
     * @return how many rows we want to have into the grid
     */
    public Integer getRows() {
        return rows;
    }

    /**
     * @param rows how many rows we want to have into the grid
     */
    public void setRows(Integer rows) {
        this.rows = rows;
    }

    /**
     * @return current page of the query
     */
    public Integer getPage() {
        return page;
    }

    /**
     * @param page current page of the query
     */
    public void setPage(Integer page) {
        this.page = page;
    }

    /**
     * @return total pages for the query
     */
    public Integer getTotal() {
        return total;
    }

    /**
     * @param total total pages for the query
     */
    public void setTotal(Integer total) {
        this.total = total;
    }

    /**
     * @return total number of records for the query. e.g. select count(*) from
     * table
     */
    public Integer getRecords() {
        return records;
    }


    public void setRecords(Integer records) {

        this.records = records;

        if (this.records > 0 && this.rows > 0) {
            this.total = (int) Math.ceil((double) this.records / (double) this.rows);
        } else {
            this.total = 0;
        }
    }

    /**
     * @return an collection that contains the actual data
     */
    public List<AlumnoModel> getGridModel() {
        return gridModel;
    }

    /**
     * @param gridModel an collection that contains the actual data
     */
    public void setGridModel(List<AlumnoModel> gridModel) {
        this.gridModel = gridModel;
    }

    /**
     * @return sorting order
     */
    public String getSord() {
        return sord;
    }

    /**
     * @param sord sorting order
     */
    public void setSord(String sord) {
        this.sord = sord;
    }

    /**
     * @return get index row - i.e. user click to sort.
     */
    public String getSidx() {
        return sidx;
    }

    /**
     * @param sidx get index row - i.e. user click to sort.
     */
    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSearchField() {
        return searchField;
    }

    public void setSearchField(String searchField) {
        this.searchField = searchField;
    }

    public String getSearchString() {
        return searchString;
    }

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public Integer getTotalrows() {
        return totalrows;
    }

    public void setTotalrows(Integer totalrows) {
        this.totalrows = totalrows;
    }

    public String getSearchOper() {
        return searchOper;
    }

    public void setSearchOper(String searchOper) {
        this.searchOper = searchOper;
    }

    public boolean isLoadonce() {
        return loadonce;
    }

    public void setLoadonce(boolean loadonce) {
        this.loadonce = loadonce;
    }

    public Map<String, Object> getSession() {
        return session;
    }

    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public List<AlumnoModel> getMyCustomers() {
        return myCustomers;
    }

    public void setMyCustomers(List<AlumnoModel> myCustomers) {
        this.myCustomers = myCustomers;
    }

    public void setAlumnoService(AlumnoService alumnoService) {
        this.alumnoService = alumnoService;
    }

    public AlumnoService getAlumnoService() {
        return alumnoService;
    }

    public String getCedulaRepresentante() {
        return cedulaRepresentante;
    }

    public void setCedulaRepresentante(String cedulaRepresentante) {
        this.cedulaRepresentante = cedulaRepresentante;
    }
}


