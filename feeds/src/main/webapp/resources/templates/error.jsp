<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<title>${contextPath}</title>

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
	<div name="toolbar">
		<nav class="navbar navbar-expand-md navbar-light bg-light">
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
					<li class="nav-item"><a class="nav-link disabled" href="#">Tool</a>
					</li>
				</ul>


				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name != null}">
						<form class="form-inline my-2 my-lg-0" id="logoutForm"
							method="POST" action="${contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
						<h5>
							Welcome <a href="${contextPath}/user/profile">${pageContext.request.userPrincipal.name}</a>
							|
							<button class="btn btn-sm btn-outline-success my-2 my-sm-0"
								onclick="document.forms['logoutForm'].submit()">Logout</button>
						</h5>
					</c:when>
					<c:otherwise>
						<form class="form-inline my-2 my-lg-0"
							action="${contextPath}/login">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Sign In</button>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</div>
	<div class="container">
		<h1>${errorMsg}</h1>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
