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

<script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<script type="text/javascript">
$(document).ready(function() {
	$('.autoplay').slick({
		  slidesToShow: 2,
		  slidesToScroll: 1,
		  autoplay: true,
		  autoplaySpeed: 2000,
		  prevArrow: $('.prev'),
	      nextArrow: $('.next'),
	      height: 50
		});
});
</script>

<style type="text/css">

.slick-prev:after {
  content: ">";
  color: red;
  font-size: 30px;
}

.slick-next:before {
  content: "<";
  color: red;
  font-size: 30px;
}

.thumbnail {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border: medium none;
    border-radius: 0;
    box-shadow: none;
    margin: 0;
    padding: 0;
    position: relative;
}

.thumbnail figure {
    height: 186px;
    line-height: 186px;
    margin: 0;
    padding: 0;
    text-align: center;
    width: 100%;
}

.thumbnail .caption {
    background: #fcfcfc none repeat scroll 0 0;
    overflow: hidden;
    padding: 32px 32px 47px;
    position: relative;
}
.thumbnail .caption {
    padding: 9px;
}


</style>
<title>Vensa Technologies | Solution for your IT needs</title>
</head>
<body style="background-color: #fdfdfd;">

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
	
	
	<div class="row" style="background-color: #f8f8f8;">
	<div class="col-md-2"></div>
	<div class="col-md-2 col-sm-6 col-xs-6">
		<div class="thumbnail">
              <figure style="background: #f1bb40 none repeat scroll 0 0;"><img alt="" src="resources/img/page1_icon1.png"></figure>
              <div class="caption maxheight" style="height: 251px;"><div class="box_inner">
                  <p class="text-center" style="margin-top: 0px;font-weight: normal;font-size: 22px;border-bottom: 1px solid #cfcfcf;">GLOBAL RESEARCH</p>
                  <p>Bertarsa atunteger rutrum losasjha vertyua hatsfasera.Bsey yoleacnrit ma hasesera deyuas lety mert betyudes. Cum socis natoqu eagnis dulmuese ugiata lesuada lecenas.</p>
                  <a href="#"><img alt="" src="img/arrow.png"></a>
              </div></div>
          </div>
	</div>
	
	<div class="col-md-2 col-sm-6 col-xs-6">
		<div class="thumbnail">
              <figure style="background: #01a89e none repeat scroll 0 0"><img alt="" src="resources/img/page1_icon2.png"></figure>
              <div class="caption maxheight" style="height: 251px;"><div class="box_inner">
                  <p class="text-center" style="margin-top: 0px;font-weight: normal;font-size: 22px;border-bottom: 1px solid #cfcfcf;">CREATIVE IDEAS</p>
                  <p>Bertarsa atunteger rutrum losasjha vertyua hatsfasera.Bsey yoleacnrit ma hasesera deyuas lety mert betyudes. Cum socis natoqu eagnis dulmuese ugiata lesuada lecenas.</p>
                  <a href="#"><img alt="" src="img/arrow.png"></a>
              </div></div>
          </div>
	</div>
	
	<div class="col-md-2 col-sm-6 col-xs-6">
		<div class="thumbnail">
              <figure style="background: #d66c9a none repeat scroll 0 0"><img alt="" src="resources/img/page1_icon3.png"></figure>
              <div class="caption maxheight" style="height: 251px;"><div class="box_inner">
                  <p class="text-center" style="margin-top: 0px;font-weight: normal;font-size: 22px;border-bottom: 1px solid #cfcfcf;">NEW SERVICES</p>
                  <p>Bertarsa atunteger rutrum losasjha vertyua hatsfasera.Bsey yoleacnrit ma hasesera deyuas lety mert betyudes. Cum socis natoqu eagnis dulmuese ugiata lesuada lecenas.</p>
                  <a href="#"><img alt="" src="img/arrow.png"></a>
              </div></div>
          </div>
	</div>
	
	<div class="col-md-2 col-sm-6  col-xs-6">
		<div class="thumbnail">
              <figure style="background: #b1c77a none repeat scroll 0 0"><img alt="" src="resources/img/page1_icon4.png"></figure>
              <div class="caption maxheight" style="height: 251px;"><div class="box_inner">
                  <p class="text-center" style="margin-top: 0px;font-weight: normal;font-size: 22px;border-bottom: 1px solid #cfcfcf;">PRO MANAGEMENT</p>
                  <p>Bertarsa atunteger rutrum losasjha vertyua hatsfasera.Bsey yoleacnrit ma hasesera deyuas lety mert betyudes. Cum socis natoqu eagnis dulmuese ugiata lesuada lecenas.</p>
                  <a href="#"><img alt="" src="img/arrow.png"></a>
              </div></div>
          </div>
	</div>
	</div>
	
	
  	<div class="row">
  	<div class="col-md-2"></div>
  	<div class="col-md-4">
  	<h3>Welcome!</h3>
  	<p>Vensa Technologies is a national provider of technology resource solutions to small and mid-size companies including sourcing for federal and state agencies. From single development resource needs to staffing entire project teams.</p>
	<p>At Vensa Technologies, we believe that hard work is the key to sustainable and user friendly technology. By understanding what drives our specialty industries, becoming involved in our communities on a professional and personal basis, following a disciplined process of identifying quality candidates, partnering with employers to understand their core business and their employment requirements, and delivering exceptional service, we achieve great results for all.</p>
  	</div>
  	
  	<div class="col-md-2 col-sm-6 col-xs-6">
		<div class="thumbnail">
      	<img src="resources/img/thm1.png" alt="...">
	      <div class="caption">
	        <h3>Experience</h3>
	        <p>What sets Team Consultants apart is not only our commitment to our clients, but a commitment to every aspect of our business, our employees, and our community.</p>
	      </div>
    	</div>
	</div>
	
	<div class="col-md-2 col-sm-6 col-xs-6">
		<div class="thumbnail">
      	<img src="resources/img/thm2.png" alt="...">
	      <div class="caption">
	        <h3>Corporate Values</h3>
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
    	</div>
	</div>
  	
  	</div>
  	
<div class="row">
<div class="col-md-2"></div>
<div class="col-md-8">
<h3>Our Clients</h3>
<div class="slider autoplay">
					<div><img src="resources/img/acs.png"></div>
					<div><img src="resources/img/cri.png"></div>
					<div><img src="resources/img/ntt.png"></div>
				</div>
</div>
<div class="col-md-2"></div>
</div>


		
	</div>
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
