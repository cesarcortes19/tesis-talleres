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

    function inscribirTallerFunction(element){
        $("#hiddenIdTallerInscribir").val(element);
        $("#idFormInscribir").submit();
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
                        <div id="tone"><s:property value="descripcion"/></div>
                        <div id="ttwo"><s:property value="horario"/></div>
                        <div id="tthree"><s:property value="cantidadAlumnosactual"/>/<s:property
                                value="cantidadAlumnosMaxima"/> Alumnos</div>
                    </sj:tabbedpanel>
                    <br>
                    <sj:a id="inscribirTaller%{#iteradorTaller.id}" button="true" buttonIcon="ui-icon-circle-check"
                          onclick="inscribirTallerFunction('%{#iteradorTaller.id}');">Inscribir</sj:a>
                </div>
            </td>
            </s:iterator>
        </tr>
    </table>
</div>

<s:form action="guardarInscribirTaller" namespace="/usuario/taller" id="idFormInscribir">
    <s:hidden name="tallerModel.id" id="hiddenIdTallerInscribir"/>
    <s:hidden name="alumnoModel.id"/>
</s:form>

</body>
</html>
