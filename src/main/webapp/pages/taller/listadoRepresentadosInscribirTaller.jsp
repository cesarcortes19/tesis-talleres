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

        function desinscribirTaller(element){
            $("#hiddenAlumnoModelDesinscribir").val(element);
            $("#formDesinscribirTaller").submit();
        }
    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>

<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Telefono:</b> <s:property value="userModel.telefono1"/>
</div>
</br>
</br>
<div class="mostrarRepresentados">

    <s:iterator value="userModel.alumnoModelSet" var="iteradorAlumnnos" status="statusAlumnos">
    <div class="infoRepresentado">
        <a><b>Nombre:</b> <s:property value="nombre"/></a></br>
        <a><b>Apellido:</b> <s:property value="apellido"/></a></br>
        <a><b>Edad:</b> <s:property value="edad"/></a></br>
        <a><b>Grado:</b> <s:property value="grado"/><s:property value="seccion"/></a></br></br>
            <a>-----------------<b>Talleres Inscritos</b>-----------------</a></br></br>
            <table id="tablaTalleres" border="0">
            <s:iterator value="alumnoTallerModelSet" var="iteradorTalleresAlumno" status="statusTalleresAlumno">
            <tr>
                <td>
                <b>Taller:</b><s:property value="tallerModel.name"/></td>
                <td><div class="botones2">
                    <sj:a id="desinscribir%{#iteradorTalleresAlumno.id}" button="true" buttonIcon="ui-icon-circle-close"
                          onclick="desinscribirTaller('%{#iteradorAlumnnos.tallerModel.id}')">Desinscribir</sj:a>
                    </div>

                    <!--a href="#" class="ui-button-icon-primary ui-icon ui-icon-circle-close" onclick="desinscribirTaller('<!--s:property value="tallerModel.id"/>')"></a-->
                </td>
            </tr>
            </s:iterator>
            </table>
            <br>
            <br>
            <div class="botones">
            <sj:a id="inscribir%{#iteradorAlumnnos.id}" button="true" buttonIcon="ui-icon-circle-check" value="Save"
              onclick="inscribirTallerFunction('%{#iteradorAlumnnos.id}');">Inscribir nuevo taller</sj:a>
            </div>
    </div>
    </br>
    </br>
    </s:iterator>
</div>


<s:form action="cargarTallerInscribirTaller" namespace="/usuario/taller" id="formInsribirTaller">
    <s:hidden name="alumnoModel.id" id="hiddenAlumnoModel"/>
</s:form>

<s:form action="realizarDesinscripcionTaller" namespace="/usuario/taller" id="formDesinscribirTaller">
    <s:hidden name="alumnoTallerModel.id" id="hiddenAlumnoModelDesinscribir"/>
</s:form>

</body>
</html>
