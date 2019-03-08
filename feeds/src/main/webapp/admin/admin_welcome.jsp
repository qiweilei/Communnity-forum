
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
					<li class="nav-item active"><a class="nav-link"
						href="${contextPath}/user/welcome">Request Item<span
							class="sr-only"></span>
					</a></li>
					<li class="nav-item active"><a class="nav-link"
						href="${contextPath}/user/customerEntryHistory">History Data <span
							class="sr-only">(current)</span>
					</a></li>

					<!-- 					<li class="nav-item"><a class="nav-link" href="#">Link</a></li> -->

				</ul>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
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
				</c:if>

			</div>
		</nav>
	</div>
	<div class="container">
	This is admin welcome
		<form:form method="POST" modelAttribute="ItemForm">
			<h2>Provide the information of item</h2>
			<!-- 			<div class="form-row"> -->
			<spring:bind path="brand_name">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputBrand">Brand Name</label>
					<form:input type="text" path="brand_name" class="form-control"
						id="inputBrand" placeholder="Brand Name" autofocus="true"></form:input>
					<form:errors path="brand_name"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="item_number">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputItemNumber">Item Number</label>
					<form:input type="text" path="item_number" class="form-control"
						id="inputItemNumber" placeholder="Item Number"></form:input>
					<form:errors path="item_number"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="item_color">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputItemColor">Item Color</label>
					<form:input type="text" path="item_color" class="form-control"
						id="inputItemColor" placeholder="Item Color"></form:input>
					<form:errors path="item_color"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="item_size">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputItemSize">Item Size</label>
					<form:input type="text" path="item_size" class="form-control"
						id="inputItemSize" placeholder="Item Size"></form:input>
					<form:errors path="item_size"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="item_price">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputItemPrice">Item Price</label>
					<form:input type="text" path="item_price" class="form-control"
						id="inputItemPrice" placeholder="Item Price"></form:input>
					<form:errors path="item_price"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="promo_code">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for="inputPromoCode">Promo Code</label>
					<form:input type="text" path="promo_code" class="form-control"
						id="inputPromoCode" placeholder="Promo Code"></form:input>
					<form:errors path="promo_code"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="item_price_after_promo">
				<div
					class="form-group row col-md-4 ${status.error ? 'has-error' : ''}">
					<label for=inputPriceAfterPromoCode>Price(with Promo Code)</label>
					<form:input type="text" path="item_price_after_promo"
						class="form-control" id="inputPriceAfterPromoCode"
						placeholder="Price"></form:input>
					<form:errors path="item_price_after_promo"></form:errors>
				</div>
			</spring:bind>


			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>

	</div>





	<!-- /container -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>





