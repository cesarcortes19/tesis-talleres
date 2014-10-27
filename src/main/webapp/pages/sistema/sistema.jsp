<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
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




</head>
<body>


<sec:authorize access="hasRole('ADMINISTRADOR')">
<script type="text/javascript">





    if (confirm('\u00BFEst\u00e1 seguro que desea reiniciar el sistema? (1)'))
        if (confirm('\u00BFEst\u00e1 seguro que desea reiniciar el sistema?(2)'))
            window.location.href = '/administrador/sistema/reiniciarSistema.action';
        else
            window.location.href = '/todos/cartelera/cargarCartelera.action';
    else
        window.location.href = '/todos/cartelera/cargarCartelera.action';



</script>
</sec:authorize>

</body>
</html>
