<!-- <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> -->

<html>
<head>
	<title>Sign In</title>
</head>
<body>
	
	<form action="/user/signInUser" method="POST">
		Email: 
		<input type="text" name="email"/>
		
		<br>
		
		Password: 
		<input type="text" name="password"/>
		
		<br>
		
		<button type="submit">Login</button>
	</form>
	
	
</body>
</html>