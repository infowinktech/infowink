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
<title>Portal</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container">
	
	<div class="row">
		
    	<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;border-left: 1px solid #e0e0e0;">
			<h3>About</h3>
			<p>Since our incorporation in 2010, We've offered a comprehensive range of consulting services from custom software development, Information Technology staffing,infrastructure development to software testing.</p>
			<p>The past few years of partnering, mainly with the state and local businesses in the badger state, has made us evolve a highly effective form of work-style for the rapid analysis, design, development, implementation and maintenance of applications and customized solutions to meet our customers' needs.</p>
			<p>We partner with you every step of the way to map out a clear direction for today's staffing and technology needs and translate your business goals into a technology strategy that integrates with your existing framework. Our goal is to recommend a technology solution that will help you attain your strategic goals.</p>
			<p>TEAM Consultants is a complete information technology solutions provider. Headquartered in Madison, Wisconsin. We specialize in five key areas that address today's most pressing IT needs:</p>
				<ul>
						<li>IT Consulting and Sourcing</li>
						<li>Software Development and Implementation</li>
						<li>Project Management</li>
						<li>Staffing Services</li>
						<li>Infrastructure Services</li>
				</ul>
			<h4>Our clients consist of:</h4>
			<p>Federal Government & State Agencies</p>
			<p>Local small and mid-size businesses</p>

				
				 
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
