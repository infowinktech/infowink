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
.input-sm{font-size: 15px;}

.jobTable{
	border: none;
}

.jobTable tr td:first-child
{
    font-weight: bold;
}

.jobTable>tbody>tr>td{
	padding-top:0px; 
	padding-bottom:2px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	$.ajax({
		url : "loadActiveJobs",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
});
function jobDetails(id){
	$data = 'jobId='+ id;
	$.ajax({
		url : "saveJobId",
		data : $data,
		dataType : "text",
		type : "POST",
		success : function(data){
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

	
<form id="formID" action="jobdetails">
</form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
			<div class="row">
			<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;min-height: 600px;">
				<h3 style="margin-bottom: 20px;">Job Openings</h3>

				 <div id="jobsBodyID">
				 </div>
				
				
			</div>

			<div class="col-sm-3">
				<h3>Ad Space</h3>

				<div class="card">
				  <img class="card-img-top" src="resources/img/img2.jpg" alt="Card image cap" class="thumbnail" height="220px" width="100%">
				  <div class="card-block"><h4 class="card-title">Ad title</h4>
				    <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed venenatis mauris in auctor hendrerit. Aliquam varius ornare nisl at dictum. Suspendisse justo lacus</p>
				  </div> 
				</div>

			</div>

		</div>
	</div>


	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
