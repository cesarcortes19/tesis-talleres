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
        if (confirm("¿Está seguro que desea eliminar?") == true) {
            $("#hiddenIdEliminarTaller").val(element);
            $("#idFormEliminar").submit();
        }

    }

    function editarTallerFunction(element) {
        $("#hiddenIdTaller").val(element);
        $("#idFormEditar").submit();
    }

    function abrirPopUpPagoInscripcion(element, costoInscripcion) {
        $("#hiddenIdTallerInscribir").val(element);
        $("#hiddenMontoCalculado").val(costoInscripcion);
        $("#divCostoInscripcion").html('<b> Costo Inscripción: </b>' + costoInscripcion +' Bs.');
        $("#dialogPagoInscripcion").dialog('open');
    }

    function inscribirTallerFunction() {
        var bandera= true;
        if($("#idNumeroComprobante").val()==''){
            bandera = false;
            if($("input[name=modoPago]:checked").val()=='3'){
                bandera = true;
            }
        }

        if(bandera)
            $("#inscripcionFormulario").submit();
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

        <s:iterator value="tallerList" var="iteradorTaller" status="statusTaller">
        <s:if test="%{#statusTaller.index%3 == 0}">
        </tr>
        <tr>
            </s:if>
            <td>
                <div class="mostrarCurso">
                    <div class="tituloTaller" style="width: auto; height: 10%"><s:property value="name"/></div>
                    <sj:tabbedpanel id="%{#iteradorTaller.id}">
                        <sj:tab id="tab1" target="tone" label="Descripcion"/>
                        <sj:tab id="tab2" target="ttwo" label="Horarios"/>
                        <sj:tab id="tab3" target="tthree" label="Alumnos"/>
                        <div id="tone"><br>
                            <b>Costo inscripci&oacute;n:</b> <s:property value="costo"/> Bs.<br><br>
                            <b>Costo mensualidad:</b> <s:property value="costoInscripcion"/> Bs.<br><br>
                            <s:property value="descripcion"/>

                        </div>
                        <div id="ttwo"><br>
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
                            <s:if test="%{horarioSabado!=''}">
                                <b>S&aacute;bado:</b> <s:property value="horarioSabado"/><br><br>
                            </s:if>
                            <s:if test="%{horarioDomingo!=''}">
                                <b>Domingo:</b> <s:property value="horarioDomingo"/><br><br>
                            </s:if>

                        </div>
                        <div id="tthree"><br>
                            <b>Cupos:</b> <s:property value="cantidadAlumnosactual"/>/<s:property
                                    value="cantidadAlumnosMaxima"/> Alumnos
                        </div>
                    </sj:tabbedpanel>
                    <br>
                    <sj:a id="inscribirTaller%{#iteradorTaller.id}" button="true" buttonIcon="ui-icon-circle-check"
                          onclick="abrirPopUpPagoInscripcion('%{#iteradorTaller.id}','%{#iteradorTaller.costoInscripcion}');">Inscribir</sj:a>
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
            <div id="divCostoInscripcion" class="pagoInscripcionDialogo">
            </div>


        <s:form id="inscripcionFormulario" action="guardarInscribirTaller" namespace="/usuario/taller">
            <s:hidden name="tallerModel.id" id="hiddenIdTallerInscribir"/>
            <s:hidden name="alumnoModel.id"/>
            <s:hidden name="pagosModel.montoCalculado" id="hiddenMontoCalculado"/>

                <%--Se comrpueba que usuario esta logueado por que el representante no puede pagar en efectivo--%>
                <sec:authorize access="hasRole('ADMINISTRADOR')">
                    <s:radio id="idTipoPago" name="modoPago" key="label.pago.tipo"
                             list="#{'1':'Deposito','2':'Transferencia'}" value="2"/>
                </sec:authorize>

                <sec:authorize access="hasRole('REPRESENTANTE')">
                    <s:radio onchange="cambioModoPago();" id="idTipoPago" name="modoPago" key="label.pago.tipo"
                             list="#{'1':'Deposito','2':'Transferencia','3':'Efectivo' }" value="2"/>
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
