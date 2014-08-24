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
        function crearUsuario(){
            $("#formCrearUsuario").submit();
        }

        function validarTexto(){
            var elements = $('[name="ElementNameHere"]').each(function(){

            });
        }

        function validarSelect(){

        }
    </script>
</head>
<body>
<s:div id="formulario" cssClass="formulario">
    <s:form action="crearUsuario" namespace="/usuario" id="formCrearUsuario">
        </br>
        </br>
        <s:textfield key="usuario.form.label.nombre" class="requerido" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.apellido" name="usuarioTo.lastName"/>
        <s:textfield key="usuario.form.label.cedula" class="requerido" name="usuarioTo.cedulaMadre"/>
        <s:textfield key="usuario.form.label.email1" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.email2" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.password" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.direccion" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.telefono" name="usuarioTo.firstName"/>
        <s:textfield key="usuario.form.label.telefono2" name="usuarioTo.firstName"/>
        <s:textarea key="usuario.form.label.observaciones" name="usuarioTo.firstName"/>
    </s:form>


    <br/>
    <br/>

    <div class="grid">
        <s:url id="remoteurl" action="cargarRepresentadosJson" namespace="/representado"/>
        <s:url id="editurl" action="editarRepresentadosJson" namespace="/representado"/>
        <sjg:grid
                id="gridRepresentados"
                caption="Representados"
                dataType="json"
                href="%{editurl}"
                pager="true"
                navigator="true"
                navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
                navigatorAddOptions="{height:280,reloadAfterSubmit:false,fontSize:12, fontSizeAdjust:12 }"
                navigatorEdit="false"
                navigatorView="false"
                navigatorDelete="true"
                navigatorSearch="false"
                navigatorRefresh="false"
                navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
                gridModel="gridModel"
                editurl="%{editurl}"
                onSelectRowTopics="rowselect"
                viewrecords="true"
                width="500"
                height="100"
                pagerButtons="false"
                rowNum="3"
                pagerInput="false"
                >
            <sjg:gridColumn name="id" index="id" title="ID" width="60" formatter="integer" editable="true"
                            sortable="false" search="true" searchoptions="{sopt:['eq','ne','lt','gt']}"/>
            <sjg:gridColumn name="nombre" frozen="true" index="nombre" title="Nombre" width="250"
                            editable="true" edittype="text"/>
            <sjg:gridColumn name="apellido" index="apellido" title="Apellido" editable="true" edittype="text"/>
            <sjg:gridColumn name="grado" index="grado" title="Grado" editable="true"/>
            <sjg:gridColumn name="seccion" index="seccion" title="Seccion" editable="true"/>
            <%--<sjg:gridColumn name="birthday" index="birthday" title="Fecha Nacimiento" formatter="date"
                            formatoptions="{newformat : 'd.m.Y H:i', srcformat : 'Y-m-d H:i:s'}" editable="true"/>--%>
        </sjg:grid>


        <br/>
    </div>


    <div class="botones">
        <sj:a id="save" button="true" buttonIcon="ui-icon-disk" onclick="crearUsuario" value="Guardar">Guardar</sj:a>
        <sj:a id="cancelar" button="true" buttonIcon="ui-icon-close" value="Cancelar">Cancelar</sj:a>
    </div>
</s:div>
</body>
</br>
</br>
</html>