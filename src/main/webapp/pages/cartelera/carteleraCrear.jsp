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
<script type="text/javascript" src="<s:url value="/resources/js/taller.js"/>"></script>
<html>
<head>
    <title></title>
    <script>
        function crearNoticiaFunction() {
            $("#guardarCartelera").submit();
        }
    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Crear Noticia

    <div id="formularioInterno" class="formInterno">
        <s:form action="guardarCartelera" namespace="/cartelera" id="guardarCartelera">
            <s:textfield key="cartelera.form.label.titulo" name="noticiaModel.titulo" cssClass="box"/>
            <s:textarea key="cartelera.form.label.descripcion" name="noticiaModel.descripcion" cssClass="boxArea"/>
        </s:form>
    </div>
    </div>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="crearNoticiaFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>



</body>
</html>
