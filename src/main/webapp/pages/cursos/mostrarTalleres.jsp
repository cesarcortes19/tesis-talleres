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
<sj:head jqueryui="true" jquerytheme="humanity"/>
</head>
<body>
<s:include value="../header.jsp"></s:include>

<div>
<table class="mostrarCurso" align="center" style="">
    <tr>
        <td>
            <div class="mostrarCurso">
                FUTBOL
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

        <td>
            <div class="mostrarCurso">
                FUTBOL
                <sj:tabbedpanel id="localtabs3">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save3" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>

        <td>
            <div class="mostrarCurso">
                FUTBOL
                <sj:tabbedpanel id="localtabs4">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save4" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="mostrarCurso">
                FUTBOL
                <sj:tabbedpanel id="localtabs5">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save5" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>

        <td>
            <div class="mostrarCurso">
                FUTBOL
                <sj:tabbedpanel id="localtab6">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save6" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>

        <td>
            <div class="mostrarCurso">
                FUTBOL
                <sj:tabbedpanel id="localtabs7">
                    <sj:tab id="tab1" target="tone" label="Descripcion"/>
                    <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                    <div id="tone">Esto es una actividad para ni;os entre 10 y 15 a;os, que tengan aptitudes para el deporte y esten interesados en el area</div>
                    <div id="ttwo">Lunes 3 - 5pm<br> Martes 5-7pm;<br> Viernes 11 - 1pm</div>
                </sj:tabbedpanel>
                <br>
                <sj:a id="save7" button="true" buttonIcon="ui-icon-disk" value="Save"
                      onclick="createBarcode();">Pre-inscribir</sj:a>
            </div>
        </td>
    </tr>
</table>
    </div>

</body>
</html>
