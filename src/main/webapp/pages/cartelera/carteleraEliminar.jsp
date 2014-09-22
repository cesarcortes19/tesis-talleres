<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 29/06/14
  Time: 08:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script>
        function mostrarDetalle(element){
            $("#divDetalleNoticia").html(element);
        }

        function eliminarNoticia(element) {
            var x;
            if (confirm("¿Está seguro que desea eliminar?") == true) {
                $("#idNoticia").val(element);
                $("#eliminarCartelera").submit();
            }
        }
    </script>

    <title></title>
</head>
<body>


<div class="cartelera">

    <div id="titulo" class="TituloformInterno">
        Cartelera Informativa
    </div>

    <div>
        <table class="mostrarCurso" align="center">

            <s:iterator value="noticiaList" var="iteradorNoticia" status="statusNoticia">
            <s:if test="%{#statusNoticia.index%3 == 0}">
            </tr>
            <tr>
                </s:if>
                <td>
                    <div class="noticia">
                        <img src="<s:url value="/resources/images/Logo Ceapucv2.jpg"/>" width="100px" height="100px"/>
                        <br>
                        <div class="tituloNoticia">
                            <s:property value="titulo"/>
                        </div>
                        </br>
                        <div class="descripcionNoticia">
                            <s:property value="descripcion"/>
                        </div>
                        </br><b>(<s:property value="fechaCreacion"/>)</b>
                    </div>
                    <div class="botones">

                        <sj:a id="eliminar%{#iteradorNoticia.id}" button="true" buttonIcon="ui-icon-close" onclick="eliminarNoticia('%{#iteradorNoticia.id}')">
                            Eliminar noticia
                        </sj:a>
                    </div>
                </td>
                </s:iterator>
            </tr>
        </table>
    </div>
</div>


            <!--a href="#" onclick="eliminarNoticia('<!s:property value="id"/>')">Eliminar noticia</a-->

</div>

<s:form action="eliminarCartelera" namespace="/cartelera" id="eliminarCartelera">
    <s:hidden name="idNoticia" id="idNoticia"/>
</s:form>
</body>
</html>
