<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap-flatly.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/bootstrap-social.css">
<link href='https://fonts.googleapis.com/css?family=Questrial'
	rel='stylesheet' type='text/css'>
<script src="resources/js/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<link rel="stylesheet" href="resources/css/custom.css">
<style type="text/css">
.form-group{
	margin-bottom: 0px;
}
.form-control-static{
padding-bottom: 0px;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	$("#fileID").change(function() {
		$("#fileNameID").val($("#fileID").val());	
	});

	$("#browseID","#fileNameID").bind("click", function() {
		$("#fileID").click();
	});
	$("#fileNameID").bind("click", function() {
		$("#fileID").click();
	});

	$.ajax({
		url : "loadJobDetails",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#overviewID").html($(xml).find("overviewContent").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
});
</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
		<iframe id="iframeID" name="iframe" src="" style="width:800px;border: 1px solid #666666;display: none;"></iframe>
		
    	<div class="col-sm-9" style="min-height: 550px;">
			<h3>Application for Job Code : <%=session.getAttribute("JOB_DETAILS_ID") %></h3>
			<form class="form-horizontal" enctype="multipart/form-data" target="iframe" action="applyJob" method="post">
				  <div class="form-group">
				    <label class="col-sm-2 control-label text-left">First Name</label>
				    <div class="col-sm-10">
				      <p class="form-control-static">Raghu</p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label text-left">Last Name</label>
				    <div class="col-sm-10">
				      <p class="form-control-static">Jinka</p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Email</label>
				    <div class="col-sm-10">
				      <p class="form-control-static">raghurama.j@gmail.com</p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-2 control-label">Cover Letter</label>
				    <div class="col-sm-10">
				     	<textarea class="form-control input-sm" rows="2" name="coverLetter"></textarea>
				    </div>
				    
				  </div>
				  
				<div class="input-group" style="margin-top: 20px;">
	                <label class="input-group-btn">
	                    <span class="btn btn-primary btn-sm" id="browseID">
	                        Browse&hellip; <input type="file" style="display: none;" name="resume" id="fileID">
	                    </span>
	                </label>
	                <input type="text" class="form-control input-sm" readonly id="fileNameID" placeholder="Upload resume" style="padding-left: 10px;">
            	</div>
				
				
				<p style="margin-top: 20px;">  
				<button type="submit" class="btn btn-primary btn-sm">Apply</button>  
				</p>
			</form>		
				 
		</div>
		<div class="col-sm-3" style="border: 1px solid #e0e0e0;margin-top: 21px;background-color: #fdfdfd;" id="overviewID">
			
		</div>
  	</div>
  </div>
  	
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
