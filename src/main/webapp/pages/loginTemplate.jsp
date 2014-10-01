<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
    </title>
</head>

<body>
<div class="Principal">
    <table border="0" width="100%" >
        <tr>
            <td colspan="2"><tiles:insertAttribute name="headerLogin"></tiles:insertAttribute><br/></td>
        </tr>
        <tr>
            <td><tiles:insertAttribute name="body"/></td>
        </tr>
        <tr>
            <td colspan="2"><tiles:insertAttribute name="footer"/></td>
        </tr>
    </table>
</div>
</body>

</html>