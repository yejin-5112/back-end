<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계산기</title>
</head>
<body>
    <form action="test04_1.jsp" method="post">
        x: <input type="text" name="x" required><br>
        y: <input type="text" name="y" required><br>
        <button type="submit" name="operator" value="+">+</button>
        <button type="submit" name="operator" value="-">-</button>
        <button type="submit" name="operator" value="*">*</button>
        <button type="submit" name="operator" value="/">/</button>
    </form>
</body>
</html>
