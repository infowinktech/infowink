
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="signInModalID">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-top: 5px; padding-bottom: 5px;">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span>
					</button>
					
					<ul class="nav nav-pills">
					  <li class="active"><a data-toggle="pill" href="#loginForm">Login</a></li>
					  <li><a data-toggle="pill" href="#registerForm">Register</a></li>
					</ul>
										
				</div>
				<div class="modal-body">
				<div class="tab-content">

				  <div id="loginForm" class="tab-pane fade in active">
					<form role="form">
						<div class="form-group">
							<input type="text" class="form-control input-sm" id="emailID" placeholder="Enter your Email">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-sm" id="passwordID" placeholder="Enter your Password">
						</div>
						<button type="submit" class="btn btn-primary btn-sm">Log in</button>
						
						<div class="hr-sect">Or</div>
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
						
					</form>
				  </div>

				  <div id="registerForm" class="tab-pane fade">
	
					<form role="form">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="First Name">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Last Name">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Email">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-sm"  placeholder="Password">
						</div>

						<button type="submit" class="btn btn-primary btn-sm">Register</button>
					</form>				    

	    
				  </div>
				</div>

				</div>
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
