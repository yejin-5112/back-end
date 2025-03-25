<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	String n = request.getParameter("name");
	int e = Integer.parseInt(request.getParameter("eng"));
	int m = Integer.parseInt(request.getParameter("math"));
	int k = Integer.parseInt(request.getParameter("kor"));
	int total = e + m + k;
	/* out.println("영어: " + e);
	out.println("수학: " + m);
	out.println("국어: " + k); */
	%>
	학생명 : <%=n %> <br>
	국어 : <%=k %> <br>
	영어 : <%=e %> <br>
	수학 : <%=m %> <br>
	합계 : <%=total %> <br>
	평균 : <%= total / 3%>

</body>
</html>