<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 19/07/2014
  Time: 08:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<html>
<head>
    <title>Talleres</title>
</head>
<%--<sj:head jqueryui="true" jquerytheme="humanity"/>--%>
</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Talleres
    </div>
</div>

    <div>
        <table class="mostrarCurso" align="center">

            <s:iterator value="tallerList" var="iteradorTaller" status="statusTaller">
            <s:if test="%{#statusTaller.index%3 == 0}">
            </tr>
            <tr>
                </s:if>
                <td>
                    <div class="mostrarCurso">
                        <div class="tituloTaller" style="width: auto; height: 10%"><s:property value="name"/></div>
                        <sj:tabbedpanel id="%{#iteradorTaller.id}">
                            <sj:tab id="tab1" target="tone" label="Descripcion"/>
                            <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                            <sj:tab id="tab3" target="tthree" label="Alumnos"/>
                            <div id="tone"><s:property value="descripcion"/></div>
                            <div id="ttwo"><s:property value="horario"/></div>
                            <div id="tthree"><s:property value="cantidadAlumnosactual"/>/<s:property
                                    value="cantidadAlumnosMaxima"/> Alumnos</div>
                        </sj:tabbedpanel>
                        <br>
                    </div>
                </td>
                </s:iterator>
            </tr>
        </table>
    </div>


</body>
</html>
