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
    <script type="text/javascript" src="<s:url value="/resources/js/util.js"/>"></script>
    <script>

        var globalMontoAcumulado = 0;

        function inscribirTallerFunction(element) {
            $("#hiddenAlumnoModel").val(element);
            $("#formInsribirTaller").submit();
        }

        function getTriggerEnter() {
            var e = jQuery.Event("keydown");
            e.which = 13; // # Some key code value
            e.keyCode = 13;
            $("#pagosGrid input").trigger(e);
            return true;
        }
        $.subscribe('grid_complete', function (event, data) {
            habilitarCheckbox();
            marcarInscripcionDeisncripcion();

        });

        function habilitarCheckbox() {
            $(':checkbox').each(function (index) {
                <sec:authorize access="hasRole('REPRESENTANTE')">
                if ($(this).val() == "false" || $(this).val().length < 2) {
                    $(this).removeAttr('disabled');
                }
                </sec:authorize>
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                    $(this).removeAttr('disabled');
                </sec:authorize>
                elementParent = $(this).parent().parent();
                idRow = elementParent.attr('id');
                monto = $("#pagosGrid").jqGrid('getCell', idRow, 'tallerModel.costo');

                if ($(this).val() == "false" || $(this).val().length < 2) {

                    this.setAttribute("onchange", "sumarRestarDiv (" + monto + ",false,this)");
                } else {
                    this.setAttribute("onchange", "sumarRestarDiv (0,true, this)");
                }
            });
        }

        function sumarRestarDiv(monto, statusInicialCheck, elemento) {
            if (!statusInicialCheck) {
                if ($(elemento).is(":checked")) {
                    globalMontoAcumulado = globalMontoAcumulado + monto;
                } else {
                    globalMontoAcumulado = globalMontoAcumulado - monto;
                }
            }

            $("#spanMonto").html(globalMontoAcumulado);


        }

        function realizarPagoFunction() {
            list = $("#pagosGrid").jqGrid('getRowData');
            $("#stringPagos").val(JSON.stringify(list));
            $("#formRealizarPago").submit()
        }

        function obtenerDataCheckbox() {
            list = JSON.stringify($("#pagosGrid").jqGrid('getRowData'));
            $("#stringPagos").val(list);
        }

    </script>
</head>
<body>

<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Tel&eacute;fono:</b>
    <s:property value="userModel.telefono1"/>
</div>
</br>
</br>

<s:property value="usermodel.id"/>
<s:url id="remoteurl" action="cargarPagosJson" namespace="/usuario/pagos">
    <s:param name="userModel.id">
        <s:property value="userModel.id"/>
    </s:param>
</s:url>

<div class="ajusteciente">
    <s:url id="editCellUrl" action="executePagos" namespace="/usuario/pagos"/>

    <sjg:grid
            id="pagosGrid"
            caption="Pagos"
            href="%{remoteurl}"
            editurl="%{editCellUrl}"
            gridModel="gridModel"
            dataType="json"
            onchange="getTriggerEnter()"
            cellEdit="true"
            altRows="true"
            autowidth="true"
            groupField="['alumnoModel.nombre']"
            groupCollapse="false"
            groupText="['Representado: <b>{0}']"
            onGridCompleteTopics="grid_complete"
            >


        <sjg:gridColumn name="id"
                        title=""
                        index="id"
                        align="center"
                        hidden="true"/>

        <sjg:gridColumn name="alumnoModel.nombre"
                        title=" "
                        index="representado"
                        align="center"
                        hidden="true"
                        width="1"/>

        <sjg:gridColumn name="tallerModel.name"
                        title="Taller"
                        index="taller"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="inscripcion"
                        title="Inscripcion"
                        index="inscripcion"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="septiembre"
                        title="Sep"
                        index="septiembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="octubre"
                        title="Oct"
                        index="octubre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="noviembre"
                        title="Nov"
                        index="noviembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="diciembre"
                        title="Dic"
                        index="diciembre"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="enero"
                        title="Ene"
                        index="enero"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="febrero"
                        title="Feb"
                        index="febrero"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="marzo"
                        title="Mar"
                        index="marzo"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="abril"
                        title="Abr"
                        index="abril"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="mayo"
                        title="May"
                        index="mayo"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"/>
        <sjg:gridColumn name="junio"
                        title="Jun"
                        index="junio"
                        editable="true"
                        formatter="checkbox"
                        edittype="checkbox"
                        editoptions="{ value:'True:False'}"
                        align="center"
                        sortable="false"
                />

        <%--        <sjg:gridColumn name="julio"
                                title="Jul"
                                index="julio"
                                editable="true"
                                formatter="checkbox"
                                edittype="checkbox"
                                editoptions="{ value:'True:False'}"
                                align="center"
                                sortable="false"/>
                <sjg:gridColumn name="agosto"
                                title="Ago"
                                index="agosto"
                                editable="true"
                                formatter="checkbox"
                                edittype="checkbox"
                                editoptions="{ value:'True:False'}"
                                align="center"
                                sortable="false"/>--%>


        <sjg:gridColumn name="tallerModel.costo"
                        title="Costo(Bs)"
                        index="costo"
                        align="center"
                        formatter="currency"
                        sortable="false"/>

        <sjg:gridColumn name="fechaInscripcion"
                        title="Inscripción"
                        index="fechaInscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        formatter="date"
                        formatoptions="{newformat : 'd/m/Y', srcformat : 'Y-m-d H:i:s'}"
                />

        <sjg:gridColumn name="fechaDesinscripcion"
                        title="Desinscripción"
                        index="fechaDesinscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        formatter="date"
                        formatoptions="{newformat : 'd/m/Y', srcformat : 'Y-m-d H:i:s'}"/>

    </sjg:grid>

</div>
<br>
<br>
<br>

<h3>Realizar Pago</h3><br>

<div id="mensajeCalculoPago"><b>¡ATENCI&Oacute;N!:</b> Segun los meses seleccionados por usted, la aplicaci&oacuten ha
    calculado que su pago debe ser por el monto de <span id="spanMonto">0</span> Bs.
</div>
<s:form action="realizarGestionPago" namespace="/usuario/pagos" id="formRealizarPago">
    <s:hidden name="userModel.id"/>
    <table style="border-spacing: 50px;">
        <tr>
            <td>
                <label style="display:inline-block"><b>Tipo de pago:</b></label>
                    <%--<s:textfield id="namePlanPrize" name="pagosModel.modoPago" theme="simple"/>--%>
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                    <s:radio theme="simple" name="pagosTo.modoPago"
                             list="#{'1':'Deposito','2':'Transferencia','3':'Efectivo'}" value="2"/>
                </sec:authorize>
                <sec:authorize access="hasRole('REPRESENTANTE')">
                    <s:radio theme="simple" name="pagosTo.modoPago" list="#{'1':'Deposito','2':'Transferencia'}"
                             value="2"/>
                </sec:authorize>
            </td>

            <td>
                <label style="display:inline-block"><b>N&uacutemero Comprobante:</b></label>
                <s:textfield id="idNumeroComprobante" name="pagosTo.numeroComprobante" theme="simple"/>
            </td>

        </tr>
    </table>

    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-circle-check" onclick="realizarPagoFunction();">
            Realizar Pago
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close"
              value="Cancelar">Cancelar</sj:a>
    </div>

    <s:hidden name="pagosTo.jsonPagos" id="stringPagos"/>
</s:form>
</body>
</html>
