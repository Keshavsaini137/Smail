<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
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
	
	<div class="container" style="margin-top:4rem">
		<div class="row">
			<div class="col-3"></div>
			<div class="col">
				<form:form action="/user/inbox" method="GET">
					<button class="btn btn-outline-dark" type="submit">Back</button> 
				</form:form>
			</div>
		</div>
		
		
		<div class="row" style="height:400px;margin-top:2rem">
			<div class="col-3"></div>
			<div class="col">
				<div class="card h-100">
				<div class="card-header">${mail.subject}
					<span class="float-right" style="color:gray;font-size:15px">${mail.date}</span>
				</div>
				<div class="card-body">
					<div class="border border-top-0
								border-left-0 border-right-0
								border-success mb-2"> 
						
						<span style="color:gray"> From - </span>
						<span > ${mail.senderUsername} </span>
					</div>
					${mail.detail}
				</div>
				
				<div class="card-footer">
					<button class="btn btn-outline-primary btn-sm">Reply</button>
					<button class="btn btn-outline-primary btn-sm float-right">Forward</button> 
				</div>
			</div>
			</div>
		</div>
		
	</div>
</body>
</html>