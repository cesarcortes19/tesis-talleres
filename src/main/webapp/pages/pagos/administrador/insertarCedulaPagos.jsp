<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 14/09/2014
  Time: 02:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>
<s:form action="buscarUsuarioGestionarPagos" namespace="/administrador/pagos">
    <s:textfield key="taller.form.label.inscripcion.cedula" name="userModel.cedula"
                 onkeypress="return onlyNumber(event);"/>
    <s:submit cssClass="botonSubmit"/>
</s:form>

</body>
</html>
