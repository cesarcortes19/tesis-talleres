<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/menu.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/style.css"/>" media="screen"/>
    <script type="text/javascript" src="<s:url value="/resources/js/validation.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/messages.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/menu.js"/>"></script>
    <script>
        function submitFormulario(element){
            $("#"+element).submit();
        }
    </script>
    <%--<sj:head jqueryui="true" jquerytheme="smoothness"/>--%>
    <%--<sj:head jqueryui="true" jquerytheme="pepper-grinder"/>--%>
    <sj:head jqueryui="true" jquerytheme="cupertino"/>
    <%--<sj:head jqueryui="true" jquerytheme="flick"/>--%>
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

        <li><a href="#"><span>Administrar Taller</span></a>

            <div>
                <ul>
                    <li><a href="#" onclick="submitFormulario('crearTaller')"><span>Crear Taller</span></a></li>
                    <li><a href="#" onclick="submitFormulario('cargarTaller')"><span>Ver Taller/Editar</span></a></li>
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
                        <a href="#" onclick="submitFormulario('crearCartelera')"><span>Crear Noticia</span></a>
                    </li>
                    <li>
                        <a href="#" onclick="submitFormulario('cargarEliminarCartelera')"><span>Eliminar Noticia</span></a>
                    </li>
                </ul>
            </div>
        </li>
        <%--Solo lo puede ver el administrador--%>
        <li><a href="#"><span>Administrar Cuentas</span></a>
            <div>
                <ul>
                    <li>
                        <a href="#" onclick="submitFormulario('crearUsuario')"><span>Crear Usuario</span></a>
                    </li>
                    <li>
                        <a href="#" onclick="submitFormulario('editarEliminarUsuario')"><span>Administrar Usuarios</span></a>
                    </li>
<%--                    <li>
                        <a href="#" onclick="submitFormulario('consultarUsuario')"><span>Consultar Usuarios</span></a>
                    </li>--%>
                </ul>
            </div>
        </li>

        <%--Solo lo deben ver los represententaste y usuarios invitados--%>
        <li><a href="#"><span>Taller</span></a>

            <div>
                <ul>
                    <li>
                        <a href="#" onclick="submitFormulario('cargarTaller')"><span>Ver Taller</span></a>
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
                    <li><a href="#" class="parent"><span>Registrar Alumno</span></a></li>
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

<s:form action="cargarTaller" namespace="/taller" id="cargarTaller"></s:form>
<s:form action="crearTaller" namespace="/taller" id="crearTaller"></s:form>
<%--Cartelera--%>
<s:form action="cargarCartelera" namespace="/cartelera" id="cargarCartelera"></s:form>
<s:form action="cargarEliminarCartelera" namespace="/cartelera" id="cargarEliminarCartelera"/>
<s:form action="crearCartelera" namespace="/cartelera" id="crearCartelera"/>
<%--Usuarios Administrador--%>
<s:form action="cargarCrearUsuario" namespace="/administrador/usuario" id="crearUsuario"></s:form>
<s:form action="cargarAdministrarUsuario" namespace="/administrador/usuario" id="editarEliminarUsuario"></s:form>
<%--<s:form action="consultarUsuario" namespace="/administrador/usuario" id="consultarUsuario"></s:form>--%>

</body>