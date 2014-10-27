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
        function inscribirTallerFunction(element) {
            $("#hiddenAlumnoModel").val(element);
            $("#formInsribirTaller").submit();
        }

        function desinscribirTaller(element) {
            if(confirm("\u00BFEst\u00e1 seguro que desea retirar el taller?")){
                $("#hiddenAlumnoModelDesinscribir").val(element);
                $("#formDesinscribirTaller").submit();
            }
        }
    </script>
</head>
<body>

<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Telefono:</b>
    <s:property value="userModel.telefono1"/>
</div>
</br>
</br>
<div class="mostrarRepresentados">

    <table class="mostrarCurso" align="center" width="80%">
        <s:iterator value="userModel.alumnoModelSet" var="iteradorAlumnnos" status="statusAlumnos">

        <s:if test="%{#statusAlumnos.index%2 == 0}">
        </tr>
        <tr>
            </s:if>
            <td style="vertical-align: top">
                <div class="infoRepresentado">
                    <a><b>Nombre:</b> <s:property value="nombre"/></a></br>
                    <a><b>Apellido:</b> <s:property value="apellido"/></a></br>
                    <a><b>Edad:</b> <s:property value="edad"/></a></br>
                    <a><b>Grado:</b> <s:property value="grado"/><s:property value="seccion"/></a></br></br>
                    <a style="background-color:gainsboro">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                        <b>Talleres Inscritos</b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a></br></br>
                    <table id="tablaTalleres" border="0" width="100%">
                        <s:iterator value="alumnoTallerModelSet" var="iteradorTalleresAlumno"
                                    status="statusTalleresAlumno">
                            <tr>
                                <td>
                                    <b>Taller:</b><s:property value="tallerModel.name"/></td>
                                <td align="right">
                                    <s:if test="%{#iteradorTalleresAlumno.fechaDesinscripcion != ''}">
                                        <div class="botones2">
                                            <sj:a id="desinscribir%{#iteradorTalleresAlumno.id}" button="true"
                                                  buttonIcon="ui-icon-circle-close"
                                                  onclick="desinscribirTaller(%{#iteradorTalleresAlumno.id})">Desinscribir</sj:a>
                                        </div>
                                    </s:if>
                                    <s:else>
                                        <a style="color: red">Desinscrito el: <s:property value="fechaDesinscripcion"/></a>
                                    </s:else>

                                    <!--a href="#" class="ui-button-icon-primary ui-icon ui-icon-circle-close" onclick="desinscribirTaller('<!--s:property value="tallerModel.id"/>')"></a-->
                                </td>
                            </tr>
                        </s:iterator>
                    </table>
                    <br>
                    <br>

                    <div class="botones">
                        <sj:a id="inscribir%{#iteradorAlumnnos.id}" button="true" buttonIcon="ui-icon-circle-check"
                              value="Save"
                              onclick="inscribirTallerFunction('%{#iteradorAlumnnos.id}');">Inscribir nuevo taller</sj:a>
                    </div>
                </div>
                </br>
                </br>
            </td>
            </s:iterator>
        </tr>
    </table>
</div>


<s:form action="cargarTallerInscribirTaller" namespace="/usuario/taller" id="formInsribirTaller">
    <s:hidden name="alumnoModel.id" id="hiddenAlumnoModel"/>
    <s:hidden name="userModel.cedula"/>
    <s:hidden name="userModel.id"/>
</s:form>

<s:form action="realizarDesinscripcionTaller" namespace="/usuario/taller" id="formDesinscribirTaller">
    <s:hidden name="alumnoTallerModel.id" id="hiddenAlumnoModelDesinscribir"/>
    <s:hidden name="userModel.cedula"/>
    <s:hidden name="userModel.id"/>
</s:form>

</body>
</html>
