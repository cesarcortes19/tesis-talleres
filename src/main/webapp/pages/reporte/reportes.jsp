<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 21/10/2014
  Time: 09:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script>
        function habilitarSeccion() {
            if ($("#gradoReporte").val() == "") {
                $("#seccionReporte").val("");
                $("#seccionReporte").attr('disabled', true);
                $("#seccionReporte").addClass("elementDisabled");
            } else {
                $("#seccionReporte").removeAttr('disabled');
                $("#seccionReporte").removeClass("elementDisabled");
            }
        }

        function generarReporte(){
            if($("#selectTaller").val()==-1 && $("#gradoReporte").val() == ""){
                alert("Debe seleccionar al menos un parametro de busqueda")
            }else{
            $('#reporteForm').submit();
            }
            return;
        }
    </script>


</head>
<body>

<div id="formulario" class="formulario" style="height: 300px">
    <div id="titulo" class="TituloformInterno">
        Generar Reporte
    </div>
    <br>

    <div id="formularioInterno" class="formInterno">
        <s:form action="generarReporte" namespace="/administrador/reporte" id="reporteForm">
            <s:select label="Talleres"
                      headerValue="Seleccione un taller"
                      headerKey="-1"
                      list="tallerModelList"
                      listKey="id"
                      listValue="name"
                      name="reporteTo.taller" id="selectTaller" cssStyle="width: 220px; height: 40px" cssClass="box"/>

            <s:textfield id="gradoReporte" onchange="habilitarSeccion();" label="Grado" name="reporteTo.grado"
                         cssClass="box"/>
            <s:textfield id="seccionReporte" label="Sección" name="reporteTo.seccion" cssClass="box elementDisabled" disabled="true"/>
            <s:textfield id="tituloReporte" key="report.form.label.titulo" name="reporteTo.titulo" cssClass="box"/>
        </s:form>
    </div>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-check" onclick="generarReporte();">
            Generar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close"
              value="Cancelar">Cancelar</sj:a>
    </div>

</div>

<br>
<br> <br>
<br>
<br>

</body>
</html>
