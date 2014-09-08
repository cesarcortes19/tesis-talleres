<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 30/08/2014
  Time: 04:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script>
        function editarTallerFunction() {
            $("#formEditarTaller").submit();
        }
    </script>

</head>
<body>

<div id="formulario" cssClass="formulario">
    <s:form action="guardarEditarTaller" namespace="/administrador/taller" id="formEditarTaller">
        <s:hidden name="tallerModel.id"/>
        <s:textfield key="taller.form.label.nombre" name="tallerModel.name"/>
        <s:textfield key="taller.form.label.horario" name="tallerModel.horario"/>
        <s:textarea key="taller.form.label.descripcion" name="tallerModel.descripcion"/>
        <s:textfield key="taller.form.label.cantidad.inscripciones" name="tallerModel.cantidadAlumnosMaxima" onkeypress="return onlyNumber(event);"/>
    </s:form>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="editarTallerFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>


</body>
</html>
