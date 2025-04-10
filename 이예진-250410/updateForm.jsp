<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%
String id = request.getParameter("id");
String name = "", pwd = "";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    Class.forName("org.mariadb.jdbc.Driver");

    con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/backend", "yejin", "1111");

    pstmt = con.prepareStatement("SELECT * FROM member WHERE id=?");
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        name = rs.getString("name");
        pwd = rs.getString("pwd");
    } else {
        // 해당 ID를 찾을 수 없는 경우
        out.println("<script>alert('사용자를 찾을 수 없습니다.'); location.href='list.jsp';</script>");
        return;  // 더 이상 실행하지 않도록 처리
    }
} catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사용자 정보 변경</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container">
        <br>
        <h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
        <hr/>
        <form action="updatePro.jsp" method="post">
            <div class="form-group">
                <label for="id">ID:</label>
                <input type="text" class="form-control" id="id" name="id" value="<%=id%>" readonly>
            </div>
            <div class="form-group">
                <label for="name">NAME:</label>
                <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
            </div>
            <div class="form-group">
                <label for="pwd">PASSWORD:</label>
                <input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd%>">
            </div>
            <br>
            <div class="text-center">
                <input type="submit" value="변경" class="btn btn-secondary">  
                <input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%=id%>'">
                <input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
            </div>
        </form>
    </div>
</body>
</html>
