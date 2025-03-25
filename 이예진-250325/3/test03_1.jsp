<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("userid");
		String psd = request.getParameter("password");
		String gd = request.getParameter("gender");
		String s = request.getParameter("signup");
		String ad = request.getParameter("address");
		
	%>
	
	아이디 : <%=id %> <br>
	비밀번호 : <%=psd %> <br>
	성별 : <%=gd %> <br>
	가입경로 : <%=s %> <br>
	주소지 : <%=ad %> <br>
	
	
	

</body>
</html>