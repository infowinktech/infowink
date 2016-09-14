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
		url : "loadJobDetails",
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

function checkUser(){
	$.ajax({
		url : "checkUser",
		dataType : "text",
		type : "POST",
		success : function(data){
			if(data=='false'){
				$("#signInModalID").modal();
			}else{
				console.log("user logged in");	
			}
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
	
	<div class="row">
		
    	<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;min-height: 550px;">
			<h3>Job Details</h3>
			<div>
				  <table class="table jobTable">
				   <tbody id="jobsBodyID">
				     
				    </tbody>
				  </table>
				</div>		
				 
		</div>
		<div class="col-sm-3" >
			<h3>Tech Partners</h3>
			<div class="card">
				  <img class="card-img-top" src="resources/img/partners.png" alt="Card image cap" class="thumbnail" height="220px" width="100%">
				</div>
			<h4 class="text-center" style="font-weight:600;">NAICS CODES</h4>
			<p class="text-center" style="font-weight: 600; margin-bottom: 0px;">238210 &nbsp; 541511</p>
			<p class="text-center" style="font-weight: 600; margin-bottom: 0px;">541512 &nbsp; 541519</p>
			<p class="text-center" style="font-weight: 600; margin-bottom: 0px;">611420 &nbsp; 811212</p>
			<h5 class="text-center" style="font-weight:600;">MBE Certified</h5>
			
			
		</div>
  	</div>
  </div>
  		
  		
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
