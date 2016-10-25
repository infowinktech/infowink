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

	$.ajax({
		url : "loadUsers",
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

	
});

function exportRecords(){
	$("#loadingID").show();
	$.ajax({
		url : "exportUsers",
		dataType : "xml",
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
</script>


<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-12" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Manage Users</li>
				</ol>
	
       	
		<p class="text-right">
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
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Applications submitted</th>
							</tr>
						</thead>
						<tfoot style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Email</th>
								<th>Role</th>
								<th>Applications submitted</th>
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
