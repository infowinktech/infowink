<html><head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
        <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
        <script>
            $( document ).ready(function() {
            					$('.dropdown').hover(function(){ 
            					$('.dropdown-toggle', this).trigger('click'); 
            				});
            				$('#navigationID li').hover(function(){ 
            					$(this).addClass("active");
            				});
            				
            				$( "#navigationID li" ).hover(function() {
            					$( this ).addClass( "active" );
            					}, function() {
            					$( this ).removeClass( "active" );
            					}
            				);
            	
            			});
        </script>
        <style>
            /*
            .carousel-inner{
                height: 500px;
            }
            
            
            .item, img{
                height: 100% !important;
                width:  100% !important;
                border: 1px solid red;
            }
            */
            
            .carousel .item{
                height: 500px;
            }
            
            .item img {
                position: absolute;
                top: 0;
                left: 0;
                min-height: 500px;
            }
        </style>
    </head><body>
        <div class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand"><b>Job </b>Portal</a>
                </div>
                <div class="collapse navbar-collapse" id="navbar-ex-collapse">
                    <ul class="nav navbar-nav navbar-right" id="navigationID">
                        <li>
                            <a href="#">HOME</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">SERVICES</a>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="#">Staffing Services</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Project Management</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Consultancy</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">On Demand Resources</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Infrastructure Services</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">Application Development</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">CAREERS</a>
                        </li>
                        <li>
                            <a href="#">POST A JOB</a>
                        </li>
                        <li>
                            <a href="#">POST A RESUME</a>
                        </li>
                        <li>
                            <a href="#">ABOUT US</a>
                        </li>
                        <li>
                            <a href="#">CONTACT US</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="fullcarousel-example" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#fullcarousel-example" data-slide-to="0" class="active"></li>
                <li data-target="#fullcarousel-example" data-slide-to="1"></li>
                <li data-target="#fullcarousel-example" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active">
                    <img src="resources/img/img3.jpg">
                    <div class="carousel-caption">
              
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
            </div>
                </div>
                <div class="item">
                    <img src="resources/img/img2.jpg">
                    <div class="carousel-caption">
              <h1>Another example headline.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
            </div>
                </div>
                <div class="item">
                    <img src="resources/img/img1.jpg">
                    <div class="carousel-caption">
              <h1>One more for good measure.</h1>
              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
            </div>
                </div>
            </div>
            <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
            <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
        </div>
		
		
    

</body></html>