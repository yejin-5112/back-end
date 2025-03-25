<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시글 확인</title>
</head>
<body>
    <h2>입력된 게시글</h2>
    <% 
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");
    %>
    <p><strong>제목:</strong> <%= title %></p>
    <p><strong>작성자:</strong> <%= author %></p>
    <p><strong>내용:</strong></p>
    <pre><%= content %></pre>
    <br>
</body>
</html>
