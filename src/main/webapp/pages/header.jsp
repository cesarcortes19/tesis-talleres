<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/menu.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/style.css"/>" media="screen"/>
    <script type="text/javascript" src="<s:url value="/resources/js/validation.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/messages.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/menu.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/util.js"/>"></script>
    <script>

        function loginFunction() {
            if ($("#cedulaLogin").val() == "" || $("#passwordLogin").val() == "") {
                alert("Debe ingresar contraseña y cédula para poder autenticarse");
            } else {
                $("#idFormLogin").submit();
            }
        }
    </script>

    <sj:head jqueryui="true" jquerytheme="cupertino"/>
</head>
<body>
<style type="text/css">

</style>
<div class="bannerHeader" id="bannerHeader">
    <table width="100%">
        <tr>
            <td width="70%">
                <img id="logo" class="logo" src="<s:url value="/resources/images/logo_gestion_talleres.png"/>"/>
            </td>

            <td>
                <s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;"
                                 theme="jquery"/>
                <sec:authorize access="isAnonymous()">
                    <div>
<%--                        <s:actionmessage cssStyle="border:0px solid black;padding: 0 200 0 200;font-size:14px;"
                                         theme="jquery"/>--%>
                        <table>
                            <td>
                                <div align="right">

                                    <s:form action="autenticarLogin" namespace="/login" id="idFormLogin">
                                        <s:textfield id="cedulaLogin" key="usuario.form.label.cedula"
                                                     name="userModel.cedula"
                                                     cssClass="boxHeader"/>
                                        <s:password id="passwordLogin" key="usuario.form.label.password"
                                                    name="userModel.password"
                                                    cssClass="boxHeader"/>
                                    </s:form>
                                </div>
                            </td>
                            <td style="vertical-align: bottom">
                                <div class="botonesHeader" align="right">
                                    <sj:a id="autenticarse" button="true" onclick="loginFunction();">
                                        Enviar
                                    </sj:a>
                                </div>
                            </td>
                        </table>
                    </div>
                </sec:authorize>
            </td>
        </tr>
    </table>

    <div id="contendorMenu">
        <div id="menu">
            <ul class="menu">


                <sec:authorize access="hasRole('ADMINISTRADOR')">
                    <s:include value="/pages/menus/menuAdministrador.jsp"></s:include>
                </sec:authorize>

                <sec:authorize access="hasRole('REPRESENTANTE')">
                    <s:include value="/pages/menus/menuRepresentante.jsp"></s:include>
                </sec:authorize>

                <sec:authorize access="isAnonymous()">
                    <s:include value="/pages/menus/menuUsuarioNoLogeado.jsp"></s:include>
                </sec:authorize>
                <%--<li class="last"><a href="#"><span>Contactenos</span></a></li>--%>
            </ul>
        </div>
    </div>
</div>
</body>