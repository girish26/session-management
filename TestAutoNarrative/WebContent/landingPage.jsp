<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Landing Page</title>
</head>
<body>


<div align="right">
<a>Welcome</a>
<%=request.getSession().getAttribute("userName") %>
<br>
<a href="LoginServlet?logoutRequest=yes">Logout</a>

</div>
<a href="LandingServlet">AutoNarrative</a>
</body>
</html>