<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	Class.forName("org.mariadb.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/backend", "yejin", "1111");

	String sql = "INSERT INTO member (id, name, pwd) VALUES (?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();

	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<%=id %>행이 입력되었습니다!
</body>
</html>