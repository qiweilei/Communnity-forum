<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page pageEncoding="utf-8"%>
<t:page>

<jsp:body>
 	<div class="container container-fluid">
 		<section id="blog-section" >
     <div class="container">
       <div class="row">
         <div class="col-lg-8">
           <div class="row">
         	<c:forEach items="${postlist}" var="post" varStatus="status">     	
              <div class="col-lg-6 col-md-6">
             <aside>
             	
<!--                 <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" -->
<!-- 					class="img-responsive" -->
<!-- 					style="height: 100%; width: 100%; overflow: hidden"> -->
               
				<div class="content-footer">
				<img class="user-small-img" src="${contextPath}/getUserImage?id=${post.user.id}">
				<span style="font-size: 16px; color: #fff;">${post.user.username}</span>
				<span class="pull-right">
				<a href="#" data-toggle="tooltip" data-placement="left"
													title="Comments"><i class="fa fa-comments"></i> ${post.commentCount }</a>
				<a href="#" data-toggle="tooltip" data-placement="right"
													title="Loved"><i class="fa fa-thumbs-up"></i> ${post.hitCount }</a>                  
				</span>
<!--                     <div class="user-ditels"> -->
<!--                     <div class="user-img"> -->
<!-- 														<img -->
<!-- 															src="https://lh3.googleusercontent.com/-uwagl9sPHag/WM7WQa00ynI/AAAAAAAADtA/hio87ZnTpakcchDXNrKc_wlkHEcpH6vMwCJoC/w140-h148-p-rw/profile-pic.jpg" -->
<!-- 															class="img-responsive"> -->
<!-- 													</div> -->
<!--                         <span class="user-full-ditels"> -->
<!--                         <h3>Sumit Kumar</h3> -->
<!--                         <p>Web & Graphics Disigner</p> -->
<!--                         </span> -->
<!--                         <div class="social-icon"> -->
<!-- 						<a href="#"><i class="fa fa-facebook" data-toggle="tooltip" -->
<!-- 															data-placement="bottom" title="Facebook"></i></a> -->
<!-- 						<a href="#"><i class="fa fa-twitter" data-toggle="tooltip" -->
<!-- 															data-placement="bottom" title="Twitter"></i></a> -->
<!-- 						<a href="#"><i class="fa fa-google-plus" data-toggle="tooltip" -->
<!-- 															data-placement="bottom" title="Google Plus"></i></a> -->
<!-- 						<a href="#"><i class="fa fa-youtube" data-toggle="tooltip" -->
<!-- 															data-placement="bottom" title="Youtube"></i></a> -->
<!-- 						<a href="#"><i class="fa fa-github" data-toggle="tooltip" -->
<!-- 															data-placement="bottom" title="Github"></i></a>				 -->
<!-- 					</div> -->
<!--                     </div> -->
				</div>
				 <div class="content-title">
				<div class="text-center">
				<h3><a href="/post?id=${post.id}">${post.title}</a></h3>
				</div>
				</div>
				<div>${post.body}</div>
             </aside>
            </div>
	</c:forEach>               
      
           </div>
          </div>

         <div class="col-lg-4">           
               <div class="widget-sidebar">
                 <h2 class="title-widget-sidebar">// RECENT POST</h2>
                   <div class="content-widget-sidebar">
                    <ul>
                     <li class="recent-post">
                        <div class="post-img">
                         <img src="https://lh3.googleusercontent.com/-ndZJOGgvYQ4/WM1ZI8dH86I/AAAAAAAADeo/l67ZqZnRUO8QXIQi38bEXuxqHfVX0TV2gCJoC/w424-h318-n-rw/thumbnail8.jpg" class="img-responsive">
                         </div>
                         <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                         <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                        </li>
                        <hr>
                        
                        <li class="recent-post">
                        <div class="post-img">
                         <img src="https://lh3.googleusercontent.com/-ojLI116-Mxk/WM1ZIwdnuwI/AAAAAAAADeo/4K6VpwIPSfgsmlXJB5o0N8scuI3iW4OpwCJoC/w424-h318-n-rw/thumbnail6.jpg" class="img-responsive">
                         </div>
                         <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                         <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                        </li>
                        <hr>
                        
                        <li class="recent-post">
                        <div class="post-img">
                         <img src="https://lh3.googleusercontent.com/-TrK1csbtHRs/WM1ZI1SIUNI/AAAAAAAADeo/OkiUjuad6skWl9ugxbiIA_436OwsWKBNgCJoC/w424-h318-n-rw/thumbnail3.jpg" class="img-responsive">
                         </div>
                         <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                         <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                        </li>
                        <hr>
                        
                        <li class="recent-post">
                        <div class="post-img">
                         <img src="https://lh3.googleusercontent.com/-UKfIhJSBW9M/WM1ZI8ou34I/AAAAAAAADeo/vlLGY29147AYLaxUW29ZXJlun115BhkhgCJoC/w424-h318-n-rw/thumbnail7.jpg" class="img-responsive">
                         </div>
                         <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                         <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                        </li>
                        
                        
                    </ul>
                   </div>
                 </div>
             
             <div class="widget-sidebar">
              <h2 class="title-widget-sidebar">// ARCHIVES</h2>
                <div class="last-post">
                  <button class="accordion">21/4/2016</button>
                   <div class="panel">
                     <li class="recent-post">
                      <div class="post-img">
                       <img src="https://lh3.googleusercontent.com/-13DR8P0-AN4/WM1ZIz1lRNI/AAAAAAAADeo/XMfJ7CM-pQg9qfRuCgSnphzqhaj3SQg6QCJoC/w424-h318-n-rw/thumbnail4.jpg" class="img-responsive">
                        </div>
                       <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                      <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                 </div>
                </div>                 
                 <hr>
                 <div class="last-post">
                  <button class="accordion">5/7/2016</button>
                   <div class="panel">
                     <li class="recent-post">
                      <div class="post-img">
                       <img src="https://lh3.googleusercontent.com/-QlnwuVgbxus/WM1ZI1FKQiI/AAAAAAAADeo/nGSd1ExnnfIfIBF27xs8-EdBdfglqFPZgCJoC/w424-h318-n-rw/thumbnail2.jpg" class="img-responsive">
                        </div>
                       <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                      <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                 </div>
                </div>
                 <hr>
                 <div class="last-post">
                  <button class="accordion">15/9/2016</button>
                   <div class="panel">
                     <li class="recent-post">
                      <div class="post-img">
                       <img src="https://lh3.googleusercontent.com/-wRHL_FOH1AU/WM1ZIxQZ3DI/AAAAAAAADeo/lwJr8xndbW4MHI-lOB7CQ-14FJB5f5SWACJoC/w424-h318-n-rw/thumbnail5.jpg" class="img-responsive">
                        </div>
                       <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                      <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                 </div>
                </div>
                 <hr>
                 <div class="last-post">
                  <button class="accordion">2/3/2017</button>
                   <div class="panel">
                     <li class="recent-post">
                      <div class="post-img">
                       <img src="https://lh3.googleusercontent.com/-QlnwuVgbxus/WM1ZI1FKQiI/AAAAAAAADeo/nGSd1ExnnfIfIBF27xs8-EdBdfglqFPZgCJoC/w424-h318-n-rw/thumbnail2.jpg" class="img-responsive">
                        </div>
                       <a href="#"><h5>Excepteur sint occaecat cupi non proident laborum.</h5></a>
                      <p><small><i class="fa fa-calendar" data-original-title="" title=""></i> 30 Juni 2014</small></p>
                    </li>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.   Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                 </div>
                </div>
             </div>
             
        <!--=====================
               CATEGORIES
          ======================-->
             <div class="widget-sidebar">
              <h2 class="title-widget-sidebar">// CATEGORIES</h2>
                 <button class="categories-btn">Audio</button>
                 <button class="categories-btn">Blog</button>
                 <button class="categories-btn">Gallery</button>
                 <button class="categories-btn">Images</button>
             </div>  
             
              <!--=====================
                    NEWSLATTER
             ======================-->
<div class="widget-sidebar">
 <h2 class="title-widget-sidebar">// NEWSLATTER</h2>
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor ut .</p>  
<div class="input-group">
      <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
      <input id="email" type="text" class="form-control" name="email" placeholder="Email">
    </div>
    <button type="button" class="btn btn-warning">Warning</button>
             </div>  
                 
                 
             </div>
           </div>
         </div>
     
    </section>
		
	</div>
 
</jsp:body>


</t:page>
