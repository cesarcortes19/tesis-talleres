<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/menu.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/style.css"/>" media="screen"/>
    <script type="text/javascript" src="<s:url value="/resources/js/menu.js"/>"></script>
    <script>
        function submitFormulario(element){
            $("#"+element).submit();
        }
    </script>
    <%--<sj:head jqueryui="true" jquerytheme="smoothness"/>--%>
    <sj:head jqueryui="true" jquerytheme="redmond"/>
</head>
<body>

<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    body {
        /*background: rgba(53, 99, 128, 0.41);*/
    }

    /*div#menu {
        margin:30px auto;
        width:80%;
    }*/

</style>
<div id="contendorMenu">
<div id="menu">
    <ul class="menu">

        <li><a href="#"><span>Administrar Talleres</span></a>

            <div>
                <ul>
                    <li><a href="#"><span>Crear Taller</span></a></li>
                    <li><a href="#" onclick="submitFormulario('cargarTalleres')"><span>Ver Talleres/Editar</span></a></li>
                </ul>
            </div>
        </li>

        <%--Solo lo puede ver el administrador--%>
        <li><a href="#"><span>Administrar Cartelera</span></a>

            <div>
                <ul>
                    <li>
                        <a href="#" onclick="submitFormulario('cargarCartelera')"><span>Ver Cartelera</span></a>
                    </li>
                    <li>
                        <a href="#" ><span>Crear Noticia</span></a>
                    </li>
                    <li>
                        <a href="#" ><span>Editar Noticia</span></a>
                    </li>
                    <li>
                        <a href="#" ><span>Eliminar Noticia</span></a>
                    </li>
                </ul>
            </div>
        </li>

        <%--Solo lo deben ver los represententaste y usuarios invitados--%>
        <li><a href="#"><span>Talleres</span></a>

            <div>
                <ul>
                    <li>
                        <a href="#" onclick="submitFormulario('cargarTalleres')"><span>Ver Talleres</span></a>
                    </li>
                    <li>
                        <a href="#" ><span>Inscripci&oacute;n</span></a>
                    </li>
                </ul>
            </div>
        </li>

        <%--Solo lo deben ver los represententaste y usuarios invitados--%>
        <li><a href="#"><span>Cartelera</span></a></li>

        <%--Solo lo deben ver los represententaste--%>
        <li><a href="#" class="parent"><span>Configuraci&oacute;n</span></a>

            <div>
                <ul>
                    <li><a href="#" class="parent"><span>Cambiar Contrasena</span></a></li>
                    <li><a href="#" class="parent"><span>Editar Cuenta</span></a></li>
                    <li><a href="#" class="parent"><span>Registrar Representado</span></a></li>
                </ul>
            </div>
        </li>

        <li class="last"><a href="#"><span>Contactenos</span></a></li>
    </ul>
</div>
    </div>
<%--<a class="titulo">Centro Educativo de la Asociación de Profesores de la Universidad Central De Venezuela (CEAPUCV)</a>--%>
<a class="titulo">CEAPUCV</a>
<a>aqui debe ir algun logo o imagen</a>

<s:form action="cargarTalleres" namespace="/talleres" id="cargarTalleres"></s:form>
<s:form action="cargarCartelera" namespace="/cartelera" id="cargarCartelera"></s:form>

</body>