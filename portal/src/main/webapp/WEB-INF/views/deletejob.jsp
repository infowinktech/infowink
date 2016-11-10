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
<link rel="stylesheet" href="resources/css/custom.css">

<script src="resources/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-select.min.css">

<style type="text/css">
.form-horizontal .control-label {
    padding-top: 0px;
    
}
</style>
<script src="resources/js/checkbox.js"></script>

<script type="text/javascript">
$(document).ready(function() {

	$.ajax({
		url : "getJobBasedForDelete",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobCategoryID").html($(xml).find("jobCategory").text());
			$("#jobCodeID").html($(xml).find("jobCode").text());
			$("#jobTitleID").html($(xml).find("jobTitle").text());
			$("#jobLocationID").html($(xml).find("jobLocation").text());
			$("#jobTypeID").html($(xml).find("jobType").text());
			$("#jobRequirementsID").html($(xml).find("jobRequirements").text());
			$("#jobDescriptionID").html($(xml).find("jobDescription").text());
			$("#rateID").html($(xml).find("rate").text());
			$("#hoursID").html($(xml).find("hours").text());
			$("#statusID").html($(xml).find("jobStatus").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});

	$( "#registerID" ).click(function() {
		$.ajax({
			url : "deletJobFromDB",
			dataType : "xml",
			type : "POST",
			success : function(xml){
				$("#registerID").show();
				
				$("#msgID").html($(xml).find("status").text());
				$("#msgID").show();
				if($(xml).find("statusCode").text()=="true"){
					 $("#msgID").css("color", "#18bc9c");
				}else{
					$("#msgID").css("color", "#ff4c4c");
				}
			},
			error : function(xhr, status, error) {
					console.log("Erro occured...");
			}
		});
	});


});
</script>

<title>Vensa Technologies | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-9">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;">
			  <li><a href="managejobs">Manage Jobs</a></li>
			  <li class="active">Delete Job</li>
			</ol>
			<form class="form-horizontal" method="post" id="addJobFormID">
				
				 
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Category</label>
				    <div class="col-sm-9">
				     	<p id="jobCategoryID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Code</label>
				    <div class="col-sm-9">
				     	<p id="jobCodeID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Title</label>
				    <div class="col-sm-9">
				     	<p id="jobTitleID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Location</label>
				    <div class="col-sm-9">
				     	<p id="jobLocationID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Type</label>
				    <div class="col-sm-9">
				     	<p id="jobTypeID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Hours</label>
				    <div class="col-sm-9">
				     	<p id="hoursID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Rate</label>
				    <div class="col-sm-9">
				     	<p id="rateID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Status</label>
				    <div class="col-sm-9">
				     	<p id="statusID" ></p>
					</div>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Requirements</label>
				    <div class="col-sm-9">
				     	<p id="jobRequirementsID" ></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Description</label>
				    <div class="col-sm-9">
				     	<p id="jobDescriptionID" ></p>
				    </div>
				  </div>
				  
				  
				
				
				
				<p style="margin-top: 20px;">  
				<button type="button" class="btn btn-primary btn-sm" id="registerID">Delete Job</button>
				</p>
				<p style="display: none;" id="msgID" class="text-center"></p>
			</form>	
						
				 
		</div>
		<div class="col-sm-3" >
			
		</div>
  	</div>
  </div>

	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
