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

    <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
        <li>
            <p class="noticia">
                <a href="#" onclick="mostrarDetalle('<s:property value="descripcion"/>')"><s:property value="titulo"/></a>
                <a class="fechaNoticia"></br>(<s:property value="fechaCreacion"/>)</a>
            <p>
        </li>
    </s:iterator>

<s:iterator value="listTallerModel" step="" status="statusTaller">
    <tr>
    <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
        <s:if test="%{#statusTaller.index%2 == 0}">
            </tr>
            <tr>
        </s:if>
        <td>
            <div class="mostrarCurso">
                <div class="tituloTaller" style="width: auto; height: 10%">FUTBOL</div>
                <sj:tabbedpanel id="localtabs">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>


    </s:iterator>
</table>
    </div>

</body>
</html>
