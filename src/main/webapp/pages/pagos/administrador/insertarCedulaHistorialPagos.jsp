<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 14/09/2014
  Time: 02:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script>
        function enviarCedulaFunction() {
            $("#buscarUsuarioGestionarPagos").submit();
        }
    </script>
</head>
<body>


<div class="formulario">
    <div id="titulo" class="TituloformInterno">
        Gestionar Pagos
        <div class="formInterno">
            <s:form action="buscarUsuarioHistorialPagos" id="buscarUsuarioGestionarPagos" namespace="/administrador/pagos">
                <s:textfield key="taller.form.label.inscripcion.cedula" cssClass="box" name="userModel.cedula"
                             onkeypress="return onlyNumber(event);"/>
            </s:form>
        </div>
    </div>
    <div class="botones">
        <sj:a id="enviar" button="true" buttonIcon="ui-icon-check" onclick="enviarCedulaFunction();">Enviar</sj:a>
    </div>
</div>
</body>
</html>
