<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 12/08/2014
  Time: 09:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
    <title></title>

    <script>
        function crearUsuarioFunction() {
            var dataGrid = $("#gridAlumno").jqGrid("getRowData");
            var dataJson = JSON.stringify(dataGrid);
            $("#alumnoJson").val(dataJson);
            $("#formCrearUsuario").submit();
        }
    </script>
</head>
<body>

<s:form action="autenticarLogin" namespace="/login" id="">

    <s:textfield key="usuario.form.label.cedula" name="userModel.cedula" cssClass="box"/>
    <s:textfield key="usuario.form.label.password" name="userModel.password" cssClass="box"/>
<s:submit/>
</s:form>

</html>