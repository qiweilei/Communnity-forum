<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8" %>
<t:page>
  <jsp:body>
	<div class="container">
		<c:if test="${emailConfirmation}">
    		A Confirmation email has been sent to your email, please confirm before log in  
	   </c:if>
		<form:form method="POST" modelAttribute="userForm" class="form-signin">
			<h2 class="form-signin-heading">Create your account</h2>
			<spring:bind path="username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="email" class="form-control"
						placeholder="Email Address" autofocus="true"></form:input>
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="username">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="username" class="form-control"
						placeholder="User Name" autofocus="true"></form:input>
					<form:errors path="username"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="lastname">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="lastname" class="form-control"
						placeholder="Last Name"></form:input>
					<form:errors path="lastname"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="firstname">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="firstname" class="form-control"
						placeholder="First Name"></form:input>
					<form:errors path="firstname"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="phoneNumber">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="text" path="phoneNumber" class="form-control"
						placeholder="Phone Number"></form:input>
					<form:errors path="phoneNumber"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="password">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="password" class="form-control"
						placeholder="Password"></form:input>
					<form:errors path="password"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="passwordConfirm">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<form:input type="password" path="passwordConfirm"
						class="form-control" placeholder="Confirm your password"></form:input>
					<form:errors path="passwordConfirm"></form:errors>
				</div>
			</spring:bind>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
		</form:form>

	</div>
</jsp:body>
</t:page>