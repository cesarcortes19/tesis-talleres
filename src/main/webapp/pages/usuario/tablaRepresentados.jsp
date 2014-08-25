<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 17/08/2014
  Time: 04:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script>
        $.subscribe('rowselect', function (event, data) {
            $("#gridinfo").html('<p>Edit Mode for Row : ' + event.originalEvent.id + '</p>');
        });
        $.subscribe('oneditsuccess', function (event, data) {
            var message = event.originalEvent.response.statusText;
            $("#gridinfo").html('<p>Status: ' + message + '</p>');
        });
        $.subscribe('rowadd', function (event, data) {
            $("#gridedittable").jqGrid('editGridRow', "new", {height: 280, reloadAfterSubmit: false});
        });
        $.subscribe('searchgrid', function (event, data) {
            $("#gridedittable").jqGrid('searchGrid', {sopt: ['cn', 'bw', 'eq', 'ne', 'lt', 'gt', 'ew']});
        });
        $.subscribe('showcolumns', function (event, data) {
            $("#gridedittable").jqGrid('setColumns', {});
        });
    </script>
</head>
<body>

<s:url id="remoteurl" action="cargarAlumnosJson" namespace="/usuario"/>
<s:url id="editurl" action="cargarAlumnosJson" namespace="/usuario"/>
<sjg:grid
        id="gridAlumnos"
        caption="Alumnos"
        dataType="json"
        href="%{remoteurl}"
        pager="false"
        navigator="false"
        navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
        navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
        navigatorEditOptions="{height:280,reloadAfterSubmit:false}"
        navigatorEdit="false"
        navigatorView="false"
        navigatorDelete="true"
        navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
        gridModel="gridModel"
        editurl="%{editurl}"
        onSelectRowTopics="rowselect"
        viewrecords="true"
        width="700"
        shrinkToFit="false"
        >
    <sjg:gridColumn name="id" frozen="true" index="id" title="ID" width="60" formatter="integer" editable="false"
                    hidden="true"/>
    <sjg:gridColumn name="nombre" frozen="true" index="nombre" title="Nombre" width="250" edittype="text"/>
    <sjg:gridColumn name="apellido" index="apellido" title="Apellido" edittype="text"/>
    <sjg:gridColumn name="apellido" index="apellido" title="Apellido"/>
    <sjg:gridColumn name="apellido" index="apellido" title="Apellido"/>
    <sjg:gridColumn name="birthday" index="birthday" title="Fecha Nacimiento" formatter="date"
                    formatoptions="{newformat : 'd.m.Y H:i', srcformat : 'Y-m-d H:i:s'}"/>
    <sjg:gridColumn name="grado" index="grado" title="Grado"/>
    <sjg:gridColumn name="seccion" index="seccion" title="Seccion"/>


</sjg:grid>
<br/>
<sj:submit id="grid_edit_addbutton" value="Agregar Alumno" onClickTopics="rowadd" button="true"/>
<br/>
<br/>
</body>
</html>
