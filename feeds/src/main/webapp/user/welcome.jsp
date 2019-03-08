<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8" %>
<t:page>

	<jsp:body>
		<div class="container">
		<h2 class="form-heading">你的blog</h2>
		<c:forEach items="${postlist}" var="post" varStatus="status">
				
		
		<div class="row">
    	<div class="col">
      		<div class="row">
  				<div class="span8">
    		<div class="row">
      			<div class="span8">
        			<h4><strong><a href="#">${post.title}</a></strong></h4>
      			</div>
    		</div>
    		<div class="row">
      			<div class="span2">
        			<a href="#" class="thumbnail"><img src="${post.title}" alt=""></a>
      			</div>
      <div class="span6">      
        <p>
          ${post.body}
        </p>
        <p>
		<a class="btn" href="#">Read more</a>
									</p>
      </div>
    </div>
    <div class="row">
      <div class="span8">
        <p></p>
        <p>
          <i class="icon-user"></i> by <a href="#">${username}</a> 
          | <i class="icon-calendar"></i> ${post.dateCreated}
          | <i class="icon-comment"></i> <a href="#">${post.commentCount} Comments</a>
          | <i class="icon-share"></i> <a href="#">${post.hitCount} Shares</a>
          | <i class="icon-tags"></i> Tags : <a href="#"><span
											class="label label-info">Snipp</span></a> 
          <a href="#"><span class="label label-info">Bootstrap</span></a> 
          <a href="#"><span class="label label-info">UI</span></a> 
          <a href="#"><span class="label label-info">growth</span></a>
        </p>
      </div>
    </div>
  </div>
</div>
<hr>
</div>
</div>

	</c:forEach>	

		</div>
	</jsp:body>
</t:page>


