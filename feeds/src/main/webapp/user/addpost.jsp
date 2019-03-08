<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:page>

	<jsp:body>
		<div class="container">
		<form:form method="POST" modelAttribute="addPostForm" enctype="multipart/form-data">
			<h2 class="form-heading">添加内容</h2>
			
	<div class="row">
	    
	    <div class="col-md-8 col-md-offset-2">
	        
    		<h1>Create post</h1>
    		<hr>
    		<label >Select a file to upload</label>
					<input type="file" name="file" />
    		<spring:bind path="title">
				<div class="mb-3 form-group ${status.error ? 'has-error' : ''}">
					<label for="title">主题<span class="require">*</span></label>
					<form:input id="title" type="text" path="title"
						aria-describedby="titleContent"
						class="form-control col-md-4"
						placeholder="title" ></form:input>					
					<form:errors path="title"></form:errors>
				</div>
			</spring:bind>
    		    
    		    
    		    
<!--     		    <div class="form-group"> -->
<!--     		        <label for="description">Description</label> -->
<%--     		        <textarea rows="5" class="form-control" name="description"></textarea> --%>
<!--     		    </div> -->
    		    <spring:bind path="body">
    		    	<div class="mb-3 form-group ${status.error ? 'has-error' : ''}">
    		    		<label for="title">内容<span class="require">*</span></label>
							<form:textarea class="form-control" path = "body" rows = "5" placeholder="请输入您需要post的内容"></form:textarea>					
							<form:errors path="body"></form:errors>
    		    
    		    	</div>
    		    </spring:bind>
    		    
    		    
    		    <div class="form-group">
    		        <button type="submit" class="btn btn-primary">
    		            Create
    		        </button>
    		        <button class="btn btn-default">
    		            Cancel
    		        </button>
    		    </div>
    		    
    		
			</div>
		</div>
		</form:form>
	</div>
	</jsp:body>
</t:page>