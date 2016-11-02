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

    
<link rel="stylesheet" href="resources/css/custom.css">

<script src="resources/js/jquery.webticker.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
$('#webTicker,#webTicker1').webTicker();


});
</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	<!-- Carousel
    ================================================== -->
	<div class="section">

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img class="first-slide" src="resources/img/img1.jpg"
						alt="First slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Easiest Way To Find Your Dream Job</h1>
							<p style="margin-bottom: 0px;">
								Choose a job you love, and you will never have to work a day in your life. 
								
							</p>
							<p class="help-block" style="color: #ffffff;"> - Confucius</p>
							<p>
								<a class="btn btn-primary" href="#" role="button" data-toggle="modal" data-target="#signInModalID">Sign up
									today</a>
							</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img class="second-slide" src="resources/img/img2.jpg"
						alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Employment opportunities for professionals</h1>
							<p style="margin-bottom: 0px;">Perfection is not attainable, but if we chase perfection we can catch excellence.</p>
							<p class="help-block" style="color: #ffffff;"> - Vince Lombardi</p>
							<p>
								<a class="btn btn-primary" href="careers" role="button">Careers</a>
							</p>
						</div>
					</div>
				</div>
				<div class="item">
					<img class="third-slide" src="resources/img/img3.jpg"
						alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Evolving your Career</h1>
							<p style="margin-bottom: 0px;">The more you do stuff, the better you get at dealing with how you still fail at it a lot of the time.</p>
							<p class="help-block" style="color: #ffffff;"> - John Mulaney</p>
							<p>
								<a class="btn btn-primary" href="careers" role="button">Find a Job</a>
							</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<!-- /.carousel -->


	<!-- Content -->
	<div class="container-fluid">
	
	<div class="row">
		<div class="col-sm-3" style="padding-top: 5px;">
			<div class="card">
				  <a href="careers"><img class="card-img-top" src="resources/img/jobs.png" alt="Card image cap" class="thumbnail" height="150px" width="100%" /></a>
				  
				  <ul id="webTicker" class="list-inline text-rightlist-inline text-right">
					    <li>Click here to apply for new Jobs! Click here to apply for new Jobs! Click here to apply for new Jobs! Click here to apply for new Jobs!</li>
					    
					</ul>

			</div>
			<div class="card">
				  <a href="careers"><img class="card-img-top" src="resources/img/nowhiring.png" alt="Card image cap" class="thumbnail" height="150px" width="100%"></a>
				   <ul id="webTicker1" class="list-inline text-rightlist-inline text-right">
					    <li>Click here to apply for new Jobs! Click here to apply for new Jobs! Click here to apply for new Jobs! Click here to apply for new Jobs!</li>
					</ul>
			</div>
			
		</div>
    	<div class="col-sm-6" style="border-right: 1px solid #e0e0e0;border-left: 1px solid #e0e0e0;">
			<h3>Technology at your finger tips!</h3>
			<p>TEAM Consultants is a national provider of technology resource solutions to small and mid-size companies including sourcing for federal and state agencies. From single development resource needs to staffing entire project teams.</p>
			<p>At TEAM Consultants, we believe that hard work is the key to sustainable and user friendly technology. By understanding what drives our specialty industries, becoming involved in our communities on a professional and personal basis, following a disciplined process of identifying quality candidates, partnering with employers to understand their core business and their employment requirements, and delivering exceptional service, we achieve great results for all.</p>
			<h3>Company</h3>
			<p>What sets Team Consultants apart is not only our commitment to our clients, but a commitment to every aspect of our business, our employees, and our community.</p>
			<h4>Corporate Values</h4>
				<ul>
					<li>Integrity</li>
					<li>Commitment</li>
					<li>Innovation</li>
					<li>Personal Satisfaction</li>
					<li>Community Service</li>
					<li>Respect</li>
					<li>Leadership</li>
				</ul>
				 
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
