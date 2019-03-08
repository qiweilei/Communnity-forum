


 $(document).ready(function() {
        $('#addComment').click(function() {
        	var jsonData = {}
        	jsonData["postId"] = $("#postid").val();
        	jsonData["userId"] = $("#currentuserid").val();
        	jsonData["body"] = $("#commentBody").val();
        	console.log(jsonData);
            $.ajax({
            type: "POST",
            url: "/post/addcomment",
            contentType: "application/json",
            data: JSON.stringify(jsonData),
            dataType: "json",
            success: function (data) {
            	$("#fadein").append("<div class='post-heading'>" +
            			"<div class='float-left image'>" +
            			"<img src='/getUserImage?id=1' class='img-circle avatar' alt='user profile image'>" +
            			"</div><div class='float-left meta'>" +
            			"<div class='title h5'><a href='#'><b>"+data.username+"</b></a>有一个评论</div>" +
            			"<h6 class='text-muted time'>"+data.dateCreated+"</h6></div></div>" +
            			"<div class='post-description'><p>"+data.body+"</p></div><hr>");
            	$("#fadein").fadeIn(3000);
//                alert(JSON.stringify(data));
              },
              error: function(e) {
            	  $("#fadein").fadeIn(3000);
//            	  alert(JSON.stringify(e));
            	},
              complete: function () {
                // Handle the complete event
//                alert("ajax completed ");
              }
        });
    });
 });