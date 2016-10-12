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

<script src="resources/js/checkbox.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$status = "OPEN";

	$("#openID").change(function() {
		if($('#openID').is(":checked")){
			$status= "OPEN";
			console.info($status);

			if($('#closedID').is(":checked")){$("#closedBtn").click();}
			if($('#onHoldID').is(":checked")){$("#onHoldBtn").click();}
			
		}
		
	});

	$("#closedID").change(function() {
		if($('#closedID').is(":checked")){
			$status= "CLOSED";
			console.info($status);

			if($('#openID').is(":checked")){$("#openBtn").click();}
			if($('#onHoldID').is(":checked")){$("#onHoldBtn").click();}
		}
	});

	$("#onHoldID").change(function() {
		if($('#onHoldID').is(":checked")){
			$status= "ON-HOLD";
			console.info($status);

			if($('#openID').is(":checked")){$("#openBtn").click();}
			if($('#closedID').is(":checked")){$("#closedBtn").click();}
			
		}
	});

	$.ajax({
		url : "getJobBasedOnCode",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			
			$("#jobCategoryID").val($(xml).find("jobCategory").text());
			$("#jobCodeID").val($(xml).find("jobCode").text());
			$("#jobTitleID").val($(xml).find("jobTitle").text());
			$("#jobLocationID").val($(xml).find("jobLocation").text());
			$("#jobTypeID").val($(xml).find("jobType").text());
			$("#jobRequirementsID").val($(xml).find("jobRequirements").text());
			$("#jobDescriptionID").val($(xml).find("jobDescription").text());
			$("#rateID").val($(xml).find("rate").text());
			$("#hoursID").val($(xml).find("hours").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});

	
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
	$("#rateID").keypress(function() {$(this).removeClass("inputError");});
	$("#hoursID").keypress(function() {$(this).removeClass("inputError");});
	
	$( "#registerID" ).click(function() {
		$jobCategoryID=$('#jobCategoryID').val();
		$jobCodeID=$('#jobCodeID').val();
		$jobTitleID=$('#jobTitleID').val();
		$jobLocationID=$('#jobLocationID').val();
		$jobTypeID=$('#jobTypeID').val();
		$jobRequirementsID=$('#jobRequirementsID').val();
		$jobDescriptionID=$('#jobDescriptionID').val();
		$hoursID=$('#hoursID').val();
		$rateID=$('#rateID').val();
		
		if($jobCategoryID.trim().length==0){$("#jobCategoryID").addClass("inputError");}
		if($jobCodeID.trim().length==0){$("#jobCodeID").addClass("inputError");}
		if($jobTitleID.trim().length==0){$("#jobTitleID").addClass("inputError");}
		if($jobLocationID.trim().length==0){$("#jobLocationID").addClass("inputError");}
		if($jobTypeID.trim().length==0){$("#jobTypeID").addClass("inputError");}
		if($jobDescriptionID.trim().length==0){$("#jobDescriptionID").addClass("inputError");}
		if($jobRequirementsID.trim().length==0){$("#jobRequirementsID").addClass("inputError");}
		if($hoursID.trim().length==0){$("#hoursID").addClass("inputError");}
		if($rateID.trim().length==0){$("#rateID").addClass("inputError");}
	
		if($jobCategoryID.trim().length>0 &&
		   $jobCodeID.trim().length>0 && 
		   $jobTitleID.trim().length>0 && 
		   $jobLocationID.trim().length>0 &&
		   $jobTypeID.trim().length>0 &&
		   $jobRequirementsID.trim().length>0 &&
		   $jobDescriptionID.trim().length>0 &&
		   $hoursID.trim().length>0 &&
		   $rateID.trim().length>0 
		   ){
			updateJob();
		}
	
	});
	
	function updateJob(){
		$("#registerID").hide();
		$("#loadingID1").show();
		console.log("status:"+$status);
		$("#statusID").val($status);
		$.ajax({
			url : "updateJob",
			data : $('#addJobFormID').serialize(),
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "xml",
			type : "POST",
			success : function(xml){
				
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
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;">
			  <li><a href="managejobs">Manage Jobs</a></li>
			  <li class="active">Update Job</li>
			</ol>
			<form class="form-horizontal" method="post" id="addJobFormID">
				
				<input type="hidden" name="status" value="" id="statusID"/> 
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Category</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Job Category" name="jobCategory" id="jobCategoryID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Code</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Job Code" name="jobCode" id="jobCodeID" readonly="readonly">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Title</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Job Title" name="jobTitle" id="jobTitleID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Location</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Job Location" name="jobLocation" id="jobLocationID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Type</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Job Type" name="jobType" id="jobTypeID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Hours</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Hours" name="hours" id="hoursID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Rate</label>
				    <div class="col-sm-9">
				     	<input type="text" class="form-control input-sm"  placeholder="Rate" name="rate" id="rateID">
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Status</label>
				    <div class="col-sm-9">
				     	<span class="button-checkbox">
					        <button type="button" class="btn btn-primary btn-sm btn-success" id="openBtn">OPEN</button>
					        <input type="checkbox" class="hidden" checked  id="openID" value="OPEN"/>
					    </span>
		    
					    <span class="button-checkbox">
					        <button type="button" class="btn btn-primary btn-sm btn-success" id="closedBtn">CLOSED</button>
					        <input type="checkbox" class="hidden" id="closedID" value="CLOSED"/>
					    </span>
					    
					    <span class="button-checkbox">
					        <button type="button" class="btn btn-primary btn-sm btn-success" id="onHoldBtn">ON-HOLD</button>
					        <input type="checkbox" class="hidden" id="onHoldID" value="ON-HOLD"/>
					    </span>
				    </div>
				  </div>
				  
				  
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Requirements</label>
				    <div class="col-sm-9">
				     	<textarea class="form-control input-sm" rows="2" placeholder="Job Requirements" name="jobRequirements" id="jobRequirementsID"></textarea>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Job Description</label>
				    <div class="col-sm-9">
				     	<textarea class="form-control input-sm" rows="2" placeholder="Job Description" name="jobDescription" id="jobDescriptionID"></textarea>
				    </div>
				  </div>
				  
				  
				
				
				
				<p style="margin-top: 20px;">  
				<button type="button" class="btn btn-primary btn-sm" id="registerID">Update Job</button>
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
