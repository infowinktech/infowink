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

<script src="resources/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-select.min.css">

<script type="text/javascript">
$(document).ready(function() {
	$jobCategoryID = "";
	$jobCodeID = "";
	$jobTitleID = "";
	$jobLocationID = "";
	$jobTypeID = "";
	$jobRequirementsID = "";
	$jobDescriptionID = "";
	
	$("#jobCategoryID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobCodeID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobTitleID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobLocationID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobTypeID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobRequirementsID").keypress(function() {$(this).removeClass("inputError");});
	$("#jobDescriptionID").keypress(function() {$(this).removeClass("inputError");});
	
	$( "#registerID" ).click(function() {
		$jobCategoryID=$('#jobCategoryID').val();
		$jobCodeID=$('#jobCodeID').val();
		$jobTitleID=$('#jobTitleID').val();
		$jobLocationID=$('#jobLocationID').val();
		$jobTypeID=$('#jobTypeID').val();
		$jobRequirementsID=$('#jobRequirementsID').val();
		$jobDescriptionID=$('#jobDescriptionID').val();
		
		if($jobCategoryID.trim().length==0){$("#jobCategoryID").addClass("inputError");}
		if($jobCodeID.trim().length==0){$("#jobCodeID").addClass("inputError");}
		if($jobTitleID.trim().length==0){$("#jobTitleID").addClass("inputError");}
		if($jobLocationID.trim().length==0){$("#jobLocationID").addClass("inputError");}
		if($jobTypeID.trim().length==0){$("#jobTypeID").addClass("inputError");}
		if($jobDescriptionID.trim().length==0){$("#jobDescriptionID").addClass("inputError");}
		if($jobRequirementsID.trim().length==0){$("#jobRequirementsID").addClass("inputError");}
	
		if($jobCategoryID.trim().length>0 &&
		   $jobCodeID.trim().length>0 && 
		   $jobTitleID.trim().length>0 && 
		   $jobLocationID.trim().length>0 &&
		   $jobTypeID.trim().length>0 &&
		   $jobRequirementsID.trim().length>0 &&
		   $jobDescriptionID.trim().length>0
		   ){
			addJob();
		}
	
	});
	function addJob(){
		$("#registerID").hide();
		$("#loadingID1").show();
		$.ajax({
			url : "addJobtoDB",
			data : $('#addJobFormID').serialize(),
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "xml",
			type : "POST",
			success : function(xml){
				$("#loadingID1").hide();
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
	}
});
</script>

<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-9">
			<h3>Add a Job</h3>
			<form role="form" id="addJobFormID">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Job Category" name="jobCategory" id="jobCategoryID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Job Code" name="jobCode" id="jobCodeID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Job Title" name="jobTitle" id="jobTitleID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Job Location" name="jobLocation" id="jobLocationID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Job Type" name="jobType" id="jobTypeID">
						</div>
						<div class="form-group">
							<textarea class="form-control input-sm" rows="2" placeholder="Job Requirements" name="jobRequirements" id="jobRequirementsID"></textarea>
						</div>
						<div class="form-group">
							<textarea class="form-control input-sm" rows="2" placeholder="Job Description" name="jobDescription" id="jobDescriptionID"></textarea>
						</div>
						
						<button id="registerID" type="button" class="btn btn-primary btn-sm" data-toggle="modal">Submit</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID1">
						<p id="msgID" class="text-center" style="dislpay:none;"></p>
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
