<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 07/09/2014
  Time: 05:57 PM
  To change this template use File | Settings | File Templates.

JSP en el cual el administrador introduce el numero de cedula del usuario
 y luego este puede inscribir a us representados en los diferentes talleres
 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>

    <script>
        function inscribirTallerFunction(element) {
            $("#hiddenAlumnoModel").val(element);
            $("#formInsribirTaller").submit();
        }
    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>

<div class="tituloRepresentante">
    REPRESENTANTE: <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>
    C&eacute;dula: <s:property value="userModel.cedula"/>
    Tel&eacute;fono: <s:property value="userModel.telefono1"/>
</div>
</br>
</br>
<%--<div class="mostrarRepresentados">
    <div class="infoRepresentado">
        <table>
        </table>
        <s:iterator value="userModel.alumnoModelSet" var="iteradorAlumnnos" status="statusAlumnos">
        <a>Nombre: <s:property value="nombre"/></a></br>
        <a>Apellido: <s:property value="apellido"/></a></br>
        <a>Edad: <s:property value="edad"/></a></br>
        <a>Grado: <s:property value="grado"/><s:property value="seccion"/></a></br>
            <s:iterator value="alumnoTallerModelSet" var="iteradorTalleres" status="statusTalleres">
                <td><label><s:property value="tallerModel.name"/></label></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{septiembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{octubre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{noviembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{diciembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{enero}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{febrero}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{marzo}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{abril}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{mayo}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{junio}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{julio}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{agosto}"/></td>
            </s:iterator>
    </div>
    </br>
    </br>
    </s:iterator>
</div>--%>
<s:property value="usermodel.id"/>
<s:url id="remoteurl" action="cargarPagosJson" namespace="/usuario/pagos">
    <s:param name="userModel.id">
        <s:property value="userModel.id"/>
    </s:param>
</s:url>

<%--<s:url id="remoteurl" action="loadPurchaseOrderProductDetailWithStockJson" namespace="/purchase">
    <s:param name="selectedPurchaseOrderDistributor"><s:property
            value="selectedPurchaseOrderDistributor"/></s:param>
</s:url>--%>

<s:url id="editCellUrl" action="executePagos" namespace="/usuario/pagos"/>

<sjg:grid
        id="pagosGrid"
        caption="Pagos"
        href="%{remoteurl}"
        editurl="%{editCellUrl}"
        gridModel="gridModel"
        dataType="json"
        onchange="getTriggerEnter()"
        cellEdit="true"
        altRows="true"
        autowidth="true"
        groupField="['alumnoModel.nombre']"
        groupCollapse="false"
        groupText="['Representado: <b>{0}']"
        >

<%----%>


<%--        <sjg:gridColumn name="alumnoModel.nombre"
                        title="Representado"
                        index="alumno"
                        align="center"/>--%>

    <sjg:gridColumn name="tallerModel.name"
                    title="Taller"
                    index="taller"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="enero"
                    title="Enero"
                    index="enero"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="febrero"
                    title="Febrero"
                    index="febrero"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="marzo"
                    title="Marzo"
                    index="marzo"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="abril"
                    title="Abril"
                    index="abril"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="mayo"
                    title="Mayo"
                    index="mayo"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="junio"
                    title="Junio"
                    index="junio"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="julio"
                    title="Julio"
                    index="julio"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="agosto"
                    title="Agosto"
                    index="agosto"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="septiembre"
                    title="Septiembre"
                    index="septiembre"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="octubre"
                    title="Octubre"
                    index="octubre"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="noviembre"
                    title="Noviembre"
                    index="noviembre"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>
    <sjg:gridColumn name="diciembre"
                    title="Diciembre"
                    index="diciembre"
                    editable="true"
                    formatter="checkbox"
                    edittype="checkbox"
                    editoptions="{ value:'True:False'}"
                    align="center"
                    sortable="false"/>

</sjg:grid>

<s:form action="cargarTallerInscribirTaller" namespace="/usuario/taller" id="formInsribirTaller">
    <s:hidden name="alumnoModel.id" id="hiddenAlumnoModel"/>
</s:form>
</body>
</html>
