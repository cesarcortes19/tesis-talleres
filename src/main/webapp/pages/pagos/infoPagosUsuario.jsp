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
        <table>
        </table>
        <s:iterator value="userModel.alumnoModelSet" var="iteradorAlumnnos" status="statusAlumnos">
        <a>Nombre: <s:property value="nombre"/></a></br>
        <a>Apellido: <s:property value="apellido"/></a></br>
        <a>Edad: <s:property value="edad"/></a></br>
        <a>Grado: <s:property value="grado"/><s:property value="seccion"/></a></br>
            <s:iterator value="alumnoTallerModelSet" var="iteradorTalleres" status="statusTalleres">
                <td><label><s:property value="tallerModel.name"/></label></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{septiembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{octubre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{noviembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{diciembre}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{enero}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{febrero}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{marzo}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{abril}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{mayo}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{junio}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{julio}"/></td>
                <td><s:checkbox theme="simple" name="checkBoxSelected"
                                id="%{id}" value="%{agosto}"/></td>
            </s:iterator>
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