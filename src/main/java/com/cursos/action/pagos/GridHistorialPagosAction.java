package com.cursos.action.pagos;

import com.cursos.model.PagosModel;
import com.cursos.model.UserModel;
import com.cursos.service.pagos.PagosService;
import com.cursos.to.PagosTo;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * Created by Cesar on 25/08/2014.
 */
public class GridHistorialPagosAction extends ActionSupport {
    // Your result List
    private List<PagosModel> gridModel;
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
    private List<PagosModel> myCustomers;
    private UserModel userModel;
    private PagosService pagosService;
    private PagosTo pagosTo;


    public String execute() {
        return SUCCESS;
    }

    public String editar() {
        return SUCCESS;
    }

    public String cargar() {

        myCustomers = new ArrayList<PagosModel>();

        try {
            // Count all record (select count(*) from your_custumers)
            /*records = pagosService.getContadorAllPagosByUser(userModel.getId());*/

            if (totalrows != null) {
                records = totalrows;
            }

            // Calucalate until rows ware selected
            int to = (rows * page);

            // Calculate the first row to read
            int from = to - rows;

            // Set to = max rows
            if (to > records) to = records;

            /*Se valida que venga del administrador para mostrar todos los usuarios*/
            if (userModel.getId() == -989) {
                if (pagosTo == null || pagosTo.getModoPago().equals("0") || pagosTo.getModoPago().equals("")) {
                    myCustomers = pagosService.getHistorialPagosAllUsuarios();
                } else {
                    myCustomers = pagosService.getHistorialPagosBAllUsuariosAndStatus(pagosTo.getModoPago());
                }

            } else {
                if (userModel.getId() > 0) {
                    if (pagosTo == null || pagosTo.getModoPago().equals("0") || pagosTo.getModoPago().equals("")) {
                        myCustomers = pagosService.getHistorialPagosByUsuario(userModel.getId());
                    } else {
                        myCustomers = pagosService.getHistorialPagosByUsuarioAndStatus(pagosTo.getModoPago(), userModel.getId());
                    }


                }

            }


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
    public List<PagosModel> getGridModel() {
        return gridModel;
    }

    /**
     * @param gridModel an collection that contains the actual data
     */
    public void setGridModel(List<PagosModel> gridModel) {
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

    public List<PagosModel> getMyCustomers() {
        return myCustomers;
    }

    public void setMyCustomers(List<PagosModel> myCustomers) {
        this.myCustomers = myCustomers;
    }

    public UserModel getUserModel() {
        return userModel;
    }

    public void setUserModel(UserModel userModel) {
        this.userModel = userModel;
    }

    public PagosService getPagosService() {
        return pagosService;
    }

    public void setPagosService(PagosService pagosService) {
        this.pagosService = pagosService;
    }

    public PagosTo getPagosTo() {
        return pagosTo;
    }

    public void setPagosTo(PagosTo pagosTo) {
        this.pagosTo = pagosTo;
    }
}


