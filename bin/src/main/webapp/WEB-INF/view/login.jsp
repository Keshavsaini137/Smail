<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>


<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
		<a class="navbar-brand" href="/">Smail</a>
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="/">HOME</a>
			</li>
		</ul>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="/customLogin">LOG IN</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/createAccount">CREATE AN ACCOUNT</a>
			</li>
		</ul>
	</nav>
	
	
	<div class="container" style="margin-top: 5rem">
	
	<form:form action="/user/processing" method="POST">
	<div class="row" Style="margin-top:60px">
	<div class="col-3 col-sm-0"></div>
	<div class="col mx-auto">
		<div class="card my-4">
		<div class="card-body">	
		<h1 class="text-center text-primary mb-3">Smail</h1>
		<h4 class="text-center mb-3">Sign in</h4>
		<div class="card border-0 ">
			<div class="card-body pt-0">
				<div class="form-group">
					<c:if test="${param.error != null}">
						<i>Sorry! you entered wrong username/password.</i>
					</c:if>
				</div>
				<div class="form-group">
					<c:if test="${param.logout != null}">
						<i>You have been logout.</i>
					</c:if>
				</div>
				<div class="form-group">
					<label> Username </label>
					<input type="text" class="form-control shadow-sm mb-4" name="username" placeholder="username" />
				</div>
				<div class="form-group">
					<label> Password </label> 
					<input type="password" class="form-control shadow-sm mb-5" name="password" placeholder="password" />
				</div>
				<div class="form-group mx-4">
					<button class="btn btn-primary btn-block shadow" type="submit">Sign in</button> 
				</div>
			</div>
		</div>
			
		</div>
		</div>
	</div>
	<div class="col-3 col-sm-0"></div>
	</div>
	
	</form:form>
	</div>
</body>
</html>