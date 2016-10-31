
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id" content="743495565018-tno1atsqg5f21k6a6jaj1vf89nls5sqp.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>

<style type="text/css">
.inputError{
		border-bottom: 2px solid #ff4c4c;
	}
.input-sm{font-size: 15px;}
</style>


<script>

function logout(){
	googleLogOut();
	$("#logoutFormID").submit();
	
}

function googleLogOut(){
	
	  var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });

}

function onSignIn(googleUser) {
    // Useful data for your client-side scripts:
    var profile = googleUser.getBasicProfile();
    console.log("ID: " + profile.getId()); // Don't send this directly to your server!
    console.log('Full Name: ' + profile.getName());
    console.log('Given Name: ' + profile.getGivenName());
    console.log('Family Name: ' + profile.getFamilyName());
    console.log("Image URL: " + profile.getImageUrl());
    console.log("Email: " + profile.getEmail());
    
    $firstName = profile.getGivenName();
    $lastName =  profile.getFamilyName();
    $email = profile.getEmail();
    
    $data = "firstName="+$firstName+"&lastName="+$lastName+"&email="+$email;
    $.ajax({
		url : "authenticateSocialLogin",
		data : $data,
		type : "GET",
		dataType: "xml",
		success : function(xml){
			$username = $(xml).find("userName").text();
			$adminAccess = $(xml).find("adminAccess").text();
			$username = $username.trim();
			$("#loadingID").hide();
			
			if($username.length>1){
				$("#loadingID").hide();
				$("#loginLinkID").hide();
				$("#profileLinkID").html(" <span class='glyphicon glyphicon-user'></span>&nbsp;&nbsp;"+$username);
				$("#accountLinkID").show();
				$("#modalCloseID").click();
				
				if($(xml).find("adminAccess").text()=="true"){
					$("#adminLinksID").show();
				}
			}
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});

    // The ID token you need to pass to your backend:
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
  };
  
  
$(document).ready(function() {

	$.ajax({
		url : "profileLink",
		type : "GET",
		dataType: "xml",
		async:false,
		success : function(xml){
			$username = $(xml).find("userName").text();
			$adminAccess = $(xml).find("adminAccess").text();
			$username = $username.trim();
			console.log($username);
			console.log($adminAccess);
			
			if($username.length>1){
				$("#accountLinkID").show();
				$("#loginLinkID").hide();
				$("#profileLinkID").append($username);

				if($(xml).find("adminAccess").text()=="true"){
					console.log("showig...");
					$("#adminLinksID").show();
				}
				
			}else{
					$("#accountLinkID").hide();
					$("#loginLinkID").show();
				}
		},
		error : function(xhr, status, error) {
				console.log("Erro occured...");
		}
	});
	
	$password="";
	$email="";

	$("#chgPwdBntID").click(function() {
		$pwd1 = $("#pwd1").val().trim();
		$pwd2 = $("#pwd2").val().trim();
		$pwd3 = $("#pwd3").val().trim();

		if($pwd1.trim().length==0){$("#pwd1").addClass("inputError");}
		if($pwd2.trim().length==0){$("#pwd2").addClass("inputError");}
		if($pwd3.trim().length==0){$("#pwd3").addClass("inputError");}

		if($pwd2==$pwd3){}else{$("#chgPwdMsgID").html("New, Repeat New password not matching!");$("#chgPwdMsgID").css("color", "#ff4c4c");}
		 
		if($pwd1.length>0 &&
				$pwd2.length>0 &&
				$pwd3.length>0 && ($pwd2 == $pwd3)){
			$data = "pwd1="+$pwd1+"&pwd2="+$pwd2+"&pwd3="+$pwd3;
			$.ajax({
				url : "changePassword",
				type : "GET",
				data:$data,
				dataType: "xml",
				async:false,
				success : function(xml){
					$("#chgPwdMsgID").html($(xml).find("status").text());
					if($(xml).find("statusCode").text()=="true"){
						 $("#chgPwdMsgID").css("color", "#18bc9c");
					}else{
						$("#chgPwdMsgID").css("color", "#ff4c4c");
					}
				},
				error : function(xhr, status, error) {
						console.log("Erro occured...");
				}
			});
		}	
		
		
	});

	$("#pwd1").keypress(function() {$(this).removeClass("inputError");});
	$("#pwd2").keypress(function() {$(this).removeClass("inputError");});
	$("#pwd3").keypress(function() {$(this).removeClass("inputError");});
	
	$("#forgotLinkID").click(function() {
		$('#signInModalID').modal('hide');
		$('#changePwdModalID').modal();
	});

	$("#myAcntChgPwdID").click(function() {
		$('#changePwdModalID').modal();
	});
	
	
	$("#emailID").keypress(function() {
		$(this).removeClass("inputError");
		$("#msgID1").hide();
	});
	$("#passwordID").keypress(function() {
		$(this).removeClass("inputError");
		$("#msgID1").hide();
	});

	
	$( "#logoutID" ).click(function() {
			console.log("logout clicked...");
		});		

	$( "#loginID" ).click(function() {
		$password=$('#passwordID').val();
		$email=$('#emailID').val();
		if($email.trim().length==0){
			$("#emailID").addClass("inputError");			
		}
		if($password.trim().length==0){
			$("#passwordID").addClass("inputError");
		}

		if($email.trim().length>0 && $password.trim().length>0){
			login();
		}

	});

	function login(){
		$("#loginID").hide();
		$("#loadingID").show();
		
		$data = 'email='+ $email+ '&password='+ $password;
		console.log($data);
		$.ajax({
			url : "authenticate",
			data : $data,
			type : "GET",
			dataType: "xml",
			success : function(xml){
				$username = $(xml).find("userName").text();
				$adminAccess = $(xml).find("adminAccess").text();
				$username = $username.trim();
				$("#loadingID").hide();
				
				if($username.length>1){
					$("#loadingID").hide();
					$("#loginLinkID").hide();
					$("#profileLinkID").append($username);
					$("#accountLinkID").show();
					$("#modalCloseID").click();
					
					if($(xml).find("adminAccess").text()=="true"){
						$("#adminLinksID").show();
					}
				}else{
					$("#loadingID").hide();
					$("#loginID").show();

					$("#msgID1").html("Invalid credentials");
					$("#msgID1").show();
					$("#msgID1").css("color", "#ff4c4c");
					}
			},
			error : function(xhr, status, error) {
					console.log("Error occured...");
			}
		});
	}

	$rfirstName = "";
	$rlastName = "";
	$remail = "";
	$rpassword = "";

	$("#rfirstNameID").keypress(function() {$(this).removeClass("inputError");});
	$("#rlastNameID").keypress(function() {$(this).removeClass("inputError");});
	$("#remailID").keypress(function() {$(this).removeClass("inputError");});
	$("#rpasswordID").keypress(function() {$(this).removeClass("inputError");});

	$( "#registerID" ).click(function() {
		$rfirstName=$('#rfirstNameID').val();
		$rlastName=$('#rlastNameID').val();
		$remail=$('#remailID').val();
		$rpassword=$('#rpasswordID').val();
		
		if($rfirstName.trim().length==0){$("#rfirstNameID").addClass("inputError");}
		if($rlastName.trim().length==0){$("#rlastNameID").addClass("inputError");}
		if($remail.trim().length==0){$("#remailID").addClass("inputError");}
		if($rpassword.trim().length==0){$("#rpasswordID").addClass("inputError");}

		if($rfirstName.trim().length>0 && $rlastName.trim().length>0 && $remail.trim().length>0 && $rpassword.trim().length>0){
			register();
		}

	});

	function register(){
		$( "#registerID" ).hide();
		$("#loadingID1").show();
		$.ajax({
			url : "register",
			data : $('#registerFormID').serialize(),
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "xml",
			type : "POST",
			success : function(xml){
				$("#loadingID1").hide();
				$( "#registerID" ).show();
				
				$("#msgID").html($(xml).find("status").text());
				$("#msgID").show();
				if($(xml).find("statusCode").text()=="true"){
					 $("#msgID").css("color", "#18bc9c");
				}else{
					$("#msgID").css("color", "#ff4c4c");
				}
			},
			error : function(xhr, status, error) {
					console.log("Erro occured...");
			}
		});
	}

	$("#rstPwdBntID").click(function() {
		$resetEmailID=$('#resetEmailID').val();
		
		if($resetEmailID.trim().length==0){$("#resetEmailID").addClass("inputError");}
		
		if($resetEmailID.trim().length>0){
			$("#loadingID343").show();
			$.ajax({
				url : "resetPassword",
				data:"resetEmail="+$resetEmailID,
				dataType : "xml",
				type : "GET",
				success : function(xml){
					$("#loadingID343").hide();

					$("#rstPwdMsgID").html($(xml).find("status").text());
					$("#rstPwdMsgID").show();
					if($(xml).find("statusCode").text()=="true"){
						 $("#rstPwdMsgID").css("color", "#18bc9c");
					}else{
						$("#rstPwdMsgID").css("color", "#ff4c4c");
					}
				},
				error : function(xhr, status, error) {
					$("#loadingID343").hide();
				}
			});
		}

	});

});
</script>
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
						<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
						
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
