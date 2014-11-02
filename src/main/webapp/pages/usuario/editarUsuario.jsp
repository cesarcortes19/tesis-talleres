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
            if(confirm("\u00BFEst\u00e1 seguro que desea editar?")){
                var dataGrid = $("#gridAlumno").jqGrid("getRowData");
                var dataJson = JSON.stringify(dataGrid);
                $("#alumnoJson").val(dataJson);
                $("#formEditarUsuario").submit();
            }
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
    <s:form action="guardarEditarUsuario" namespace="/usuario" id="formEditarUsuario">

        <s:textfield key="usuario.form.label.nombre" name="usuarioModel.nombre" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.apellido" name="usuarioModel.apellido" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.cedula" name="usuarioModel.cedula" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.email1" name="usuarioModel.email" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.email2" name="usuarioModel.email2" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.telefono" name="usuarioModel.telefono1" cssClass="box" maxlength="250"/>
        <s:textfield key="usuario.form.label.telefono2" name="usuarioModel.telefono2" cssClass="box" maxlength="250"/>
        <s:textarea key="usuario.form.label.direccion" name="usuarioModel.direccion" cssClass="boxArea" maxlength="250"/>
        <s:textarea key="usuario.form.label.observaciones" name="usuarioModel.observaciones" cssClass="boxArea" maxlength="1800"/>
        <s:hidden name="listaAlumnoJson" id="alumnoJson"/>
    </s:form>
    </div>
    </div>

    <br/>
    <br/>

    <div class="grid">
        <s:url id="remoteurl" action="cargarAlumnosCargar" namespace="/usuario/cargar">
            <s:param name="cedulaRepresentante">
                <s:property value="usuarioModel.cedula"/>
            </s:param>
        </s:url>
        <sjg:grid
                id="gridAlumno"
                caption="Alumnos"
                dataType="json"
                href="%{remoteurl}"
                navigatorEdit="false"
                navigatorView="false"
                navigatorSearch="false"
                navigatorRefresh="false"
                gridModel="gridModel"
                width="500"
                height="100"
                pagerButtons="false"
                pagerInput="false"
                >
            <sjg:gridColumn name="id" index="id" title="Id" width="60" hidden="true"/>
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
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
        <sj:a id="editarPassword" button="true" buttonIcon="ui-icon-pencil" onclick="redireccionar()">Editar Contraseña</sj:a>
    </div>
</div>


<s:form action='cargarPasswordEditarUsuario' namespace='/usuario' id="formEditarPassword">
    <s:hidden name="usuarioModel.id" id="idUsuario"/>
    <s:hidden name="usuarioModel.cedula"/>
</s:form>
</body>
</br>
</br>
</html>