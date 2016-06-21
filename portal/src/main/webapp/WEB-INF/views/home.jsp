<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/bootstrap-flatly.min.css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Questrial' rel='stylesheet' type='text/css'>
<script src="resources/js/jquery.min.js"></script>

<script>

</script>
<style>
body{
font-family: 'Questrial', sans-serif;
}


			.carousel .item{
                height: 400px;
            }
            
            .item img {
                position: absolute;
                top: 0;
                left: 0;
                min-height: 400px;
				width:100%;
            }
			
.navbar-brand {
  line-height:12px;
  padding-top:20px;
  padding-bottom:5px;
}

.navbar-brand small {
  display:block;
  font-size:10px;
  padding-top: 3px; padding-left: 1px;
}			


/*=========================
  Icons
 ================= */

/* footer social icons */
ul.social-network {
	list-style: none;
	display: inline;
	margin-left:0 !important;
	padding: 0;
}
ul.social-network li {
	display: inline;
	margin: 0 5px;
}


/* footer social icons */
.social-network a.icoRss:hover {
	background-color: #F56505;
}
.social-network a.icoFacebook:hover {
	background-color:#3B5998;
}
.social-network a.icoTwitter:hover {
	background-color:#33ccff;
}
.social-network a.icoGoogle:hover {
	background-color:#BD3518;
}
.social-network a.icoVimeo:hover {
	background-color:#0590B8;
}
.social-network a.icoLinkedin:hover {
	background-color:#007bb7;
}
.social-network a.icoRss:hover i, .social-network a.icoFacebook:hover i, .social-network a.icoTwitter:hover i,
.social-network a.icoGoogle:hover i, .social-network a.icoVimeo:hover i, .social-network a.icoLinkedin:hover i {
	color:#fff;
}
a.socialIcon:hover, .socialHoverClass {
	color:#44BCDD;
}

.social-circle li a {
	display:inline-block;
	position:relative;
	margin:0 auto 0 auto;
	-moz-border-radius:50%;
	-webkit-border-radius:50%;
	border-radius:50%;
	text-align:center;
	width: 50px;
	height: 50px;
	font-size:20px;
}
.social-circle li i {
	margin:0;
	line-height:50px;
	text-align: center;
}

.social-circle li a:hover i, .triggeredHover {
	-moz-transform: rotate(360deg);
	-webkit-transform: rotate(360deg);
	-ms--transform: rotate(360deg);
	transform: rotate(360deg);
	-webkit-transition: all 0.2s;
	-moz-transition: all 0.2s;
	-o-transition: all 0.2s;
	-ms-transition: all 0.2s;
	transition: all 0.2s;
}
.social-circle i {
	color: #fff;
	-webkit-transition: all 0.8s;
	-moz-transition: all 0.8s;
	-o-transition: all 0.8s;
	-ms-transition: all 0.8s;
	transition: all 0.8s;
}

.modal .close {
color:#ffffff;
}

</style>

<title>Portal</title>
</head>
<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
	<!-- .navbar-->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
	  <a class="navbar-brand" href="#">
        <b>Team</b> Consultants <small>Solution for your IT needs</small>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Services <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Staffing Services</a></li>
			    <li role="separator" class="divider"></li>
            <li><a href="#">Project Management</a></li>
			    <li role="separator" class="divider"></li>
            <li><a href="#">Consulting</a></li>
			    <li role="separator" class="divider"></li>
			<li><a href="#">On Demand Resources</a></li>
			    <li role="separator" class="divider"></li>
            <li><a href="#">Infrastructure Services</a></li>
			    <li role="separator" class="divider"></li>
			<li><a href="#">Application Development</a></li>
		  </ul>
        </li>
		
		<li><a href="#">Careers</a></li>
		  <li><a href="#">Post a Job</a></li>
		  <li><a href="#">Post a Resume</a></li>
		  <li><a href="#">About Us</a></li>
		  <li><a href="#">Contact Us</a></li>
		  
		  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		  <li><a data-toggle="modal" href="#" data-target="#signInModalID"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		  
      </ul>
    </div><!-- /.navbar -->
  </div><!-- /.container-->
  
