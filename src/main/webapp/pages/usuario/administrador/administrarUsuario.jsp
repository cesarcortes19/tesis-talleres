<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 17/08/2014
  Time: 04:19 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sjg" uri="/struts-jquery-grid-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title></title>

    <script type="text/javascript">

        function loadUser() {
            $("#cargarCrearUsuario").submit();
        }

        function editarUsuario() {
            s = $("#gridUsuario").jqGrid('getGridParam', 'selrow');
            if (s == null) {
                $(".actionMessage").remove();
                addInformativeMessage("gridUsuario", "<s:text name="form.error.grid.noSelection"/>");
                return false;
            } else {
                var id = $("#gridUsuario").jqGrid('getCell', s, 'id');
                $('#editarUsario').val(id);
            }
            $("#guardarEditarUsuario").submit();
        }

        function eliminarUsuario() {

            s = $("#gridUsuario").jqGrid('getGridParam', 'selrow');
            if (s == null) {
                $(".actionMessage").remove();
                addInformativeMessage("gridUsuario", "<s:text name="form.error.grid.noSelection"/>");
                return false;
            } else {
                if(!confirm("¿Está seguro que desea eliminar este usuario? Se perderan todos los datos asociados a este usuario"))
                    return true;
                var id = $("#gridUsuario").jqGrid('getCell', s, 'id');
                $('#eliminarUsuario').val(id);
            }
            $("#guardarEliminarUsuario").submit();
        }


    </script>
</head>
<body>
<div id="titulo" class="TituloformInterno">
    Ver todos los usuarios
</div>

<s:url id="remoteurl" action="cargarUsuarioJson" namespace="/administrador/usuario"/>
<s:url id="editurl" action="editarUsuarioJson" namespace="/administrador/usuario"/>
<sjg:grid
        id="gridUsuario"
        caption="Representantes"
        dataType="json"
        href="%{remoteurl}"
        pager="false"
        navigator="false"
        navigatorSearchOptions="{sopt:['eq','ne','lt','gt']}"
        navigatorAddOptions="{height:280,reloadAfterSubmit:true}"
        navigatorEditOptions="{height:280,reloadAfterSubmit:false}"
        navigatorEdit="false"
        navigatorView="false"
        navigatorDelete="true"
        navigatorDeleteOptions="{height:280,reloadAfterSubmit:true}"
        gridModel="gridModel"
        editurl="%{editurl}"
        onSelectRowTopics="rowselect"
        viewrecords="true"
        autowidth="true"
        shrinkToFit="false"
        >
    <sjg:gridColumn name="id" index="id" title="ID" width="60" formatter="integer" editable="false"
                    hidden="true"/>
    <s:property value='nombre'/>
    <sjg:gridColumn name="nombre" frozen="true" index="nombre" title="Nombre" width="250" edittype="text"
                    align="center"/>
    <sjg:gridColumn name="apellido" index="apellido" title="Apellido" align="center"/>
    <sjg:gridColumn name="cedula" index="cedula" title="Cédula" align="center"/>
    <sjg:gridColumn name="email" index="email" title="Email" align="center"/>
    <sjg:gridColumn name="email2" index="email2" title="Email Alternativo" align="center"/>
    <sjg:gridColumn name="telefono1" index="telefono1" title="Telefono" align="center"/>
    <sjg:gridColumn name="telefono2" index="telefono2 email2" title="telefono Alternativo" align="center"/>

</sjg:grid>
<br/>

<div class="botones">
    <sj:a id="cargarCrear" button="true" buttonIcon="ui-icon-circle-plus" onclick="loadUser();">
        Crear Usuario
    </sj:a>
    <sj:a id="editar" button="true" buttonIcon="ui-icon-pencil" onclick="editarUsuario();">
        Editar Usuario
    </sj:a>
    <sj:a id="eliminar" button="true" buttonIcon="ui-icon-trash" onclick="eliminarUsuario();">
        Eliminar Usuario
    </sj:a>
    </br >
    </br >
    <sj:a id="ver" button="true" buttonIcon="ui-icon-folder-open" onclick="verUsuario();">
        Ver Usuario
    </sj:a>
</div>

<s:form action="cargarEditarCuentaUsuario" namespace="/administrador/usuario" id="guardarEditarUsuario">
    <s:hidden name="usuarioModel.id" id="editarUsario"/>
</s:form>
<s:form action="guardarEliminarUsuario" namespace="/administrador/usuario" id="guardarEliminarUsuario">
    <s:hidden name="usuarioModel.id" id="eliminarUsuario"/>
</s:form>
<s:form action="cargarCrearUsuario" namespace="/administrador/usuario" id="cargarCrearUsuario">
</s:form>

<br/>
<br/>
</body>
</html>
