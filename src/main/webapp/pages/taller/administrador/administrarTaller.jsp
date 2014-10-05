<%@ taglib prefix="s" uri="/struts-tags" %>
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
</script>
</head>
<body>

<div>
    <s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;" theme="jquery"/>
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
                        <sj:tab id="tab1" target="tone" label="Detalle"/>
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
                    <sj:a id="editarTaller%{#iteradorTaller.id}" button="true" buttonIcon="ui-icon-pencil" value="Save"
                          onclick="editarTallerFunction('%{#iteradorTaller.id}');">Editar</sj:a>
                    <sj:a id="eliminarTaller%{#iteradorTaller.id}" button="true" buttonIcon="ui-icon-trash" value="Save"
                          onclick="eliminarTallerFunction('%{#iteradorTaller.id}');">Eliminar</sj:a>
                </div>
            </td>
            </s:iterator>
        </tr>
    </table>
</div>

<s:form action="cargarEditarTaller" namespace="/administrador/taller" id="idFormEditar">
    <s:hidden name="tallerModel.id" id="hiddenIdTaller"/>
</s:form>

<s:form action="guardarEliminarTaller" namespace="/administrador/taller" id="idFormEliminar">
    <s:hidden name="tallerModel.id" id="hiddenIdEliminarTaller"/>
</s:form>

</body>
</html>
