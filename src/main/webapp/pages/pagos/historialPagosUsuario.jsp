<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <script type="text/javascript" src="<s:url value="/resources/js/jquery.blockUI.js"/>"></script>
    <style type="text/css">
        .ui-jqgrid tr.jqgrow td {
            white-space: normal;
            height: 110px;
            padding: 10px 2px 10px 2px;
        }
    </style>

    <script>

        $(document).ajaxStop($.unblockUI);
        <sec:authorize access="hasRole('ADMINISTRADOR')">
        function formatLink(cellvalue, options, rowObject) {
            if (cellvalue == "REALIZADO_POR_REPRESENTANTE") {
                return "<a href='#' onClick='javascript:aceptarPago(" + rowObject.id + ")'> ACEPTAR </a> <a>&nbsp &nbsp/&nbsp &nbsp</a>" +
                        "<a href='#' onClick='javascript:rechazarPago(" + rowObject.id + ")'> RECHAZAR </a>";
            }
            if (cellvalue == "PAGO_APROBADO_ADMINISTRADOR") {
                return "<a> PAGO APROBADO </a>";
            }
            if (cellvalue == "PAGO_RECHAZADO") {
                return "<a> PAGO RECHAZADO </a>";
            }
        }

        function aceptarPago(idRowObject) {
            if (!confirm('\u00BFEst\u00e1 seguro que desea ACEPTAR el pago?'))
                return;
            $.blockUI({ message: '<h1> Enviando correo al representante...</h1>' });
            /*Funcion ajax que actualiza el estado en aceptado*/
            $.ajax({
                url: "/administrador/pagos/aceptarPago.action",
                data: { idPago: idRowObject },
                dataType: "json",
                type: 'post',
                success: function (data) {
                    $("#pagosGrid").jqGrid('setCell', idRowObject, 'status', 'PAGO_APROBADO_ADMINISTRADOR');
                }
            });
        }

        function rechazarPago(idRowObject) {
            if (!confirm('\u00BFEst\u00e1 seguro que desea RECHAZAR el pago?'))
                return;
            $.blockUI({ message: '<h1> Enviando correo al representante...</h1>' });
            /*Funcion ajax que actualiza el estado en aceptado*/
            $.ajax({
                url: "/administrador/pagos/rechazarPago.action",
                data: { idPago: idRowObject},
                dataType: "json",
                type: 'post',
                success: function (data) {
                    $("#pagosGrid").jqGrid('setCell', idRowObject, 'status', 'PAGO_RECHAZADO');
                }
            });
        }
        </sec:authorize>
    </script>
</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Historial de pago
    </div>
</div>
<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>Tel&eacute;fono:</b> <s:property value="userModel.telefono1"/>
</div>
</br>
</br>

<div id="selectTalleres" style="width: 50%">
    <table><tr><td>
        <label>Filtrar por pago: </label>
    </td>
        <td>
            <s:form action="filtrarPorEstadoPagoUsuario" namespace="/usuario/pagos" id="formSelect">
                <s:select label="Busqueda por pago"
                          headerValue="Todos"
                          headerKey="0"
                          list="%{#{'1':'Pagos Aceptados','2':'Pagos Rechazados','3':'Pagos Pendientes por Revisar'}}"
                          name="pagosTo.modoPago"
                          id="selectTaller"
                          theme="simple"/>

                <s:hidden name="userModel.id"/>
            </s:form>
        </td>
        <td>
            <div class="botonFiltro">
                <sj:a id="filtrar" button="true" buttonIcon="ui-icon-search" onclick="$('#formSelect').submit();">
                    Filtrar
                </sj:a>
            </div>
        </td>
    </tr>
    </table>
</div>


<br>



<s:url id="remoteurl" action="cargarHistorialJson" namespace="/usuario/pagos" escapeAmp="false">
    <s:param name="pagosTo.modoPago"><s:property value="pagosTo.modoPago"/></s:param>
    <s:param name="userModel.id"><s:property value="userModel.id"/></s:param>
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
                        width="70"
                />

        <%--        <sjg:gridColumn name="montoIngresado"
                                title="Monto Ingresado"
                                index="montoIngresado"
                                align="center"
                                sortable="false"
                                formatter="currency"
                                width="70"
                        />--%>

        <sjg:gridColumn name="montoCalculado"
                        title="Monto Calculado"
                        index="montoCalculado"
                        align="center"
                        formatter="currency"
                        width="70"
                />

        <sjg:gridColumn name="logTransaccion"
                        title="Transacción"
                        index="logTransaccion"
                        sortable="false"
                        edittype="textarea"
                        cssStyle="color: #BC1010"
                />

        <sec:authorize access="hasRole('ADMINISTRADOR')">
            <sjg:gridColumn name="status"
                            title="Estado"
                            index="status"
                            sortable="false"
                            formatter="formatLink"
                            align="center"
                            width="100"
                    />
        </sec:authorize>

        <sec:authorize access="hasRole('REPRESENTANTE')">
            <sjg:gridColumn name="status"
                            title="Estado"
                            index="status"
                            sortable="false"
                            align="center"
                            width="100"
                    />
        </sec:authorize>

        <sjg:gridColumn name="fechaPago"
                        title="Fecha Pago"
                        index="fechaPago"
                        align="center"
                        sortable="false"
                        formatter="date"
                        width="70"
                        formatoptions="{newformat : 'd/m/Y', srcformat : 'Y-m-d H:i:s'}"
                />
    </sjg:grid>

</div>
</body>
</html>
