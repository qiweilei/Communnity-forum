<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:page>

	<jsp:body>
		<div class="container">

		<form:form method="POST" modelAttribute="userForm" enctype="multipart/form-data">
			<h2 class="form-heading">User Information</h2>
			<div class="text-center">
  			<img src="${contextPath}/getUserImage?id=${userId}" class="rounded" style="width:150px;height:150px" alt="profile_picture">
			</div>
			<label >Select a file to upload</label>
					<input type="file" name="file" />
			<spring:bind path="email">
				<div class="mb-3 form-group ${status.error ? 'has-error' : ''}">
					<form:input id="email" type="text" path="email"
						aria-describedby="button-addon1"
						class="form-control form-control-plaintext col-md-4"
						placeholder="Email Address" readonly="true"></form:input>					
					<form:errors path="email"></form:errors>
				</div>
			</spring:bind>
			<spring:bind path="username">
				<div
					class="input-group form-group ${status.error ? 'has-error' : ''}">
					<form:input id="username" type="text" path="username"
						aria-describedby="button-addon0"
						class="form-control form-control-plaintext col-md-4"
						placeholder="User Name" readonly="true"></form:input>
					<div class="input-group-append">
						<button id="button-addon0" type="button"
							class="btn btn-sm btn-link" onClick="edit_click('username')">Edit</button>
					</div>
					<form:errors path="username"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="lastname">
				<div
					class="input-group form-group ${status.error ? 'has-error' : ''}">
					<form:input id="lastname" type="text" path="lastname"
						aria-describedby="button-addon2"
						class="form-control form-control-plaintext col-md-4"
						placeholder="Last Name" readonly="true"></form:input>
					<div class="input-group-append">
						<button id="button-addon2" type="button"
							class="btn btn-sm btn-link" onClick="edit_click('lastname')">Edit</button>
					</div>
					<form:errors path="lastname"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="firstname">
				<div
					class="input-group form-group ${status.error ? 'has-error' : ''}">
					<form:input id="firstname" type="text" path="firstname"
						aria-describedby="button-addon3"
						class="form-control form-control-plaintext col-md-4"
						placeholder="First Name" readonly="true"></form:input>
					<div class="input-group-append">
						<button id="button-addon3" type="button"
							class="btn btn-sm btn-link" onClick="edit_click('firstname')">Edit</button>
					</div>
					<form:errors path="firstname"></form:errors>
				</div>
			</spring:bind>

			<spring:bind path="phoneNumber">
				<div
					class="input-group form-group ${status.error ? 'has-error' : ''}">
					<form:input id="phoneNumber" type="text" path="phoneNumber"
						aria-describedby="button-addon4"
						class="form-control form-control-plaintext col-md-4"
						placeholder="Phone Number" readonly="true"></form:input>
					<div class="input-group-append">
						<button id="button-addon4" type="button"
							class="btn btn-sm btn-link" onClick="edit_click('phoneNumber')">Edit</button>
					</div>
					<form:errors path="phoneNumber"></form:errors>
				</div>
			</spring:bind>
			<button class="btn btn-sm btn-primary" type="submit">Submit</button>
		</form:form>

	

		

		</div>
	</jsp:body>
</t:page>



