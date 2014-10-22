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
            if(confirm("¿Está seguro que desea editar?")){
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

            <s:form action="guardarEditarAdministrador" namespace="/administrador/usuario" id="formEditarAdministrador">

                <s:textfield key="usuario.form.label.nombre" name="usuarioModel.nombre" cssClass="box"/>
                <s:textfield key="usuario.form.label.apellido" name="usuarioModel.apellido" cssClass="box"/>
                <s:textfield key="usuario.form.label.cedula" name="usuarioModel.cedula" cssClass="box"/>
                <s:textfield key="usuario.form.label.email1" name="usuarioModel.email" cssClass="box"/>
                <s:textfield key="usuario.form.label.email2" name="usuarioModel.email2" cssClass="box"/>
                <s:textfield key="usuario.form.label.telefono" name="usuarioModel.telefono1" cssClass="box"/>
                <s:textfield key="usuario.form.label.telefono2" name="usuarioModel.telefono2" cssClass="box"/>
                <s:textarea key="usuario.form.label.direccion" name="usuarioModel.direccion" cssClass="boxArea"/>
                <s:textarea key="usuario.form.label.observaciones" name="usuarioModel.observaciones" cssClass="boxArea"/>
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