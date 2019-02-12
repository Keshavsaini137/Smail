<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Compose</title>

<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="stylesheet" href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script type="text/javascript" src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<style type="text/css">
	.error{
		color:red;
	}
</style>

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
				<!-- 
				<form:form class="form-inline" action="/logout" method="POST">
					<button class="btn btn-outline-danger" type="submit">Sign out</button>
				</form:form>
				 -->
				<!-- <a class="nav-link" href="/logout">Sign out</a> -->
			</li>
		</ul>
	</nav>


<div class="container" style="margin-top: 5rem">
	<div class="row">
		<div class="col-3 col-sm-0"></div>
		<div class="col">
		<div class="card my-4">
			<div class="card-header text-white mb-3" style="background-color: #00AA9E;">
				New Message
			</div>
			<div class="card-body">
			
			<div class="form-group">
				<i style="color:red">${theUserNotFound} </i>
			</div>
			
			<form:form action="/user/processingMail" modelAttribute="theMail" method="POST">
				<div class="row">
					<div class="col form-group mx-3">
					<form:input class="form-control" name="recevierUsername" placeholder="To" type="text" path="recevierUsername" />
					<form:errors path="recevierUsername" cssClass="error"/>
					</div>
				</div>
				
				<div class="form-group mx-3">
					<form:input class="form-control" placeholder="Subject" type="text" path="subject"/>
				</div>
				<div class="form-group mx-3">
					<form:textarea class="form-control" path="detail" rows="6" cols="30"/>
				</div>
				<div class="form-group">
					<form:button class="btn btn-primary mx-3" type="submit">Send</form:button>
				</div>
			</form:form>
		</div>
		</div>
		</div>
		<div class="col-3 col-sm-0"></div>
	</div>
</div>
	
	
</body>
</html>