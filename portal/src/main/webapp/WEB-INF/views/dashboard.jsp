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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="resources/js/charts.js"></script>

<style type="text/css">
.input-sm{
border:1px solid #dce4ec;
padding-left: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	
	
});

</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body style="background-color: #f7f7f7;">

	<jsp:include page="nav.jsp"></jsp:include>
	<form action ="apply" id="formID"></form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	<div class="row">
		<div class="col-sm-12" style="padding-left: 0px;">
			<h3>Dashboard</h3>
		</div>
	</div>
	
	<div class="row visible-lg">
	
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-6 fa fa-user fa-5x" style="background-color:  #008080 ;color: #ffffff"></div>
				<div class="col-sm-6"><h3 style="margin-top: 10px; margin-bottom: 0px;">2414</h3><p class="help-block">USERS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
		
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-7 fa fa-briefcase fa-5x" style="background-color: #8b9dc3;color: #ffffff"></div>
				<div class="col-sm-5"><h3 style="margin-top: 10px; margin-bottom: 0px;">245</h3><p class="help-block">JOBS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
	
		<div class="col-sm-3" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-5 fa fa-thumbs-up fa-5x" style="background-color: #D01A55;color: #ffffff"></div>
				<div class="col-sm-7"><h3 style="margin-top: 10px; margin-bottom: 0px;">78</h3><p class="help-block">APPLICATIONS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
		
		
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-7 fa fa-envelope fa-5x" style="background-color:#65737e;color: #ffffff"></div>
				<div class="col-sm-5"><h3 style="margin-top: 10px; margin-bottom: 0px;">2414</h3><p class="help-block">INBOX</p></div>
		</div>
		
		
	</div>
	
	<div class="row" style="padding-top: 20px;">
		<div class="col-sm-5" style="border: 1px solid #e0e0e0;background-color: #ffffff;">
			
       		<div id="barVertical"></div>
			       		
		</div>
		
		<div class="col-sm-1">
		</div>
		
		<div class="col-sm-6" style="border: 1px solid #e0e0e0;background-color: #ffffff;padding-top: 10px;">
       	<div id="pieChart" style=" height: 400px;"></div>
		</div>
	</div>
	
	
	<div class="row" style="padding-top: 20px;">
		<div class="col-sm-12" style="border: 1px solid #e0e0e0;background-color: #ffffff;">
			
			<div id="barHorizontal"></div>
		</div>
		
		
	
	</div>
	
	
	
  	
  	
</div>
  		
  		
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>