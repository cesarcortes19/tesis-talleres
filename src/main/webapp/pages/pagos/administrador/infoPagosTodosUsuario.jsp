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

    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>

<div id="selectTalleres" style="width: 50%">
    <label> Busqueda por taller: </label>
<s:select label="Busqueda por taller"
          headerValue="Seleccione un taller"
          headerKey="-1"
          list="tallerModelList"
          listKey="id"
          listValue="name"
          name="tallerModel.id" id="selectTaller"
          theme="simple"/>
</div>
<br>

<br>
<s:url id="remoteurl" action="cargarPagosJson" namespace="/administrador/pagos">
</s:url>

<div class="ajusteciente">
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
            groupField="['alumnoModel.userModel.userInfo']"
            groupCollapse="false"
            groupText="['Representante: <b>{0}']"
            onGridCompleteTopics="grid_complete"
            >


        <sjg:gridColumn name="id"
                        title=""
                        index="id"
                        align="center"
                        hidden="true"/>

        <sjg:gridColumn name="alumnoModel.nombre"
                        title="Representado"
                        index="representado"
                        align="center"
                        />

        <sjg:gridColumn name="alumnoModel.userModel.userInfo"
                        title=" "
                        index="usuario"
                        align="center"
                        width="1"/>

        <sjg:gridColumn name="tallerModel.name"
                        title="Taller"
                        index="taller"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="enero"
                        title="Ene"
                        index="enero"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="febrero"
                        title="Feb"
                        index="febrero"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="marzo"
                        title="Mar"
                        index="marzo"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="abril"
                        title="Abr"
                        index="abril"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="mayo"
                        title="May"
                        index="mayo"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="junio"
                        title="Jun"
                        index="junio"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="julio"
                        title="Jul"
                        index="julio"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="agosto"
                        title="Ago"
                        index="agosto"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="septiembre"
                        title="Sep"
                        index="septiembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="octubre"
                        title="Oct"
                        index="octubre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="noviembre"
                        title="Nov"
                        index="noviembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="diciembre"
                        title="Dic"
                        index="diciembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="costo"
                        title="Costo"
                        index="costo"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="status"
                        title="Estado"
                        index="status"
                        editable="true"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="fechaDesinscripcion"
                        title="Desinscripci"
                        index="fechaDesinscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        hidden="true"/>

        <sjg:gridColumn name="fechaInscripcion"
                        title="Inscripci&oacuten"
                        index="fechaInscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        hidden="true"/>

    </sjg:grid>

</div>
</body>
</html>
