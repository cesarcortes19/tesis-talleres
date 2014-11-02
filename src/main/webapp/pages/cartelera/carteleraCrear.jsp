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
            if(confirm("\u00BFEst\u00e1 seguro que desea crear la noticia?")){
            $("#guardarCartelera").submit();
            }
        }

        $(document).ready(function () {
            //Subir imagen y mostrar en div
            $('#input-image').change(function (e) {
                addImage(e);
            });

        });

        function addImage(e) {
            var file = e.target.files[0],
                    imageType = /image.*/;

            if (!file.type.match(imageType))
                return;

            var reader = new FileReader();
            reader.onload = fileOnload;
            reader.readAsDataURL(file);
        }

        function fileOnload(e) {
            var result = e.target.result;
            $('#imgSalida').attr("src", result);
        }
    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Crear Noticia<br>

    <div id="formularioInterno" class="formInternoCrearNoticia">
        <s:form method="POST" action="guardarCartelera" namespace="/administrador/cartelera" id="guardarCartelera" enctype="multipart/form-data" acceptcharset="UTF-8">
            <s:textfield key="cartelera.form.label.titulo" name="noticiaModel.titulo" cssClass="box" maxlength="250"/>
            <s:textarea key="cartelera.form.label.descripcion" name="noticiaModel.descripcion" cssClass="boxArea" maxlength="1800"/>
            <s:file key="cartelera.form.label.imagen" id="input-image" name="fileUpload" cssClass="boxFile"/>
        </s:form>
        <div id="your-picture-bg"><img id="imgSalida" width="200px" height="200px" src=""/><br><br>
            <span style="font-size: 11px">*Si no sube una imagen, se mostrara el logo del colegio como imagen predeterminada</span>
        </div>
    </div>
    </div>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="crearNoticiaFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>



</body>
</html>
