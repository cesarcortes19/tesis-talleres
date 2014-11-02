<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 12/08/2014
  Time: 09:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>

<head>
    <title></title>

    <script>

         var indiceAlumnoInsertar = 0;

        function crearUsuarioFunction() {
            if (confirm("\u00BFEst\u00e1 seguro que desea crear el usuario?")) {
                var dataGrid = $("#gridAlumno").jqGrid("getRowData");
                var dataJson = JSON.stringify(dataGrid);
                $("#alumnoJson").val(dataJson);
                $("#formCrearUsuario").submit();
            }
        }

        function openDialogAddAlumno() {
            $("#dialogAddAlumno").dialog('open');
        }

        function addAlumno(){
            nombre = $("#nameAlumno").val();
            apellido = $("#apellidoAlumno").val();
            grado = $("#gradoAlumno").val();
            seccion = $("#seccionAlumno").val();
            edad = $("#edadAlumno").val();

            if(nombre==""||apellido==""||grado=="0"||seccion==""||edad=="")
                return false;

        row = {nombre: nombre, apellido:apellido, grado:grado, seccion:seccion, edad:edad};

        $("#gridAlumno").jqGrid('addRowData', indiceAlumnoInsertar, row);
            indiceAlumnoInsertar = indiceAlumnoInsertar +1;

            $("#nameAlumno").val("");
            $("#apellidoAlumno").val("");
            $("#gradoAlumno").val("0");
            $("#seccionAlumno").val("");
            $("#edadAlumno").val("");

        }




        function deleteAlumno() {
            var rowid = $("#gridAlumno").jqGrid('getGridParam', 'selrow');
            $("#gridAlumno").jqGrid('delRowData', rowid);
        }
    </script>
</head>
<body>
<div id="formulario" class="formulario">
    <div id="titulo" class="TituloformInterno">
        Crear Usuario
        <div id="formularioInterno" class="formInterno">
            <s:form action="guardarCrearUsuario" namespace="/administrador/usuario" id="formCrearUsuario"
                    acceptcharset="UTF-8">

                <s:textfield key="usuario.form.label.nombre" name="usuarioModel.nombre"
                             onkeypress="return onlyLetters(event);" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.apellido" name="usuarioModel.apellido"
                             onkeypress="return onlyLetters(event);" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.cedula" name="usuarioModel.cedula"
                             onkeypress="return onlyNumber(event);" cssClass="box" maxlength="250"/>
                <s:password key="usuario.form.label.password" name="usuarioModel.password" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.email1" name="usuarioModel.email" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.email2" name="usuarioModel.email2" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.telefono" name="usuarioModel.telefono1"
                             onkeypress="return onlyNumber(event);" cssClass="box" maxlength="250"/>
                <s:textfield key="usuario.form.label.telefono2" name="usuarioModel.telefono2"
                             onkeypress="return onlyNumber(event);" cssClass="box" maxlength="250"/>
                <s:textarea key="usuario.form.label.direccion" name="usuarioModel.direccion" cssClass="boxArea" maxlength="250"/>
                <s:textarea key="usuario.form.label.observaciones" name="usuarioModel.observaciones"
                            cssClass="boxArea" maxlength="1800"/>
                <s:hidden name="listaAlumnoJson" id="alumnoJson"/>
            </s:form>
        </div>
    </div>

    <br/>
    <br/>

    <div class="grid">

        <s:url id="editurl" action="editarAlumnosJson" namespace="/administrador/alumno"/>
        <sjg:grid
                id="gridAlumno"
                caption="Alumnos"
                dataType="json"
                href="%{editurl}"
                pager="true"
                navigator="true"
                navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
                navigatorAddOptions="{height:280,reloadAfterSubmit:false,fontSize:12}"
                navigatorEdit="false"
                navigatorView="false"
                navigatorDelete="false"
                navigatorAdd="false"
                navigatorSearch="false"
                navigatorRefresh="false"
                navigatorViewOptions="true"
                navigatorDeleteOptions="{height:280}"
                gridModel="gridModel"
                onSelectRowTopics="rowselect"
                viewrecords="true"
                width="500"
                height="100"
                pagerButtons="false"
                rowNum="3"
                pagerInput="false"
                navigatorExtraButtons="{
                                                agregar : {
                                                    title : 'Agregar',
                                                    icon: 'ui-icon-plus',
                                                    onclick: function(){ openDialogAddAlumno() }
                                                },
                                                delete : {
                                                    title : 'Borrar',
                                                    icon: 'ui-icon-trash',
                                                    onclick: function(){ deleteAlumno() }
                                                }
                                            }"
                >
            <sjg:gridColumn name="ID" index="id" title="ID" width="60" hidden="true"/>
            <sjg:gridColumn name="nombre" frozen="true" index="nombre" title="Nombre" width="200"
                            editable="true" edittype="text" sortable="false" requiredLabel="true"/>
            <sjg:gridColumn name="apellido" index="apellido" title="Apellido" editable="true" edittype="text"
                            width="200" sortable="false"/>
            <sjg:gridColumn name="grado" index="grado" title="Grado" editable="true" sortable="false"/>
            <sjg:gridColumn name="seccion" index="seccion" title="Seccion" editable="true" sortable="false"/>
            <sjg:gridColumn name="edad" index="edad" title="Edad" formatter="integer" editable="true" sortable="false"
                            onkeypress="return onlyNumber(event);"/>
            <%--<sjg:gridColumn name="birthday" index="birthday" title="Fecha Nacimiento" formatter="date"
                            formatoptions="{newformat : 'd.m.Y H:i', srcformat : 'Y-m-d H:i:s'}" editable="true"/>--%>
        </sjg:grid>


        <br/>
    </div>


    <div class="botones">
        <sj:a id="guardar" button="true" buttonIcon="ui-icon-disk" onclick="crearUsuarioFunction();">
            Guardar
        </sj:a>
        <sj:a id="cancelar" button="true" onclick="botonCancelar();" buttonIcon="ui-icon-close"
              value="Cancelar">Cancelar</sj:a>
    </div>
</div>


<sj:dialog id="dialogAddAlumno" autoOpen="false" modal="true"
           title="Agregar Alumno" cssClass="font-size: 12px;" minHeight="200" minWidth="250">

<table width="100%" style="font-size: 12px;">
    <s:textfield cssClass="boxAlumno" id="nameAlumno" label="Nombre"/>
    <s:textfield cssClass="boxAlumno" id="apellidoAlumno" label="Apellido"/>
    <s:select cssClass="boxSelectAlumno"
              id="gradoAlumno"
              label="Grado"
              cssStyle="font-size: 12px;"
              list="%{#{'0':'Seleccione','Grupo I':'Grupo I','Grupo II':'Grupo II','Grupo III':'Grupo III','1er Grado':'1er Grado','2do Grado':'2do Grado','3er Grado':'3er Grado','4to Grado':'4to Grado','5to Grado':'5to Grado','6to Grado':'6to Grado','1er Año':'1er Año','2do Año':'2do Año','3er Año':'3er Año','4to Año':'4to Año','5to Año':'5to Año'}}">
    </s:select>
    <s:textfield cssClass="boxAlumno" id="seccionAlumno" label="Sección"/>
    <s:textfield cssClass="boxAlumno" id="edadAlumno" label="Edad" onkeypress="return onlyNumber(event);"/>


        </table>
    <br>
    <sj:a id="agregar" cssStyle="font-size: 14px;" button="true" buttonIcon="ui-icon-plus" onclick="addAlumno();">
        Agregar
    </sj:a>
</sj:dialog>

</body>
</br>
</br>
</html>