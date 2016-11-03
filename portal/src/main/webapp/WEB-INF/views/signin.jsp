
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="743495565018-tno1atsqg5f21k6a6jaj1vf89nls5sqp.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="//connect.facebook.net/en_US/sdk.js"></script>
<style type="text/css">
.inputError{
		border-bottom: 2px solid #ff4c4c;
	}
.input-sm{font-size: 15px;}
</style>
<script src="resources/js/signin.js"></script>
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="signInModalID">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-top: 5px; padding-bottom: 5px;">
					<button id="modalCloseID" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 7px;">
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
						<button type="button" class="btn btn-primary btn-sm" id="loginID">Log in</button>
						<a href="#" id="forgotLinkID" style="padding-left: 20px;" >Forgot Password?</a>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID">
						<p id="msgID1" class="text-center" style="dislpay:none;"></p>
						
						<div class="hr-sect">Or</div>
						<div class="row">
							<div class="col-md-3">
								<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>	
							</div>
							<div class="col-md-3">
								<a class="btn btn-block btn-social btn-facebook btn-sm" id="loginBtn">
        <i class="fa fa-facebook"></i> Sign in
      </a>
							</div>
						</div>
						
						
					</form>
				  </div>

				  <div id="registerForm" class="tab-pane fade">
	
					<form role="form" id="registerFormID">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="First Name" id="rfirstNameID" name="rfirstName">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Last Name" id="rlastNameID" name="rlastName">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Email" id="remailID" name="remail">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-sm"  placeholder="Password" id="rpasswordID" name="rpassword">
						</div>

						<button id="registerID" type="button" class="btn btn-primary btn-sm">Register</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID1">
						
						<p id="msgID" class="text-center" style="dislpay:none;"></p>
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
	
	
	<!-- Modal -->
	<div class="modal fade" tabindex="-1" role="dialog" id="changePwdModalID">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="padding-top: 5px; padding-bottom: 5px;">
					<button id="modalCloseID" type="button" class="close" data-dismiss="modal" aria-label="Close" style="margin-top: 7px;">
						<span aria-hidden="true">&times;</span>
					</button>
					
					<ul class="nav nav-pills">
					  <li class="active"><a data-toggle="pill" href="#changePwdFormID">Change Password</a></li>
					  <li><a data-toggle="pill" href="#resetPwdForm">Reset Password</a></li>
					</ul>
										
				</div>
				<div class="modal-body">
				<div class="tab-content">

				  <div id="changePwdFormID" class="tab-pane fade in active">
					<form role="form">
						<div class="form-group">
							<input type="password" class="form-control input-sm" id="pwd1" placeholder="Enter your old Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-sm" id="pwd2" placeholder="Enter your new Password">
						</div>
						<div class="form-group">
							<input type="password" class="form-control input-sm" id="pwd3" placeholder="Repeat your new Password">
						</div>
						<button type="button" class="btn btn-primary btn-sm" id="chgPwdBntID">Change Password</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID23">
						<p id="chgPwdMsgID" class="text-center" style="dislpay:none;"></p>
					</form>
				  </div>

				  <div id="resetPwdForm" class="tab-pane fade">
	
					<form role="form" id="resetPwdFormID">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Enter your Email" id="resetEmailID">
						</div>
						
						<button id="rstPwdBntID" type="button" class="btn btn-primary btn-sm">Reset Password</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID343">
						
						<p id="rstPwdMsgID" class="text-center" style="dislpay:none;"></p>
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
