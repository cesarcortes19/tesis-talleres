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
    <title></title>
</head>
<%--<sj:head jqueryui="true" jquerytheme="humanity"/>--%>
</head>
<body>

<div>
<table class="mostrarCurso" align="center" style="">

<%--
<s:iterator value="listTallerModel" step="" status="statusTaller">
    <tr>
        <s:if test="%{#statusTaller.index%2 == 0}">
            <s:if test="%{#statusTaller.index == 0}">
            </tr>
            <tr>
            </s:if>
        </s:if>
--%>
        <td>
            <div class="mostrarCurso">
                <div class="tituloTaller" style="width: auto; height: 10%"><s:property value="name"/></div>
                <sj:tabbedpanel id="localtabs">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <sj:tab id="tab3" target="tthree" label="Horarios"/>
                    <div id="tone"><s:property value="descripcion"/></div>
                    <div id="ttwo"><s:property value="horario"/></div>
                    <div id="tthree"><s:property value="cantidadAlumnosActual"/>/<s:property value="cantidadAlumnosMaxima"/></div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
            <div class="mostrarCurso">
                <div class="tituloTaller" style="width: auto; height: 10%"><s:property value="name"/></div>
                <sj:tabbedpanel id="localtabs">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <sj:tab id="tab3" target="tthree" label="Horarios"/>
                    <div id="tone"><s:property value="descripcion"/></div>
                    <div id="ttwo"><s:property value="horario"/></div>
                    <div id="tthree"><s:property value="cantidadAlumnosActual"/>/<s:property value="cantidadAlumnosMaxima"/></div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>
<%--    </s:iterator>
    </tr>--%>
</table>
    </div>

</body>
</html>
