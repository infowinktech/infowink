<style>
.v4-tease {
    
    color: #fff;
    display: block;
    padding: 5px 0px;
    text-align: center;
    font-family: 'Questrial', sans-serif;
    
}

.v4-tease span{
	margin-left: 8px;
}

.navbar-brand {
    font-size: 20px;
}
</style>


<nav class="navbar navbar-default  navbar-fixed-top" style="margin-bottom: 0px;;">
		<div class="container-fluid"  style="background-color: #476481;opacity:0.6;">
			<div class="visible-lg">
				<ul class="v4-tease list-inline text-right" style="margin-bottom: 0px;">
				  <li class="glyphicon glyphicon-map-marker" style="color: #18bc9c;"></li>
				  <li>1600 Golf Road,Corporate Center, Suite 1200, Rolling Meadows, IL 60008,US</li>
				  <li class="glyphicon glyphicon-time" style="margin-left: 20px;color: #18bc9c;"></li>
				  <li>Mon - Sat 8.00 - 18.00. Sunday CLOSED</li>
				  <li class="glyphicon glyphicon-earphone" style="margin-left: 20px;color: #18bc9c;"></li>
				  <li>1-222-279-4923</li>
				  <li class="glyphicon glyphicon-envelope" style="margin-left: 20px;color: #18bc9c;"></li>
				  <li>hr@vensainc.com</li>
				</ul>
		</div>
		
		
		</div>
		
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<!-- .navbar-->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>

				<a class="navbar-brand" href="home">
				 <b>Vensa</b> Technologies
				</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="home">Home</a></li>
					<li><a href="services">Services</a></li>
					<li><a href="careers">Careers</a></li>
					
					<li class="dropdown" id="adminLinksID" style="display: none;"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Admin <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="dashboard">Dashboard</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="manageusers">Manage Users</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="managejobs">Manage Jobs</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="manageapplications">Manage Applications</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="managemsgs">Manage Messages</a></li>
						</ul>
					</li>
						
					<li><a href="about">About Us</a></li>
					<li><a href="contact">Contact Us</a></li>
					
					<li id="loginLinkID"><a data-toggle="modal" href="#"
						data-target="#signInModalID"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
							
					<li class="dropdown" id="accountLinkID">
					<a role="button" data-toggle="dropdown" class="dropdown-toggle" href="#" id="profileLinkID">
	                <span class="glyphicon glyphicon-user"></span>
	                </a>
	                <ul class="dropdown-menu">
	                  <li><a href="myjobs"><span class="glyphicon glyphicon-briefcase">&nbsp;</span>My Jobs</a></li>
	                  <li class="divider" role="separator"></li>
	                  <li><a href="#" id="myAcntChgPwdID"><span class="glyphicon glyphicon-wrench">&nbsp;</span>Change Password</a></li>
	                  <li><a href="javascript:logout();" id="logoutID"><span class="glyphicon glyphicon-log-out">&nbsp;</span>Log out</a></li>
	                </ul>
	              </li>
				<form id="logoutFormID" style="display:none;" action="logout"></form>
				</ul>
			</div>
			<!-- /.navbar -->
		</div>
		<!-- /.container-->

	</nav>