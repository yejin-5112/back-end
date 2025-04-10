<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");
String name = request.getParameter("name");
String pwd = request.getParameter("pwd");

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

System.out.println("ID 값: " + id);

try {
    Class.forName("org.mariadb.jdbc.Driver");
    
    con = DriverManager.getConnection("jdbc:mariadb://localhost:3306/backend", "yejin", "1111");

    String checkSql = "SELECT COUNT(*) FROM member WHERE id = ?";
    pstmt = con.prepareStatement(checkSql);
    pstmt.setString(1, id);
    rs = pstmt.executeQuery();

    if (rs.next()) {
        int count = rs.getInt(1);

        if (count == 0) {
%>
    <script>
        alert("수정할 회원이 존재하지 않습니다.");
        history.back();
    </script>
<%
        } else {
            String updateSql = "UPDATE member SET name = ?, pwd = ? WHERE id = ?";
            pstmt = con.prepareStatement(updateSql);
            pstmt.setString(1, name);
            pstmt.setString(2, pwd);
            pstmt.setString(3, id);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
%>
        <script>
            alert("회원 정보가 수정되었습니다!");
            location.href = "list.jsp";
        </script>
<%
            } else {
%>
        <script>
            alert("회원 정보 수정에 실패했습니다.");
            history.back();
        </script>
<%
            }
        }
    } else {
        out.println("데이터 조회에 실패했습니다.");
    }

} catch (Exception e) {
    out.println("오류 발생: " + e.getMessage());
    e.printStackTrace();
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
    if (con != null) try { con.close(); } catch (SQLException e) {}
}
%>
