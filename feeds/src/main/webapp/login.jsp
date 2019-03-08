<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page pageEncoding="utf-8" %>
<t:page>
<jsp:body>
	<div class="container">

		<form method="POST" action="${contextPath}/login" class="form-signin">
			<h2 class="form-heading">登录</h2>

			<div class="form-group ${error != null ? 'has-error' : ''}">
				<span>${message}</span>
				<input name="email" type="text" class="form-control" placeholder="Email Address" autofocus="true" />
				<input name="password" type="password" class="form-control " placeholder="Password" /> 
				<span>${error}</span> 
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

				<button class="btn btn-sm btn-primary btn-block" type="submit">提交</button>
				<h5 class="text-center">
					<a href="${contextPath}/registration">注册</a>
				</h5>
			</div>

		</form>

	</div>
</jsp:body>
</t:page>