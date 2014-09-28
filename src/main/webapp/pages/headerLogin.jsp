<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags" %>
<head>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/menu.css"/>" media="screen"/>
    <link rel="stylesheet" type="text/css" href="<s:url value="/resources/css/style.css"/>" media="screen"/>
    <script type="text/javascript" src="<s:url value="/resources/js/validation.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/messages.js"/>"></script>
    <script type="text/javascript" src="<s:url value="/resources/js/menu.js"/>"></script>
    <script>
        function submitFormulario(element){
            $("#"+element).submit();
        }
    </script>
    <%--<sj:head jqueryui="true" jquerytheme="smoothness"/>--%>
    <%--<sj:head jqueryui="true" jquerytheme="pepper-grinder"/>--%>
    <sj:head jqueryui="true" jquerytheme="cupertino"/>
    <%--<sj:head jqueryui="true" jquerytheme="flick"/>--%>
</head>
<body>

<style type="text/css">

</style>
<div class="bannerHeader" id="bannerHeader">
    <img id="logo" class="logo" src="<s:url value="/resources/images/logo_gestion_talleres.png"/>" />
</div>
</body>