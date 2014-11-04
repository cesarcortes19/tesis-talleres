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
                    <div class="tituloTaller" style="width: auto; height: 10%; font-size: 14pt ">
                        <s:property value="name"/>
                    </div>
                    <div class="tituloTaller" style="width: auto; height: 100px">

                        <s:if test="%{picture!=null}">
                            <img id="idImageToShow<s:property value="id"/>" src="
                                <s:url namespace="/todos/Image" action='ImageAction'>
                                    <s:param name="imageId"><s:property value="id"/></s:param>
                                </s:url>
                            " width="100px" height="100px"/>
                        </s:if>
                        <s:else>
                            <img id="idImageToShow<s:property value="id"/>" src="<s:url value="/resources/images/Logo_Ceapucv2.jpg"/>" width="100px"
                                 height="100px"/>
                        </s:else>
                    </div>
                    <sj:tabbedpanel id="%{#iteradorTaller.id}">
                        <sj:tab id="tab1" target="tone" label="Descripción"/>
                        <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                        <sj:tab id="tab3" target="tthree" label="Alumnos"/>
                        <div id="tone" style="height: 150px; overflow: scroll;">
                            <b>Costo inscripci&oacute;n:</b> <s:property value="costo"/> Bs.<br><br>
                            <b>Costo mensualidad:</b> <s:property value="costoInscripcion"/> Bs.<br><br>
                            <s:property value="descripcion"/>
                        </div>
                        <div id="ttwo" style="height: 150px; overflow: scroll;">
                            <s:if test="%{horarioLunes!=''}">
                                <b>Lunes:</b> <s:property value="horarioLunes"/><br><br>
                            </s:if>
                            <s:if test="%{horarioMartes!=''}">
                                <b>Martes:</b> <s:property value="horarioMartes"/><br><br>
                            </s:if>
                            <s:if test="%{horarioMiercoles!=''}">
                                <b>Mi&eacute;rcoles:</b> <s:property value="horarioMiercoles"/><br><br>
                            </s:if>
                            <s:if test="%{horarioJueves!=''}">
                                <b>Jueves:</b> <s:property value="horarioJueves"/><br><br>
                            </s:if>
                            <s:if test="%{horarioViernes!=''}">
                                <b>Viernes: </b><s:property value="horarioViernes"/><br><br>
                            </s:if>

                        </div>
                        <div id="tthree" style="height: 150px; overflow: scroll;">
                            <b>Cupos:</b> <s:property value="cantidadAlumnosactual"/>/<s:property
                                value="cantidadAlumnosMaxima"/> Alumnos
                        </div>
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
