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
<%--<script type="text/javascript" src="<s:url value="/resources/js/taller.js"/>"></script>--%>
<script type="text/javascript"  src="<s:url value="/resources/js/fileupload/vendor/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"  src="<s:url value="/resources/js/fileupload/jquery.iframe-transport.js"/>"></script>
<script type="text/javascript"  src="<s:url value="/resources/js/fileupload/jquery.fileupload.js"/>"></script>
<html>
<head>
    <title></title>
    <script>
        function crearNoticiaFunction() {
            $("#guardarCartelera").submit();
        }

        $(document).ready(function () {
            //Subir imagen y mostrar en div
            $('#input-image').change(function (e) {
                addImage(e);
            });

        });


    </script>

</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Informacion de contacto
    </div>
    <div id="formularioInterno" class="formInterno">
        <b>Direccion:</b><s:property value="contactoModel.direccion"/><br>
        <b>Correo:</b><s:property value="contactoModel.correo"/><br>
        <b>Telefonos:</b><s:property value="contactoModel.telefonos"/><br>
        <b>Nro de Cuenta:</b><s:property value="contactoModel.cuenta"/><br>
        <b>Otros:</b><s:property value="contactoModel.otros"/><br>
    </div>
    <br>
    <br>
</div>









</body>
</html>