<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Here</title>
<script type="text/javascript">
	function validateInput(){
		var userName=document.getElementById("userName").value;
		var password=document.getElementById("password").value;
		if(userName==""){
			alert("Please enter user name:");
			return false;
		}
		if(password==""){
			alert("Please enter password:");
			return false;
		}
		return true;
		
	}
</script>
</head>
<body>
<%if(request.getParameter("valid")!=null&&request.getParameter("valid").equals("no")){ %>
<div>Invalid username or password</div>
<%} %>

<%-- <%if(request.getParameter("sessionTimeOut")!=null&&request.getParameter("sessionTimeOut").equals("yes")){ %>
<div>Your session has been expired please login again</div>
<%} %> --%>
	<form action="LoginServlet" method="post" onsubmit="return validateInput();">
		<div><label>User Name <sub>*:&nbsp;</sub></label><input type="text" id="userName" name="userName"> </div>
		<div><label>Password <sub>*:&nbsp;&nbsp;&nbsp;&nbsp;</sub></label><input type="password" id="password" name="password"> </div>
		<div>&nbsp;<br /> <input type="submit" value="Submit"></div>
	</form>
</body>
</html>