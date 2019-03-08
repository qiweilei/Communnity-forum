<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<title>Log in with your account</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	
		<nav class="navbar navbar-expand-md navbar-light bg-light" style="background-color: #e3f2fd;">
		
			<a class="navbar-brand" style="color: blue"
				href="${contextPath}/home">CompanyName</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${contextPath}/home">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Dropdown </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div></li>
					<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
					</li>
				</ul>
				<form class="form-inline my-2 my-lg-0" action="${contextPath}/login">
					<button class="btn btn-sm btn-outline-success my-2 my-sm-0" type="submit">Sign
						In</button>
				</form>
				
			</div>
			
		</nav>
	<div class="container">
	this is admin login
		<form method="POST" action="${contextPath}/admin/admin_login" class="form-signin">
			<h2 class="form-heading">Log in</h2>

			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span>${message}</span> <input name="username" type="text"
					class="form-control" placeholder="Username" autofocus="true" /> <input
					name="password" type="password" class="form-control "
					placeholder="Password" /> <span>${error}</span> <input
					type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<button class="btn btn-sm btn-primary btn-block" type="submit">Log
					In</button>
				<h5 class="text-center">
					<a href="${contextPath}/registration">Create an account</a>
				</h5>
			</div>

		</form>

	</div>
	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
