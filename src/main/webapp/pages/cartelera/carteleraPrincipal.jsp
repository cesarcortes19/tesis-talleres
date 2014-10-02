<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 29/06/14
  Time: 08:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .noticia:hover{
            border: 3px solid #d0d0d0;
            cursor: pointer;
        }
    </style>
    <script>
        function mostrarDetalle(element){
            $("#divDetalleNoticia").html(element);

        }

        function abrirNoticia(imagen, titulo, descripcion, fecha){

            $("#tituloNoticiaDialogo").html('<b>'+ titulo + '</b>');
            $("#descripcionNoticiaDialogo").html(descripcion);
            $("#fechaNoticiaDialogo").html('<b>'+ fecha + '</b>');
            $("#myeffectdialog").dialog('open');
        }
        </script>

    <title></title>
</head>
<body>

<div class="cartelera">

    <div id="titulo" class="TituloformInterno">
        Cartelera Informativa
    </div>

    <div>
        <table class="mostrarCurso" align="center">
            <img src="<s:url namespace="/todo/Image" action='ImageAction?imageId=darksouls.jpg' />" />
        <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
        <s:if test="%{#statusNoticia.index%3 == 0}">
            </tr>
            <tr>
            </s:if>
                    <td>
                        <div class="noticia" onclick="abrirNoticia('','<s:property value="titulo"/>','<s:property value="descripcion"/>','<s:property value="fechaCreacion"/>')">
                            <img src="<s:url value="/resources/images/Logo Ceapucv2.jpg"/>" width="100px" height="100px"/>
                            <br>
                            <div class="tituloNoticia">
                            <s:property value="titulo"/>
                            </div>
                            </br>
                            <div class="descripcionNoticia">
                            <s:property value="descripcion"/>
                            </div>
                            </br><b>(<s:property value="fechaCreacion"/>)</b>
                        </div>
                    </td>
            </s:iterator>
            </tr>
            </table>
    </div>
</div>
<div id="dialogoNoticia">
<sj:dialog id="myeffectdialog" showEffect="slide" hideEffect="explode" autoOpen="false" modal="true" title="Noticia" openTopics="openEffectDialog" closeTopics="closeEffectDialog"  minHeight="500" minWidth="500">
    <div id="imagenDialogo" class="imagenDialogo">
        <img src="<s:url value="/resources/images/Logo Ceapucv2.jpg"/>" width="250px" height="250px"/>
    </div>
    <br>
    <div id="tituloNoticiaDialogo" class="tituloNoticiaDialogo">

    </div>
    </br>
    <div id="descripcionNoticiaDialogo" class="descripcionNoticiaDialogo">
        <s:property value="descripcion"/>
    </div>
    </br>
    <div id="fechaNoticiaDialogo" class="fechaNoticiaDialogo">

    </div>
<hr />
</sj:dialog>
</div>
<!--sj:a onClickTopics="openEffectDialog" button="true" buttonIcon="ui-icon-newwin">
    Open effect dialog
<!/sj:a-->

</body>
</html>
