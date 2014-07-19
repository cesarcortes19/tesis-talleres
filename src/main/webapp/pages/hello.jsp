<%--
  Created by IntelliJ IDEA.
  User: Cesar
  Date: 07/06/14
  Time: 09:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="sec"
          uri="http://www.springframework.org/security/tags"%>
<html>
<body>
<h1>Title : ${title}</h1>
<h1>Message : ${message}</h1>

<sec:authorize access="hasRole('ROLE_USER')">
    <!-- For login user -->
    <%--<c:url value="/j_spring_security_logout" var="logoutUrl" />--%>
<%--    <form action="${logoutUrl}" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
    </form>--%>
<%--    <script>
        function formSubmit() {
            document.getElementById("logoutForm").submit();
        }
    </script>--%>

<%--    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <h2>
            User : ${pageContext.request.userPrincipal.name} | <a
                href="javascript:formSubmit()"> Logout</a>
        </h2>
    </c:if>--%>

AUTORIZADO
</sec:authorize>
NO AUTORIZADO
</body>
</html>