<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>Sign In</title>
	
	
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Latest compiled and minified CSS 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
-->
<link rel="stylesheet" href="/webjars/bootstrap/4.2.1/css/bootstrap.min.css" />

<script type="text/javascript" src="/webjars/jquery/3.3.1-1/jquery.min.js"></script>

<!-- jQuery library 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
-->
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
		<a class="navbar-brand" href="/">Smail</a>
		<ul class="navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="/"">HOME</a>
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
	<div class="row">
		<div class="col-3 col-sm-0"></div>
		<div class="col">
		<div class="card my-4">
			<div class="card-header">
				Create your Account
			</div>
			<div class="card-body"><form:form action="/processForm" modelAttribute="theUsers" method="POST">
				
				<div class="form-group">
					<i style="color:red">${theUserExist} </i>
				</div>
				
				<div class="row">
					
					<div class="col form-group">
						 <label>First Name</label> 
						 <form:input class="form-control" type="text" path="firstName" />
						  <form:errors path="firstName" cssClass="error"/>
					 </div>
					 
					 <div class="col form-group">
					 <label>Last Name </label> 
					 <form:input type="text" class="form-control" path="lastName" />
					 
				 	 </div>
				</div>
					 
					 
				<div class="form-group">
				 	 <label>Username  </label> 
					 <form:input type="text" class="form-control" name="username" path="username" /> 
					 <form:errors  path="username" cssClass="error"/>
				</div>
				<div class="row">
					 <div class="col form-group">
					 <label>Password  </label> 
					 <form:password id="password" name="password" class="form-control" path="password" />
					 <form:errors path="password" cssClass="error"/>
					 </div>
					 
					 <div class="col form-group">
					 <label>Confirm </label> 
					 <input type="text" class="form-control" name="confirmPassword" /> 
					 </div>
				</div>
					 
					 <div class="form-group">
					 <form:button class="btn btn-primary" type="submit">Sign Up</form:button>
					 </div>  
				</form:form>
			</div>
		</div>
		
		</div>
		<div class="col-3 col-sm-0"></div>
	</div>
	</div>
</body>

<script type="text/javascript">
	
</script>

</html>




