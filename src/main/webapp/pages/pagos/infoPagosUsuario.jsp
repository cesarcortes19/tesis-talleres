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

    <script>
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
        $.subscribe('grid_complete', function(event, data) {
            habilitarCheckbox();
        });

        function habilitarCheckbox(){
            $(':checkbox').each(function( index ) {
                $(this).removeAttr('disabled');
            });
        }
    </script>
</head>
<body>

<s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>

<div class="tituloRepresentante">
    <b>Representante:</b> <s:property value="userModel.nombre"/> <s:property value="userModel.apellido"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>C&eacute;dula:</b> <s:property value="userModel.cedula"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <b>Telefono:</b> <s:property value="userModel.telefono1"/>
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
                        sortable="false"/>
        <sjg:gridColumn name="julio"
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

        <sjg:gridColumn name="costo"
                        title="Costo"
                        index="costo"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="status"
                        title="Estado"
                        index="status"
                        editable="true"
                        align="center"
                        sortable="false"/>

        <sjg:gridColumn name="fechaDesinscripcion"
                        title="Desinscripci"
                        index="fechaDesinscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        hidden="true"/>

        <sjg:gridColumn name="fechaInscripcion"
                        title="Inscripci&oacuten"
                        index="fechaInscripcion"
                        editable="true"
                        align="center"
                        sortable="false"
                        hidden="true"/>

    </sjg:grid>

</div>
<br>
<br>
<br>
<h3>Realizar Pago</h3><br>
<div id="mensajeCalculoPago"><b>¡ATENCI&Oacute;N!:</b> Segun los meses seleccionados por usted, la aplicaci&oacuten ha calculado que su pago debe ser por el monto de 1250 Bs. </div>
<s:form action="cargarTallerInscribirTaller" namespace="/usuario/taller" id="formInsribirTaller">
    <table style="border-spacing: 50px;">
        <tr>
            <td>
                <label style="display:inline-block"><b>Tipo de pago:</b></label>
                <%--<s:textfield id="namePlanPrize" name="pagosModel.tipoPago" theme="simple"/>--%>
                <s:radio  theme="simple" name="userGender" key="user.gender" list="{'Deposito','Transferencia','Efectivo' }" />
            </td>

            <td>
                <label style="display:inline-block"><b>N&uacutemero Comprobante:</b></label>
                <s:textfield id="namePlanPrize" name="pagosModel.tipoPago" theme="simple"/>
            </td>

            <td>
                <label style="display:inline-block"><b>Monto a pagar:</b></label>
                <s:textfield id="namePlanPrize" name="pagosModel.tipoPago" theme="simple"/>
            </td>


        </tr>
    </table>

    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-circle-check" onclick="crearNoticiaFunction();">
            Realizar Pago
        </sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>


    <s:hidden name="userModel.id" id="hiddenUserModel"/>
</s:form>
</body>
</html>
