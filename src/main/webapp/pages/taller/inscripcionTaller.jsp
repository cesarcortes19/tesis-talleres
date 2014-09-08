<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 07/09/2014
  Time: 05:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%--JSP en el cual el administrador introduce el numero de cedula del usuario y luego este puede
inscribir a us representados en los diferentes talleres--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<s:form action="" namespace="/administrador/taller">
    <s:text name="userModel.cedula" onkeypress="return onlyNumber(event);">
</s:form>
</body>
</html>
