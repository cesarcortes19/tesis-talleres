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
        function editarContacto() {
           if(confirm("\u00BFEst\u00e1 seguro que desea editar la información de contacto?")){
               $("#formEditarContacto").submit();
           }

        }


    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Editar Contacto

        <div id="formularioInterno" class="formInterno">
            <s:form action="guardarEditarContacto" namespace="/administrador/contacto" id="formEditarContacto">
                <s:hidden name="contactoModel.id"/>
                <s:textfield key="contacto.form.label.correo" name="contactoModel.correo" cssClass="box"/>
                <s:textarea key="contacto.form.label.telefonos" name="contactoModel.telefonos" cssClass="boxArea"/>
                <s:textarea key="contacto.form.label.cuentas" name="contactoModel.cuenta" cssClass="boxArea"/>
                <s:textarea key="contacto.form.label.direccion" name="contactoModel.direccion" cssClass="boxArea"/>
                <s:textarea key="contacto.form.label.otros" name="contactoModel.otros" cssClass="boxArea"/>


            </s:form>
        </div>
    </div>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="editarContacto();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>


</body>
</html>