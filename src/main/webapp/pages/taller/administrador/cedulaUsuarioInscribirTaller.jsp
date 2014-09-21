<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
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
        function enviarCedulaFunction() {
            $("#buscarInscribirTaller").submit();
        }
    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>
<div class="formulario">
    <div id="titulo" class="TituloformInterno">
        Inscripci&oacute;n/Desinscripci&oacute;n
    <div class="formInterno">
        <s:form action="buscarInscribirTaller" namespace="/administrador/taller" id="buscarInscribirTaller">
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
