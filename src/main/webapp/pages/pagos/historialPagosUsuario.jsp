<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 07/09/2014
  Time: 05:57 PM
  To change this template use File | Settings | File Templates.

JSP en el cual el administrador introduce el numero de cedula del usuario
 y luego este puede inscribir a us representados en los diferentes talleres
 --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title></title>

    <style type="text/css">
        .ui-jqgrid tr.jqgrow td {
            white-space: normal;
            height: 110px;
            padding: 10px 2px 10px 2px;
        }
    </style>
</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Historial de pago
    </div>
</div>
<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Tel&eacute;fono:</b> <s:property value="userModel.telefono1"/>
</div>
</br>
</br>

<s:url id="remoteurl" action="cargarHistorialJson" namespace="/usuario/pagos">
    <s:param name="userModel.id">
        <s:property value="userModel.id"/></s:param>
</s:url>

<div class="ajusteciente">
    <sjg:grid
            id="pagosGrid"
            caption="Pagos"
            href="%{remoteurl}"
            gridModel="gridModel"
            dataType="json"
            altRows="true"
            autowidth="true"
            groupCollapse="false"
            >
        <sjg:gridColumn name="id"
                        title="id"
                        index="id"
                        align="center"
                        hidden="true"/>

<%--        <sjg:gridColumn name="userModel.nombre"
                        title="Representante"
                        index="representante"
                        align="center"
                />--%>

        <sjg:gridColumn name="numeroComprobante"
                        title="Nro. Comprobante"
                        index="numeroComprobante"
                        align="center"
                />

        <sjg:gridColumn name="montoIngresado"
                        title="Monto Ingresado"
                        index="montoIngresado"
                        align="center"
                        sortable="false"
                        formatter="currency"
                />

        <sjg:gridColumn name="montoCalculado"
                        title="Monto Calculado"
                        index="montoCalculado"
                        align="center"
                        formatter="currency"
                />

        <sjg:gridColumn name="logTransaccion"
                        title="Transacción"
                        index="logTransaccion"
                        sortable="false"
                        edittype="textarea"
                        cssStyle="color: #BC1010"
                />
        <sjg:gridColumn name="status"
                        title="Estado"
                        index="status"
                        sortable="false"
                />

        <sjg:gridColumn name="fechaPago"
                        title="Fecha Pago"
                        index="fechaPago"
                        align="center"
                        sortable="false"
                        formatter="date"
                        formatoptions="{newformat : 'd/m/Y', srcformat : 'Y-m-d H:i:s'}"
                />
    </sjg:grid>

</div>
</body>
</html>
