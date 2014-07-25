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

    <title></title>
</head>
<body>


<h1 align="center">
    <u>Cartelera Informativa</u>
</h1>

<%--TODO Construir mediante iteraciones las noticias--%>
<div class="scrollCarteleraDetail">

    <h3 align="center">
        <u>NOTICIA</u>
    </h3>
    <br>
    <li>
        <p class="noticia">
            Incripciones finalizadas

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Cambio horario curso piano

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Suspencion cursos por 2 semanas

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Incripciones abiertas

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Ausencia Profesor

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            INFORMACION IMPORTANTE

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Cambio de profesores

        <p>
    </li>
    <br>
    <li>
        <p class="noticia">
            Reinicio de Actividades

        <p>
    </li>
</div>
<div class="scrollCarteleraItems">

    <h3 align="center">
        <u>DETALLE NOTICIA</u>
    </h3>
    <br>
    <li>
    <p class="detalelNoticia">
        Se les informa a todos los representantes que la proxima semana no habran actividades
        por asueto de Semana Santa
    <p>
    </li>
</div>
</body>
</html>
