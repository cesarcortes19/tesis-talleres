<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 19/07/2014
  Time: 08:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<html>
<head>
    <title></title>
</head>
<%--<sj:head jqueryui="true" jquerytheme="humanity"/>--%>
<script>
    function eliminarTallerFunction(element) {
        var x;
        if (confirm("\u00BFEst\u00e1 seguro que desea eliminar?") == true) {
            $("#hiddenIdEliminarTaller").val(element);
            $("#idFormEliminar").submit();
        }

    }

    function editarTallerFunction(element) {
        $("#hiddenIdTaller").val(element);
        $("#idFormEditar").submit();
    }

    function abrirPopUpPagoInscripcion(element, costoInscripcion, costoMensualidad) {
        total = parseFloat(costoInscripcion) + parseFloat(costoMensualidad);
        $("#hiddenIdTallerInscribir").val(element);
        $("#hiddenMontoCalculado").val(costoInscripcion);
        $("#divCostoInscripcion").html('<b> Costo Inscripción: </b>' + costoInscripcion +' Bs.');
        $("#divCostoMensualidad").html('<b> Costo Mensualidad: </b>' + costoMensualidad +' Bs.');
        $("#totalPagar").html('<b> Total a Pagar: </b>' + total +' Bs.');
        $("#dialogPagoInscripcion").dialog('open');
    }

    function inscribirTallerFunction() {
        var bandera= true;
        if($("#idNumeroComprobante").val()==""){
            bandera = false;
        }

        if(bandera)
            $("#inscripcionFormulario").submit();
        else
            alert("Debe llenar todos los campos marcados como requeridos (*)");
    }

    function cambioModoPago(){
        if($("input[name=modoPago]:checked").val()=='3'){
            $("#idNumeroComprobante").val("");
            $("#idNumeroComprobante").attr('disabled',true);
        }else{
            $("#idNumeroComprobante").attr('disabled',false);
        }
    }

</script>
</head>
<body>

<div>
    <table class="mostrarCurso" align="center">

        <div align="center">¡IMPORTANTE! Recuerde que para realizar una inscripci&oacute;n, debe tener a mano el comprobante de pago correspondiente al costo de la inscripci&oacute;n m&aacute;s el primer mes de mensualidad </div>

        <s:iterator value="tallerList" var="iteradorTaller" status="statusTaller">
        <s:if test="%{#statusTaller.index%3 == 0}">
        </tr>
        <tr>
            </s:if>
            <td>
                <div class="mostrarCurso">
                    <div class="tituloTaller" style="width: auto; height: 10%; font-size: 14pt ">
                        <s:property value="name"/>
                    </div>
                    <div class="tituloTaller" style="width: auto; height: 100px">

                        <s:if test="%{picture!=null}">
                            <img id="idImageToShow<s:property value="id"/>" src="
                                <s:url namespace="/todos/Image" action='ImageAction'>
                                    <s:param name="imageId"><s:property value="id"/></s:param>
                                </s:url>
                            " width="100px" height="100px"/>
                        </s:if>
                        <s:else>
                            <img id="idImageToShow<s:property value="id"/>" src="<s:url value="/resources/images/Logo_Ceapucv2.jpg"/>" width="100px"
                                 height="100px"/>
                        </s:else>
                    </div>
                    <sj:tabbedpanel id="%{#iteradorTaller.id}">
                        <sj:tab id="tab1" target="tone" label="Descripción"/>
                        <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                        <sj:tab id="tab3" target="tthree" label="Cupos"/>
                        <div id="tone" style="height: 150px; overflow: scroll;"><br>
                            <b>Costo inscripci&oacute;n:</b> <s:property value="costoInscripcion"/> Bs.<br><br>
                            <b>Costo mensualidad:</b> <s:property value="costo"/> Bs.<br><br>
                            <s:property value="descripcion"/>

                        </div>
                        <div id="ttwo" style="height: 150px; overflow: scroll;"><br>
                            <s:if test="%{horarioLunes!=''}">
                                <b>Lunes:</b> <s:property value="horarioLunes"/><br><br>
                            </s:if>
                            <s:if test="%{horarioMartes!=''}">
                                <b>Martes:</b> <s:property value="horarioMartes"/><br><br>
                            </s:if>
                            <s:if test="%{horarioMiercoles!=''}">
                                <b>Mi&eacute;rcoles:</b> <s:property value="horarioMiercoles"/><br><br>
                            </s:if>
                            <s:if test="%{horarioJueves!=''}">
                                <b>Jueves:</b> <s:property value="horarioJueves"/><br><br>
                            </s:if>
                            <s:if test="%{horarioViernes!=''}">
                                <b>Viernes: </b><s:property value="horarioViernes"/><br><br>
                            </s:if>
                        </div>
                        <div id="tthree" style="height: 150px; overflow: scroll;"><br>
                            <b>Cupos:</b> <s:property value="cantidadAlumnosactual"/>/<s:property
                                    value="cantidadAlumnosMaxima"/> Alumnos
                        </div>
                    </sj:tabbedpanel>
                    <br>
                    <s:if test="%{#iteradorTaller.cantidadAlumnosMaxima > #iteradorTaller.cantidadAlumnosactual}">
                        <sj:a id="inscribirTaller%{#iteradorTaller.id}" button="true" buttonIcon="ui-icon-circle-check"
                             onclick="abrirPopUpPagoInscripcion('%{#iteradorTaller.id}','%{#iteradorTaller.costoInscripcion}','%{#iteradorTaller.costo}');">Inscribir</sj:a>
                    </s:if>
                    <s:else>
                        No hay cupos diposnibles
                    </s:else>
                </div>
            </td>
            </s:iterator>
        </tr>
    </table>
