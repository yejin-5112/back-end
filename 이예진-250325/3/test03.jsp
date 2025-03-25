<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>
	label {
	    display: inline-block;
	    width: 100px;
	    text-align: left;
	}
	
	input, select, textarea {
	    vertical-align: middle;
	    margin-bottom: 5px;
	}
	
	#m, #w{
		width: 50px
	}
</style>
</head>
<body>

	<form method="post" action="test03_1.jsp" accept-charset="UTF-8">
		<label for="userid">아이디:</label> <input type="text" name="userid" required> <br>
		<label for="password">비밀번호:</label> <input type="password"name="password" required> <br>
		<label for="gender">성별:</label> <input type="radio" name="gender" value="male">
	        	<label id="m" for="male">남성</label>
	        	<input type="radio" name="gender" value="female">
	        	<label id="w" for="female">여성</label> <br>
		<label for="signup">가입경로:</label> <select name="signup">
		            <option value="search">검색</option>
		            <option value="sns">SNS</option>
		            <option value="friend">지인 추천</option>
		            <option value="etc">기타</option>
		        </select> <br>
		<label for="address">주소지:</label> <select name="address">
					<option value="search">검색</option>
		            <option value="seuol">서울</option>
		            <option value="busan">부산</option>
		            <option value="degu">대구</option>
		        </select> <br>
		<input type="submit" value="가입">

	</form>

</body>
</html>