</nav>

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
          <img class="first-slide" src="resources/img/img1.jpg" alt="First slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Example headline.</h1>
              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
              <p><a class="btn btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="second-slide" src="resources/img/img2.jpg"  alt="Second slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-primary" href="#" role="button">Learn more</a></p>
            </div>
          </div>
        </div>
        <div class="item">
          <img class="third-slide" src="resources/img/img3.jpg"  alt="Third slide">
          <div class="container">
            <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
          </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
<div>
<!-- /.carousel -->


    <!-- Content -->
	<div class="container">
	<div class="row">
		<div class="col-md-9" style="border-right:1px solid #e0e0e0;">
          <h3>Technology at your finger tips!</h3>
          <p>
		   TEAM Consultants is a national provider of technology resource solutions to small and mid-size companies including sourcing for federal and state agencies. From single development resource needs to staffing entire project teams.
		   </p>
		   <p>
		    At TEAM Consultants, we believe that hard work is the key to sustainable and user friendly technology. By understanding what drives our specialty industries, becoming involved in our communities on a professional and personal basis, following a disciplined process of identifying quality candidates, partnering with employers to understand their core business and their employment requirements, and delivering exceptional service, we achieve great results for all.
		   </p>
          
		  <h3>
		  Company
		  </h3>
		  <p>
			What sets Team Consultants apart is not only our commitment to our clients, but a commitment to every aspect of our business, our employees, and our community.
		</p>
        </div>
		
		<div class="col-md-3">
			<h3>Tech Partners</h2>
			<p>
			<table class="table">
			<tr>
				<td><img src="resources/img/microsoft.png" style="height:40px;"></td>
				<td><img src="resources/img/techdata.png" style="height:40px;"></td>
			</tr>
			<tr>
				<td><img src="resources/img/dell.png" style="height:40px;"></td>
				<td><img src="resources/img/cisco.png" style="height:40px;"></td>
			</tr>
			<tr>
				<td><img src="resources/img/toshiba.png" style="height:40px;"></td>
				<td><img src="resources/img/force.png" style="height:40px;"></td>
			</tr>
			</table>
			</p>
		</div>
        
      </div>
	</div>
	
	
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="signInModalID">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
	<!-- /.modal -->
	
	
	<hr style="margin-top: 0px;">
	<footer id="footerID" class="section section-primary bg-primary">
		<div class="container">
                <div class="row small">
					<div class="col-md-4">
					<h4>About Us</h4>
					<p>TEAM Consultants is a national provider of technology resource solutions to small and mid-size companies including sourcing for federal and state agencies. From single development resource needs to staffing entire project teams.</p>
					</div>
					
					<div class="col-md-2">
					<h4>Useful Links</h4>
					<ul style="list-style: none;padding-left:0px;" >
						<li><a href="">Home</a></li>
						<li><a href="">Find a Job</a></li>
						<li><a href="">Services</a></li>
						<li><a href="">Post Resume</a></li>
					</ul>
					</div>
					
					<div class="col-md-3">
					<h4>Subscribe to Newsletter!</h4>
					 <form role="form">
					  <div class="form-group">
						<input type="text" class="form-control" placeholder="Email">
					  </div>
					  <button type="button" class="btn btn-info btn-sm">
						<span class="glyphicon glyphicon-envelope"></span>&nbsp; Subscribe
					  </button>
					  
					</form>
					</div>
					
					<div class="col-md-3">
					<h4>Follow us on</h4>
						<ul class="social-network social-circle">
                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin"><i class="fa fa-linkedin"></i></a></li>
                    </ul>	
					</div>
				</div>
		</div>
	<footer>
<script src="resources/js/bootstrap.min.js"></script>
</body>
</html> 