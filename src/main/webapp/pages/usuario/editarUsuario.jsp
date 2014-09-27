<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 12/08/2014
  Time: 09:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
    <title></title>

    <script>
        function editarUsuarioFunction(){
            var dataGrid = $("#gridAlumno").jqGrid("getRowData");
            var dataJson = JSON.stringify(dataGrid);
            $("#alumnoJson").val(dataJson);
            $("#formEditarUsuario").submit();
        }
        function redireccionar(url){
            $("#formEditarPassword").submit();
        }

    </script>
</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Editar Usuario
        <div id="formularioInterno" class="formInterno">
    <s:form action="guardarEditarUsuario" namespace="/administrador/usuario" id="formEditarUsuario">

        <s:textfield key="usuario.form.label.nombre" name="usuarioModel.nombre" cssClass="box"/>
        <s:textfield key="usuario.form.label.apellido" name="usuarioModel.apellido" cssClass="box"/>
        <s:textfield key="usuario.form.label.cedula" name="usuarioModel.cedula" cssClass="box"/>
        <s:textfield key="usuario.form.label.email1" name="usuarioModel.email" cssClass="box"/>
        <s:textfield key="usuario.form.label.email2" name="usuarioModel.email2" cssClass="box"/>
        <s:textfield key="usuario.form.label.telefono" name="usuarioModel.telefono1" cssClass="box"/>
        <s:textfield key="usuario.form.label.telefono2" name="usuarioModel.telefono2" cssClass="box"/>
        <s:textarea key="usuario.form.label.direccion" name="usuarioModel.direccion" cssClass="boxArea"/>
        <s:textarea key="usuario.form.label.observaciones" name="usuarioModel.observaciones" cssClass="boxArea"/>
        <s:hidden name="listaAlumnoJson" id="alumnoJson"/>
    </s:form>
    </div>
    </div>

    <br/>
    <br/>

    <div class="grid">
        <s:url id="remoteurl" action="cargarAlumnosJson" namespace="/alumno">
            <s:param name="idRepresentante">
                <s:property value="usuarioModel.id"/>
            </s:param>
        </s:url>
        <s:url id="editurl" action="editarAlumnosJson" namespace="/alumno"/>
        <sjg:grid
                id="gridAlumno"
                caption="Alumnos"
                dataType="json"
                href="%{editurl}"
                pager="true"
                navigator="true"
                navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
                navigatorAddOptions="{height:280,reloadAfterSubmit:false,fontSize:12, fontSizeAdjust:12 }"
                navigatorEdit="false"
                navigatorView="false"
                navigatorDelete="true"
                navigatorSearch="false"
                navigatorRefresh="false"
                navigatorViewOptions="true"
                navigatorDeleteOptions="{height:280}"
                gridModel="gridModel"
                editurl="%{editurl}"
                onSelectRowTopics="rowselect"
                viewrecords="true"
                width="500"
                height="100"
                pagerButtons="false"
                rowNum="3"
                pagerInput="false"
                >
            <sjg:gridColumn name="ID" index="id" title="ID" width="60" hidden="true"/>
            <sjg:gridColumn name="nombre" frozen="true" index="nombre" title="Nombre" width="200"
                            editable="true" edittype="text" sortable="false"/>
            <sjg:gridColumn name="apellido" index="apellido" title="Apellido" editable="true" edittype="text"
                            width="200" sortable="false"/>
            <sjg:gridColumn name="grado" index="grado" title="Grado" editable="true" sortable="false"/>
            <sjg:gridColumn name="seccion" index="seccion" title="Seccion" editable="true" sortable="false"/>
            <sjg:gridColumn name="edad" index="edad" title="Edad" formatter="integer" editable="true" sortable="false"/>
            <%--<sjg:gridColumn name="birthday" index="birthday" title="Fecha Nacimiento" formatter="date"
                            formatoptions="{newformat : 'd.m.Y H:i', srcformat : 'Y-m-d H:i:s'}" editable="true"/>--%>
        </sjg:grid>


        <br/>
    </div>


    <div class="botones">
        <sj:a id="sadaszxc" button="true" buttonIcon="ui-icon-disk" onclick="editarUsuarioFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
        <sj:a id="editarPassword" button="true" buttonIcon="ui-icon-close" onclick="redireccionar()">Editar Contraseña</sj:a>
    </div>
</div>


<s:form action='cargarPasswordEditarUsuario' namespace='/usuario' id="formEditarPassword">
    <s:hidden name="usuarioModel.id" id="idUsuario"/>
</s:form>
</body>
</br>
</br>
</html>