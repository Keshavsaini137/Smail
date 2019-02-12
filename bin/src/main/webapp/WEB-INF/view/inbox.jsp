<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inbox</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

</head>
<body>
	<nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
		<a class="navbar-brand" href="/user/inbox">Smail</a>
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="/user/inbox">HOME</a>
			</li>
		</ul> 
		
		<ul class="navbar-nav ml-auto">
			<li class="nav-item">
				<a class="nav-link" href="#"><sec:authentication property="principal.username" /></a>
			</li>
			<li class="nav-item">
				<form:form class="form-inline" action="/logout" method="POST">
					<button class="btn btn-outline-danger" type="submit">Sign out</button>
				</form:form>
				<!-- <a class="nav-link" href="/logout">Sign out</a> -->
			</li>
		</ul>
	</nav>
	
	
	<div class="container-fluid" style="margin-top: 5rem">
	
	<div class="row">
		<div class="col-2 col-sm-0">
			<form:form class="form-group" action="/user/compose" method="GET">
				<button class="btn btn-success" type="submit">Compose</button>
			</form:form>
		</div>
		<div class="col">
			<i style="color:green">${mailSent}</i>
		</div>
	</div>
	
	<div class="row">
		<div class="col-2 ">
			<!-- 
			<form:form class="form-group" action="/user/compose" method="GET">
				<button class="btn btn-success" type="submit">Compose</button>
			</form:form>
			 -->
		</div>
		<div class="col" style="margin-top:5rem">
			<table class="table table-secondary table-hover table-responsive-sm">
				<c:forEach var="tempMail" items="${mails}">
					<tr>
						<td>${tempMail.senderUsername}</td>
						<td>${tempMail.subject } - ${tempMail.detail}</td>
						<td>${tempMail.date}</td>
					</tr>
				</c:forEach>
			</table>	
		</div>
		<div class="col-2 col-sm-0"></div>
	</div>
	
	</div>
</body>
</html>









