<%@ taglib prefix="s" uri="/struts-tags" %>
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

/*TODO ajustar estilos de cartelera y mover a archivos css*/

        div.scrollCarteleraDetail {
            width: 300px;
            height: 300px;
            overflow: scroll;
            /*para Firefox*/
            -moz-border-radius: 15px 0px 15px 15px;
            /*para Safari y Chrome*/
            -webkit-border-radius: 15px 0px 15px 15px;
            /* para Opera */
            border-radius: 15px 0px 15px 15px;
            float: left;
            margin-top: 50px;
            margin-bottom: 50px;
            margin-left: 20%;
            border-top: 1px solid #000000;
            border-left: 1px solid #000000;
        }

        div.scrollCarteleraItems {
            height: 300px;
            overflow: scroll;
            width: auto;
            margin-right: 20%;
            margin-left: 20px;
            margin-top: 50px;
            margin-bottom: 50px;
            border-top: 1px solid #000000;
            border-left: 1px solid #000000;

        }

        .noticia {
            font-size: 13px;
            font-weight: bold;
            font-family: Trebuchet MS, Arial, san-serif;
            margin-left: 10px;
            cursor: pointer;
        }

        .detalelNoticia {
            font-size: 12px;
            font-weight: bold;
            font-family: Trebuchet MS, Arial, san-serif;
            margin-left: 10px;
        }

    </style>

    <script>
        function mostrarDetalle(element){
            $("#divDetalleNoticia").html(element);
        }

        function eliminarNoticia(element) {
            var x;
            if (confirm("¿Está seguro que desea eliminar?") == true) {
                $("#idNoticia").val(element);
                $("#eliminarCartelera").submit();
            }
        }
    </script>

    <title></title>
</head>
<body>


<h1 align="center">
    <u>Cartelera Informativa</u>
</h1>

<div class="scrollCarteleraDetail">

    <h3 align="center">
        <u>NOTICIA</u>
    </h3>
    <br>
    <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
        <li>
            <p class="noticia">
                <a href="#" onclick="mostrarDetalle('<s:property value="descripcion"/>')"><s:property value="titulo"/></a>
            </p>

            <a href="#" onclick="eliminarNoticia('<s:property value="id"/>')">Eliminar noticia</a>
            </br>
        </li>
    </s:iterator>
</div>
<div class="scrollCarteleraItems">

    <h3 align="center">
        <u>DETALLE NOTICIA</u>
    </h3>
    <br>
    <li>
        <div id ="divDetalleNoticia">
            <p class="detalelNoticia">
                Seleccione una noticia para ver su detalle
            <p>
        </div>
    </li>
</div>
<s:form action="eliminarCartelera" namespace="/cartelera" id="eliminarCartelera">
    <s:hidden name="idNoticia" id="idNoticia"/>
</s:form>
</body>
</html>
