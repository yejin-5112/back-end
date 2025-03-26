<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>계산기</title>
</head>
<body>

	<%
	    String xStr = request.getParameter("x"); //문자열로 가져옴
	    String yStr = request.getParameter("y");
	    String op = request.getParameter("operator");
	    String result = "";

	    try {
	        int x = Integer.parseInt(xStr); // 문자열을 숫자형으로 변환
	        int y = Integer.parseInt(yStr);
	        DecimalFormat df = new DecimalFormat("#.##");
	
	        switch (op) {
	            case "+":
	                result = "덧셈 결과는 " + (x + y);
	                break;
	            case "-":
	                result = "뺄셈 결과는 " + (x - y);
	                break;
	            case "*":
	                result = "곱셈 결과는 " + (x * y);
	                break;
	            case "/":
	                if (y == 0) {
	                    result = "나눗셈 불능입니다. 0으로 나눌 수 없습니다.";
	                } else {
	                    float divResult = (float) x / y;
	                    result = "나눗셈 결과는 " + df.format(divResult);
	                }
	                break;
	        }
	    } catch (NumberFormatException e) {
	        result = "숫자를 정확히 입력하세요.";
	    }
	%>
    
    <p><%= result %></p>

</body>
</html>
