<%@ tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="QIWEI LEI">

<title>${contextPath}</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${contextPath}/resources/css/common.css" rel="stylesheet">
<link href="${contextPath}/resources/css/custom.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

</head>
<body>
	<header>
		<nav class="navbar fixed-top navbar-expand-md navbar-light bg-light">
			<a class="navbar-brand" style="color: blue"
				href="${contextPath}/home">公司名</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link"
						href="${contextPath}/home">主页 <span class="sr-only">(current)</span>
					</a>
					</li>
<!-- 					<li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->
<!-- 					<li class="nav-item dropdown"><a -->
<!-- 						class="nav-link dropdown-toggle" href="#" id="navbarDropdown" -->
<!-- 						role="button" data-toggle="dropdown" aria-haspopup="true" -->
<!-- 						aria-expanded="false"> Dropdown </a> -->
<!-- 						<div class="dropdown-menu" aria-labelledby="navbarDropdown"> -->
<!-- 							<a class="dropdown-item" href="#">Action</a> <a -->
<!-- 								class="dropdown-item" href="#">Another action</a> -->
<!-- 							<div class="dropdown-divider"></div> -->
<!-- 							<a class="dropdown-item" href="#">Something else here</a> -->
<!-- 						</div></li> -->
<!-- 					<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a> -->
<!-- 					</li> -->
				</ul>
		

				<c:choose>

					<c:when test="${pageContext.request.userPrincipal.name != null}">
						<form class="form-inline my-2 my-lg-0" id="logoutForm"
							method="POST" action="${contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>

<!-- 						<h6> -->
<%-- 							Welcome <a href="${contextPath}/user/profile">${pageContext.request.userPrincipal.name}</a> --%>
<!-- 							| -->
<!-- 							<button class="btn btn-sm btn-outline-success my-2 my-sm-0" -->
<!-- 								onclick="document.forms['logoutForm'].submit()">Logout</button> -->
<!-- 						</h6> -->
						<div class="dropdown">
							<a class="btn btn-secondary dropdown-toggle" href="#"
								role="button" id="dropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false">
								${pageContext.request.userPrincipal.name} </a>

							<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<a class="dropdown-item" href="${contextPath}/user/profile">Edit</a>
								<a class="dropdown-item" href="${contextPath}/user/welcome">Your Post</a>
								<a class="dropdown-item" href="${contextPath}/user/addpost">Add Post</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" onclick="document.forms['logoutForm'].submit()">Logout</a>
							</div>
						</div>

					</c:when>
					<c:otherwise>
						<form class="form-inline mt-2 mt-md-0">
							<input class="form-control mr-sm-2" type="text"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>
						<form class="form-inline my-2 my-lg-0"
							action="${contextPath}/login">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Sign In</button>
						</form>
					</c:otherwise>
				</c:choose>


			</div>
		</nav>
	</header>
	<div id="body">
		<jsp:doBody />
	</div>
	
		<!-- Footer -->
	<footer class="page-footer font-small blue pt-4">

			<div class="footer-copyright text-center py-3">
				© 2019 Copyright: <a href="${contextPath}/home"> QIWEI LEI</a>
			</div>
			<!-- Copyright -->

	</footer>
	


	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/custom/profile.js"></script>
	<script src="${contextPath}/resources/custom/post.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
</body>
</html>
