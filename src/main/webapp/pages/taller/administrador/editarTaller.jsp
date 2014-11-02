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
            if(confirm("\u00BFEst\u00e1 seguro que desea editar el taller?")){
            $("#formEditarTaller").submit();
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
            $('#idImageToShow').attr("src", result);
        }
    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Editar Taller

        <div id="formularioInterno" class="formInterno">
            <s:form method="POST" action="guardarEditarTaller" namespace="/administrador/taller" id="formEditarTaller" acceptcharset="UTF-8" enctype="multipart/form-data">
                <s:hidden name="tallerModel.id"/>
                <s:textfield key="taller.form.label.nombre" name="tallerModel.name" cssClass="box" maxlength="250"/>
                <s:textarea key="taller.form.label.descripcion" name="tallerModel.descripcion" cssClass="boxArea" maxlength="250"/>
                <s:textfield key="taller.form.label.cantidad.inscripciones" name="tallerModel.cantidadAlumnosMaxima" onkeypress="return onlyNumber(event);" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.lunes" name="tallerModel.horarioLunes" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.martes" name="tallerModel.horarioMartes" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.miercoles" name="tallerModel.horarioMiercoles" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.jueves" name="tallerModel.horarioJueves" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.viernes" name="tallerModel.horarioViernes" cssClass="box" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.mensualidad" name="tallerModel.costo" cssClass="box" value="%{getText('format.number',{tallerModel.costo})}" onkeypress="return onlyNumberColonAndDot(event);" maxlength="250"/>
                <s:textfield key="taller.form.label.horario.inscripcion" name="tallerModel.costoInscripcion" value="%{getText('format.number',{tallerModel.costoInscripcion})}" cssClass="box" onkeypress="return onlyNumberColonAndDot(event);" maxlength="250"/>
                <s:file key="cartelera.form.label.imagen" id="input-image" name="fileUpload" cssClass="boxFile"/>
            </s:form>

            <s:if test="%{tallerModel.picture!=null}">
            <div id="your-picture-bg">
                <img id="idImageToShow" src="
                                <s:url namespace="/todos/Image" action='ImageAction'>
                                    <s:param name="imageId"><s:property value="tallerModel.id"/></s:param>
                                </s:url>
                            " width="200px" height="200px"/>
            </div>
            </s:if>
            <s:else>
            <div id="your-picture-bg">
                <img id="idImageToShow<s:property value="id"/>" src="<s:url value="/resources/images/Logo_Ceapucv2.jpg"/>" width="100px"
                     height="100px"/>
            </div>
            </s:else>


<%--            <div id="your-picture-bg"><img id="imgSalida" width="200px" height="200px" src=""/><br><br>
                <span style="font-size: 11px">*Si no sube una imagen, se mostrara el logo del colegio como imagen predeterminada</span>
            </div>--%>

<%--

            <div id="your-picture-bg"><img id="imgSalida" width="200px" height="200px" src="
                                <s:url namespace="/todos/Image" action='ImageAction'>
                                    <s:param name="imageId"><s:property value="id"/></s:param>
                                </s:url>"/><br><br>
                <span style="font-size: 11px">*Si no sube una imagen, se mostrara el logo del colegio como imagen predeterminada</span>
            </div>--%>
        </div>
    </div>
    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="editarTallerFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelarEditarTaller();" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</div>


</body>
</html>
