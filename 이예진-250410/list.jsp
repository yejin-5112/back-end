<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/backend", "yejin", "1111");
        st = con.createStatement();
        rs = st.executeQuery("SELECT * FROM member");

    } catch (Exception e) {
        out.println("<script>alert('데이터베이스 연결 오류: " + e.getMessage() + "');</script>");
        e.printStackTrace();
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container"><br>
        <h1 class="text-center font-weight-bold">사용자 정보</h1>
        <br>
        <table class="table table-hover">
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>비밀번호</th>
            </tr>
            <%
                while(rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    String pwd = rs.getString("pwd");
            %>
            <tr>
                <td><a href="updateForm.jsp?id=<%=id %>"><%=id %></a></td>
                <td><%=name %></td>
                <td><%=pwd %></td>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>

<%
    try {
        if (rs != null) rs.close();
        if (st != null) st.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
