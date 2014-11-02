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
    <title>Editar Administrador</title>

    <script>
        function editarUsuarioFunction(){
            if(confirm("\u00BFEst\u00e1 seguro que desea editar?")){
                $("#formEditarAdministrador").submit();
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
        Editar Administrador
        <div id="formularioInterno" class="formInterno">

            <s:form action="guardarEditarAdministrador" namespace="/administrador/usuario" id="formEditarAdministrador" acceptcharset="UTF-8">

                <s:textfield key="usuario.form.label.nombre" name="usuarioModel.nombre" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.apellido" name="usuarioModel.apellido" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.cedula" name="usuarioModel.cedula" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.email1" name="usuarioModel.email" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.email2" name="usuarioModel.email2" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.telefono" name="usuarioModel.telefono1" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.telefono2" name="usuarioModel.telefono2" cssClass="box" maxlength="250"/>
                <s:textarea key="usuario.form.label.direccion" name="usuarioModel.direccion" cssClass="boxArea" maxlength="250"/>
                <s:textarea key="usuario.form.label.observaciones" name="usuarioModel.observaciones" cssClass="boxArea" maxlength="250"/>
                <s:hidden name="usuarioModel.id"/>
            </s:form>
        </div>
    </div>

    <br/>
    <br/>

    <div class="botones">
        <sj:a id="sadaszxc" button="true" buttonIcon="ui-icon-disk" onclick="editarUsuarioFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
        <sj:a id="editarPassword" button="true" buttonIcon="ui-icon-pencil" onclick="redireccionar()">Editar Contraseña</sj:a>
    </div>
</div>


<s:form action='cargarEditarPasswordAdmin' namespace='/administrador/usuario' id="formEditarPassword">
    <s:hidden name="usuarioModel.id" id="idUsuario"/>
</s:form>
</body>
</br>
</br>
</html>