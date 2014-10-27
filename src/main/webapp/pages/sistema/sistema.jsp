<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 21/10/2014
  Time: 09:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script>

        <sec:authorize access="hasRole('ADMINISTRADOR')">
            $(document).ready(function () {
                //Subir imagen y mostrar en div
                if (confirm('\u00BFEst\u00e1 seguro que desea reiniciar el sistema? (1)'))
                    if (confirm('\u00BFEst\u00e1 seguro que desea reiniciar el sistema?(2)'))
                        window.location.href = '/administrador/sistema/reiniciarSistema.action';
                    else
                        window.location.href = '/todos/cartelera/cargarCartelera.action';
                else
                    window.location.href = '/todos/cartelera/cargarCartelera.action';
            });
        </sec:authorize>
    </script>


</head>
<body>

</body>
</html>
