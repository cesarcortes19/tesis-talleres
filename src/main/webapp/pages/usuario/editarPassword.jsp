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

        function CompararPassword(){

            if($("#newPass").val() == $("#newPassRepeat").val()){
                $("#editarPasswordUsuario").submit();
            }else{
                alert("El campo Nueva Contraseña y Confirmar Contraseña deben ser identicos.")
            }

        }

    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Editar Contraseña

        <div id="formularioInterno" class="formInternoCrearNoticia">
            <s:form action="passwordEditarUsuario" namespace="/usuario" id="editarPasswordUsuario">
                <s:textfield id="newPass" key="usuario.form.label.newpassword" name="usuarioModel.password" cssClass="box"/>
                <s:textfield id="newPassRepeat" key="usuario.form.label.confirmarpassword" name="usuarioModel.confirmPassword" cssClass="box" />
            </s:form>
        </div>
    </div>
    <div class="botones">
        <sj:a id="cambiar" button="true" buttonIcon="ui-icon-disk" onclick="CompararPassword();">
            Editar
        </sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>



</body>
</html>
