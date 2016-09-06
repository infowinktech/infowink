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
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;">
			<h3>Contact us!</h3>
			<p>We appreciate your interest in Team Consultants and hope we can be of service to you. To learn more about Team Consultants and our services, please send us an e-mail at info@teamjamano.com or call our toll free number 1-888-732-4402 . We look forward to hearing from you!</p>
			
			<h3>Send us a message!</h3>
			<form role="form" id="contactFormID">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="First Name" name="firstName">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Last Name" name="lastName">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Email" name="email">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Company" name="company">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Address" name="address">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="City" name="city">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="State" name="state">
						</div>
						<div class="form-group">
							<textarea class="form-control input-sm" rows="2" placeholder="Comments" name="comments"></textarea>
						</div>

						<button id="registerID" type="button" class="btn btn-primary btn-sm">Submit</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID1">
						<p id="msgID" class="text-center" style="dislpay:none;"></p>
					</form>			
				 
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
			
			<h3>To speak with someone immediately,call (toll-free)</h3>
			<h3 class="glyphicon glyphicon-earphone">1-888-732-4402</h3>
			<h4>5150 Crescent Oaks Dr.Madison, WI 53704</h4>  
			
		</div>
  	</div>
  </div>
  		
  		<div class="container">
  			<div class="row">
  				<div class="col-sm-12">
  					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2982428.1535745636!2d-91.53643081908744!3d43.114443895118846!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880656e81e3abac9%3A0xcc455b6e3f115aa!2s5150+Crescent+Oaks+Dr%2C+Madison%2C+WI+53704%2C+USA!5e0!3m2!1sen!2sin!4v1473161261041" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
  				</div>
  			</div>			
  		</div>
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
