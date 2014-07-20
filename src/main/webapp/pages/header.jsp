<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/menu.css"/>" media="screen"/>
    <script type="text/javascript" src="<s:url value="/resources/js/menu.js"/>"></script>
</head>
<body>

<style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    body {
        background: rgba(53, 99, 128, 0.41);
    }

    /*div#menu {
        margin:30px auto;
        width:80%;
    }*/

</style>
<div id="contendorMenu">
<div id="menu">
    <ul class="menu">

        <li><a href="#"><span>Administrar Cursos</span></a>

            <div>
                <ul>
                    <li><a href="#"><span>Crear Curso</span></a></li>
                    <li><a href="#" ><span>Ver Cursos/Editar</span></a></li>
                </ul>
            </div>
        </li>

        <%--Solo lo puede ver el administrador--%>
        <li><a href="#"><span>Administrar Cartelera</span></a>

            <div>
                <ul>
                    <li>
                        <a href="#" ><span>Ver Cartelera</span></a>
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
        <li><a href="#"><span>Cursos</span></a>

            <div>
                <ul>
                    <li>
                        <a href="#" ><span>Ver Cursos</span></a>
                    </li>
                    <li>
                        <a href="#" ><span>Inscripcion</span></a>
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
</body>