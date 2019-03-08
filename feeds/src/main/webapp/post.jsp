<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ page pageEncoding="utf-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<t:page>

	<jsp:body>
		<div class="container">
		
		<div class="row">
		<div class="col-lg-8">

                <!-- the actual blog post: title/author/date/content -->
                <h1>${post.title}</h1>
                <p class="lead"><i class="fa fa-user"></i> by <a href="">${post.user.username}</a> <i class="fa fa-calendar"></i> Posted on ${post.dateCreated}
                </p>
				<p><i class="fa fa-tags"></i> Tags: <a href=""><span class="badge badge-info">费城</span></a> <a href=""><span class="badge badge-info">户外运动</span></a></p>
		
                <hr>
                <p>
                ${post.body}
                </p>
                <br/>
                <div class="row">
                <div class="col">
                <div class="postbottom" style="float:right">
                <span>
               	<a href="#" data-toggle="tooltip" data-placement="right"
					title="赞"><i class="fa fa-thumbs-up"></i> ${post.likeCount } </a>
			   	<a href="#" data-toggle="tooltip" data-placement="right"
					title="踩"><i class="fa fa-thumbs-down"></i> ${post.unlikeCount }</a>
				</span>             
        		</div>
        		</div>
        		</div>
        		<hr>
   	 	<div class="row">
		<div class="col">
		 
      		<div class="form-group">
        		<label for="comment">Your Comment</label>
        		<textarea id="commentBody"  class="form-control" rows="3"></textarea>
        		<input id="postid" type="hidden" value="${post.id}"></input>
        		<input id="currentuserid" type="hidden" value="${currentUser.id}"></input>
      		</div>
      		<button type="button" id="addComment" class="btn btn-default">Send</button>
    	
    	</div>
   	 	
		</div>
		<hr>
		 <div class="row">
			<div class="col">
            <div class="card card-white post">
            <div id="fadein" style="display:none">
            
            </div>
            <c:forEach items="${commentList}" var="comment" varStatus="status">    
                <div class="post-heading">
                    <div class="float-left image">
                        <img src="${contextPath}/getUserImage?id=${comment.user.id}" class="img-circle avatar" alt="user profile image">
                    </div>
                    <div class="float-left meta">
                        <div class="title h5">
                            <a href="#"><b>${comment.user.username}</b></a>有一个评论
                        </div>
                        <h6 class="text-muted time"><fmt:formatDate value="${comment.dateCreated}" pattern="yyyy-MM-dd hh:mm"/></h6>
                    </div>
                </div> 
                <div class="post-description"> 
                    <p>${comment.body}</p>

                </div>
                <hr>
                </c:forEach>
                
            </div>
            
            
        
        </div>
    </div>
		</div>

		
    <div class="col-lg-4">
     <h4><i class="fa fa-tags"></i> Popular Tags:</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href=""><span class="badge badge-info">Windows 8</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">C#</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">Windows Forms</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">WPF</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href=""><span class="badge badge-info">Bootstrap</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">Joomla!</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">CMS</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">Java</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>

		</div>

		</div>
		</div>
	</jsp:body>
</t:page>


