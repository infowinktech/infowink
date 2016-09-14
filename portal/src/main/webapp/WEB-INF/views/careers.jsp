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
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	


	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
			<div class="row">
			<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;min-height: 600px;">
				<h3 style="margin-bottom: 20px;">Job Openings</h3>

				 <div >
				  <table class="table jobTable">
				   <tbody>
				      <tr>
				        <td>Job Code</td>
				        <td>2110041</td>
				      </tr>
				      <tr>
				       <td>Title</td>
				        <td>Senior Analyst</td>
				      </tr>
				      <tr>
				       <td>Location</td>
				        <td>Madison - WI</td>
				      </tr>
				      <tr>
				       <td>Job Type</td>
				        <td>Contract</td>
				      </tr>
				      <tr>
				       <td>Requirements</td>
				        <td>Programmer-Analyst capabilities with approximately 1-3 years of experience, relies on instructions and pre-established guidelines to perform the functions of the job, primary job functions do not typically require exercising independent judgment. </td>
				      </tr>
				       <tr>
				       <td><button type="submit" class="btn btn-primary btn-sm">Details</button></td>
				        <td></td>
				      </tr>
				    </tbody>
				  </table>
				</div>
				
				 <div>
				  <table class="table jobTable">
				   <tbody>
				      <tr>
				        <td>Job Code</td>
				        <td>4584749</td>
				      </tr>
				      <tr>
				       <td>Title</td>
				        <td>Senior Analyst 2</td>
				      </tr>
				      <tr>
				       <td>Location</td>
				        <td>Madison - WI</td>
				      </tr>
				      <tr>
				       <td>Job Type</td>
				        <td>Contract</td>
				      </tr>
				      <tr>
				       <td>Requirements</td>
				        <td>Programmer-Analyst capabilities with 8 or more years of experience, relies on experience and judgment to plan and accomplish goals, independently performs a variety of complicated tasks, may lead and direct the work of others, a wide degree of creativity and latitude is expected.</td>
				      </tr>
				       <tr>
				       <td><button type="submit" class="btn btn-primary btn-sm">Details</button></td>
				        <td></td>
				      </tr>
				    </tbody>
				  </table>
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
