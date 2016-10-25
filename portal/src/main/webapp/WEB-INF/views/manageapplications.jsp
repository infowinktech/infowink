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

	loadApplications();
	
	$("#openID").change(function() {
		$open = "OPEN="+$('#openID').is(":checked");
		loadApplications();			
	});

	$("#closedID").change(function() {
		$closed = "CLOSED="+$('#closedID').is(":checked");
		loadApplications();
	});

	$("#onHoldID").change(function() {
		$onHold = "ON-HOLD="+$('#onHoldID').is(":checked");
		loadApplications();
	});


	
});

function exportRecords(){
	$("#loadingID").show();
	$.ajax({
		url : "exportApplications",
		dataType : "xml",
		data : $open+"&"+$closed+"&"+$onHold,
		type : "POST",
		success : function(xml){
			$("#loadingID").hide();
			$("#hrefLinkID").attr("action",$(xml).find("hrefLink").text());
			$("#hrefLinkID").submit();
			
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
				$("#loadingID").hide();
		}
	});
	
}

function loadApplications(){

	$.ajax({
		url : "loadApplications",
		dataType : "xml",
		data : $open+"&"+$closed+"&"+$onHold,
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

function viewapp(id){
	$data = 'id='+ id;
	console.log(id);
	$.ajax({
		url : "saveApplicationId",
		dataType : "text",
		data : $data,
		type : "GET",
		success : function(xml){
			$("#viewApplId").submit();
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
	
	<form action="viewapplication" id="viewApplId" style="display: none;" method="GET"></form>
	
	<div class="row">
		
    	<div class="col-sm-12" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Manage Applications</li>
				</ol>
			
		<p class="text-right">
			<span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">OPEN Applications</button>
		        <input type="checkbox" class="hidden" name="open" id="openID" value="OPEN" checked />
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">CLOSED Applications</button>
		        <input type="checkbox" class="hidden" name="closed" id="closedID" value="CLOSED"/>
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">ON-HOLD Applications</button>
		        <input type="checkbox" class="hidden" value="ON-HOLD" id="onHoldID" name="onhold" />
		    </span>
		    <a href=# class="btn btn-primary btn-sm " onclick="javascript:exportRecords();" >Export</a>
		    <form action="" id="hrefLinkID" style="display:none;">Link</form>
		    
        </p>
        <p class="text-center">
			<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID">
        </p>
			<table class="table table-bordered table-hover" id="jobsTable">
						<thead style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Name</th>
								<th>Email</th>
								<th>Job Code</th>
								<th>Job Location</th>
								<th>Application Status</th>
								<th>Date submitted</th>
								<th></th>
							</tr>
						</thead>
						<tfoot style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Name</th>
								<th>Email</th>
								<th>Job Code</th>
								<th>Job Location</th>
								<th>Application Status</th>
								<th>Date submitted</th>
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
