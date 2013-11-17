<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>

<form method ="get" name="login" action="loginCheck.jsp">
Benutzername<br />
<input type="text" name="loginName" /><br />
Passwort<br />
<input type="password" name="password" /><br />
<input type="submit" value="login" />
<input type="reset" value="reset" />
</form>
<%= new java.util.Date() %>

</body>
</html>