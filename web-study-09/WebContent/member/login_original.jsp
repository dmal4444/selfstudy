<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/member.js"></script>
<script src= "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
/* $(document).ready(function(){
	$("#submitBtn").click(function(){
		$(location).attr('href','login.do');
	});
}); */
</script>
</head>
<body>
	<h2>로그인</h2>
	<form action="login.do" method="POST" name="frm" id="frm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id ="userid" value="${userid}"></td>
			</tr>
			<tr>
				<td>암 호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="submitBtn"
					value="로그인" onclick="return loginCheck()">&nbsp;&nbsp; <input
					type="reset" value="취소"> &nbsp;&nbsp; <input type="button"
					value="회원 가입" onclick="location.href='join.do'"></td>
			</tr>
			<tr>
				<td colspan="2">${message}</td>
			</tr>
		</table>
	</form>
</body>

</html>