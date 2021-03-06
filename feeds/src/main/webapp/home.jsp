<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page pageEncoding="utf-8"%>
<t:page>

<jsp:body>
 	<div class="container container-fluid">
 		<section id="blog-section" >
     <div class="container">
       <div class="row">
         <div class="col-lg-8">           
         	<c:forEach items="${postlist}" var="post" varStatus="status">
         	
         	<div class="row">     	
              <div class="col">
             <aside>
             	
<!--                 <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" -->
<!-- 					class="img-responsive" -->
<!-- 					style="height: 100%; width: 100%; overflow: hidden"> -->

				 <div class="content-title">
				<div class="text-left">
				<h5><a href="/post?id=${post.id}">${post.title}</a></h5>
				</div>
				</div>
<%-- 				<div>${post.body}</div> --%>
				<div class="content-footer">
				<span style="font-size: 14px; color: lightseagreen;">Posted by </span>				
				<img class="user-small-img" src="${contextPath}/getUserImage?id=${post.user.id}">
				<span style="font-size: 14px; color: lightseagreen;">${post.user.username}</span>
				<span style="font-size: 14px; color: lightseagreen;"> On </span>
				<span style="font-size: 14px; color: lightseagreen;"> <fmt:formatDate value="${post.dateCreated}" pattern="yyyy-MM-dd"/> </span>
				<span style="float:right">
				<a href="#" data-toggle="tooltip" data-placement="left"
													title="Comments"><i class="fa fa-comments"></i> ${post.commentCount }</a>
				<a href="#" data-toggle="tooltip" data-placement="right" title="Loved"><i class="fa fa-thumbs-up"></i> ${post.hitCount }</a>  
				              
				</span>
				
				</div>
             </aside>
            </div>
            </div>
            
	</c:forEach>               
      
           
          </div>

         <div class="col-lg-4">
         		<div class="widget-sidebar-top">
                 <h2 class="title-widget-sidebar">Category</h2>
                   <div class="content-widget-sidebar">
                   <div class="row">
                   		<div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href=""><span class="badge badge-philly">费城</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">纽约</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">特拉华</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">凤凰城</span></a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href=""><span class="badge badge-info">Skiing/Snowboarding</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">旅游</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">工作</span></a>
                                </li>
                                 <li><a href=""><span class="badge badge-info">签证</span></a>
                                </li>
                            </ul>
                        </div>
                        </div>
                   </div>
                </div>
                              
               <div class="widget-sidebar">
                 <h2 class="title-widget-sidebar">Hot Post</h2>
                   <div class="content-widget-sidebar">
                    <ul>
                    <c:set var="count" value="0" />
                    <c:forEach items="${postlist}" var="post" varStatus="status">
                     <c:set var="count" value="${count+1}" />
                     <c:if test="${count <4}" >
                     <li class="recent-post">
<!--                         <div class="post-img"> -->
<!--                          <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive"> -->
<!--                          </div> -->
                        <h6> <a href="/post?id=${post.id}">${post.title}</a></h6>
                         <p><small><i class="fa fa-calendar" data-original-title="" title=""></i>  <fmt:formatDate value="${post.dateCreated}" pattern="yyyy-MM-dd"/></small></p>
                        </li>
                        <hr></hr>
                      </c:if>  
                       </c:forEach> 
                        
                       
                        
                        
                    </ul>
                   </div>
                 </div>
             

              <!--=====================
                    NEWSLATTER
             ======================-->
	<div class="widget-sidebar">
 		<h2 class="title-widget-sidebar">Newsletter</h2>
  		<p>加入我们，推送最新动态</p>  
		<div class="input-group">
      		<span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
      		<input id="email" type="text" class="form-control" name="email" placeholder="Email">
    	</div>
    	<button type="button" class="btn btn-warning">提交</button>
    </div>  
                 
                 
             </div>
           </div>
         </div>
     
    </section>
		
	</div>
 
</jsp:body>


</t:page>
