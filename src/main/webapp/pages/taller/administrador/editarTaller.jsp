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
            if(confirm("¿Está seguro que desea editar el taller?")){
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
            $('#imgSalida').attr("src", result);
        }
    </script>

</head>
<body>

<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Editar Taller

        <div id="formularioInterno" class="formInterno">
            <s:form action="guardarEditarTaller" namespace="/administrador/taller" id="formEditarTaller">
                <s:hidden name="tallerModel.id"/>
                <s:textfield key="taller.form.label.nombre" name="tallerModel.name" cssClass="box"/>
                <s:textarea key="taller.form.label.descripcion" name="tallerModel.descripcion" cssClass="boxArea"/>
                <s:textfield key="taller.form.label.cantidad.inscripciones" name="tallerModel.cantidadAlumnosMaxima" onkeypress="return onlyNumber(event);" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.lunes" name="tallerModel.horarioLunes" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.martes" name="tallerModel.horarioMartes" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.miercoles" name="tallerModel.horarioMiercoles" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.jueves" name="tallerModel.horarioJueves" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.viernes" name="tallerModel.horarioViernes" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.sabado" name="tallerModel.horarioSabado" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.domingo" name="tallerModel.horarioDomingo" cssClass="box"/>
                <s:textfield key="taller.form.label.horario.mensualidad" name="tallerModel.costo" cssClass="box" onkeypress="return onlyNumberColonAndDot(event);"/>
                <s:textfield key="taller.form.label.horario.inscripcion" name="tallerModel.costoInscripcion" cssClass="box" onkeypress="return onlyNumberColonAndDot(event);"/>
                <s:file key="cartelera.form.label.imagen" id="input-image" name="fileUpload" cssClass="boxFile"/>
            </s:form>
            <div id="your-picture-bg"><img id="imgSalida" width="200px" height="200px" src="
                                <s:url namespace="/todos/Image" action='ImageAction'>
                                    <s:param name="imageId"><s:property value="id"/></s:param>
                                </s:url>"/><br><br>
                <span style="font-size: 11px">*Si no sube una imagen, se mostrara el logo del colegio como imagen predeterminada</span>
            </div>
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
