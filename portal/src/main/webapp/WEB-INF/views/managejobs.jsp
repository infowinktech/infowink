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

<!-- datatables -->
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">

<script src="resources/js/checkbox.js"></script>

<style type="text/css">
.input-sm{
border:1px solid #dce4ec;
padding-left: 5px;
}


</style>

<script type="text/javascript">
$(document).ready(function() {

	$open = "OPEN="+$('#openID').is(":checked");
	$closed = "CLOSED="+$('#closedID').is(":checked");
	$onHold = "ON-HOLD="+$('#onHoldID').is(":checked");

	loadJobs();
	
	$("#openID").change(function() {
		$open = "OPEN="+$('#openID').is(":checked");
		loadJobs();			
	});

	$("#closedID").change(function() {
		$closed = "CLOSED="+$('#closedID').is(":checked");
		loadJobs();
	});

	$("#onHoldID").change(function() {
		$onHold = "ON-HOLD="+$('#onHoldID').is(":checked");
		loadJobs();
	});
	
});

function loadJobs(){
	$.ajax({
		url : "loadJobs",
		data : $open+"&"+$closed+"&"+$onHold,
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			$('#jobsTable').DataTable();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}

function editRecord(jobcode){
	console.log(jobcode);
	$.ajax({
		url : "saveJobCode",
		data : "jobcode="+jobcode,
		dataType : "text",
		type : "POST",
		success : function(xml){
			$("#formID").attr("action","editjob");
			$("#formID").submit();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}

function deleteRecord(jobcode){
	console.log(jobcode);
	$.ajax({
		url : "saveJobCodeforDelete",
		data : "jobcode="+jobcode,
		dataType : "text",
		type : "POST",
		success : function(xml){
			console.log("forwarding...");
			$("#formID").attr("action","deletejob");
			$("#formID").submit();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}

</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	<form method="GET" action="editjob" style="display: none;" id="formID"></form> 
	<div class="row">
		
    	<div class="col-sm-12" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Manage Jobs</li>
				</ol>
			
		<p class="text-right">
			<span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">OPEN Jobs</button>
		        <input type="checkbox" class="hidden" checked  id="openID" value="OPEN"/>
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">CLOSED Jobs</button>
		        <input type="checkbox" class="hidden" id="closedID" value="CLOSED"/>
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">ON-HOLD Jobs</button>
		        <input type="checkbox" class="hidden" id="onHoldID" value="ON-HOLD"/>
		    </span>
		    
		    <a href="addjob" class="btn btn-primary btn-sm " >Add a new Job</a>
        </p>
        <p class="text-center">
			<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID">
        </p>
			<table class="table table-bordered table-hover" id="jobsTable">
						<thead style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Job Code</th>
								<th>Title</th>
								<th>Location</th>
								<th>Job Type</th>
								<th>Job Status</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tfoot style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Job Code</th>
								<th>Title</th>
								<th>Location</th>
								<th>Job Type</th>
								<th>Job Status</th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						
						
						<tbody id="jobsBodyID">

							
						</tbody>
					</table>
				 
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
