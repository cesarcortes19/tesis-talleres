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
        .noticia:hover {
            border: 3px solid #d0d0d0;
            cursor: pointer;
        }
    </style>
    <script>
        function mostrarDetalle(element) {
            $("#divDetalleNoticia").html(element);

        }

        function abrirNoticia(imagen, titulo, descripcion, fecha,idImageToShow) {

            $("#tituloNoticiaDialogo").html('<b>' + titulo + '</b>');
            $("#descripcionNoticiaDialogo").html(descripcion);
            $("#fechaNoticiaDialogo").html('<b> Creado: </b>' + fecha);

            /*elimina la imagen que estaba anteriormente en el div para que no se duplique*/
            $("#imagenDialogo").children("img").remove();

            /*Toma la imagen de la cartelera y la coloca en el modal para evitar ir al servidor*/
            var img = $("#"+idImageToShow).clone();
            $("#imagenDialogo").append(img);

            $("#myeffectdialog").dialog('open');
        }
    </script>

    <title></title>
</head>
<body>

<div class="cartelera">
    <%--<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>--%>
    <div id="titulo" class="TituloformInterno">
        Cartelera Informativa
    </div>

    <div>
        <table class="mostrarCurso" align="center">
            <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
            <s:if test="%{#statusNoticia.index%3 == 0}">
            </tr>
            <tr>
                </s:if>
                <td>
                    <div class="noticia"
                         onclick="abrirNoticia('','<s:property value="titulo"/>','<s:property value="descripcion"/>'
                                 ,'<s:property value="fechaCreacion"/>','idImageToShow<s:property value="id"/>')">


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
                        <br>

                        <div class="tituloNoticia">
                            <s:property value="titulo"/>
                        </div>
                        </br>
                        <div class="descripcionNoticia">
                            <s:property value="subStringDescripcion"/>
                        </div>
                        </br><b>Creado: </b><s:property value="fechaCreacion"/>
                    </div>
                </td>
                </s:iterator>
            </tr>
        </table>
    </div>
</div>
<div id="dialogoNoticia">
    <sj:dialog id="myeffectdialog" showEffect="scale" hideEffect="scale" autoOpen="false" modal="true" title="Noticia"
               openTopics="openEffectDialog" closeTopics="closeEffectDialog" minHeight="500" minWidth="500">
        <div id="imagenDialogo" class="imagenDialogo">
            <%--<img id="imgDialog" width="250px" height="250px"/>--%>
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
        <hr/>
    </sj:dialog>
</div>
<!--sj:a onClickTopics="openEffectDialog" button="true" buttonIcon="ui-icon-newwin">
    Open effect dialog
<!/sj:a-->

</body>
</html>
