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
        function inscribirTallerFunction(element){
            $("#hiddenAlumnoModel").val(element);
            $("#formInsribirTaller").submit();

        }
    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>

<div class="tituloRepresentante">
    <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>
</div>
</br>
</br>
<div class="mostrarRepresentados">
    <div class="infoRepresentado">
        <s:iterator value="userModel.alumnoModelSet" var="iteradorAlumnnos" status="statusAlumnos">
        <a>Nombre: <s:property value="nombre"/></a></br>
        <a>Apellido: <s:property value="apellido"/></a></br>
        <a>Edad: <s:property value="edad"/></a></br>
        <a>Grado: <s:property value="grado"/><s:property value="seccion"/></a></br>
        <sj:a id="inscribir%{#iteradorAlumnnos.id}" button="true" buttonIcon="ui-icon-circle-check" value="Save"
              onclick="inscribirTallerFunction('%{#iteradorAlumnnos.id}');">Inscribir en Taller</sj:a>
    </div>
    </br>
    </br>
    </s:iterator>
</div>


<s:form action="cargarTallerInscribirTaller" namespace="/usuario/taller" id="formInsribirTaller">
    <s:hidden name="alumnoModel.id" id="hiddenAlumnoModel"/>
</s:form>
</body>
</html>