</div>

<%--<s:form action="guardarInscribirTaller" namespace="/usuario/taller" id="idFormInscribir">
    <s:hidden name="tallerModel.id" id="hiddenIdTallerInscribir"/>
    <s:hidden name="alumnoModel.id"/>
</s:form>--%>

<div id="dialogoNoticia">
    <sj:dialog id="dialogPagoInscripcion" showEffect="scale" hideEffect="scale" autoOpen="false" modal="true"
               title="Pago Inscripción"
               openTopics="openEffectDialog" closeTopics="closeEffectDialog" minHeight="250" minWidth="570">

        <table width="100%">
        <br>
            <div id="divCostoMensualidad" class="pagoInscripcionDialogo"></div>
            <div id="divCostoInscripcion" class="pagoInscripcionDialogo"></div>
            <div id="totalPagar" class="pagoInscripcionDialogo"></div><br>



        <s:form id="inscripcionFormulario" action="guardarInscribirTaller" namespace="/usuario/taller">
            <s:hidden name="userModel.cedula"/>
            <s:hidden name="userModel.id"/>
            <s:hidden name="tallerModel.id" id="hiddenIdTallerInscribir"/>
            <s:hidden name="alumnoModel.id"/>
            <s:hidden name="pagosModel.montoCalculado" id="hiddenMontoCalculado"/>

                <%--Se comrpueba que usuario esta logueado por que el representante no puede pagar en efectivo--%>
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                    <s:radio onchange="cambioModoPago();" id="idTipoPago" name="modoPago" key="label.pago.tipo"
                             list="#{'1':'Deposito','2':'Transferencia'}" value="2"/>
                </sec:authorize>

                <sec:authorize access="hasRole('REPRESENTANTE')">
                    <s:radio id="idTipoPago" name="modoPago" key="label.pago.tipo"
                             list="#{'1':'Deposito','2':'Transferencia'}" value="2"/>
                </sec:authorize>

                <s:textfield id="idNumeroComprobante" name="pagosModel.numeroComprobante" key="label.pago.numero.comprobante"/>
        </s:form>
        <div class="botones">

            <sj:a id="guardar" button="true" buttonIcon="ui-icon-circle-check" onclick="inscribirTallerFunction();">
                Realizar Inscripci&oacute;n
            </sj:a>
            <sj:a id="cancelar" button="true" onclick="$('#dialogPagoInscripcion').dialog('close');"
                  buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
        </div>
            </table>
    </sj:dialog>
</div>


</body>
</html>
