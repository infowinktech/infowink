<style type="text/css">
.inputError{
		border-bottom: 2px solid #ff4c4c;
	}
.input-sm{font-size: 15px;}
</style>


<script>
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
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID">
						<p id="msgID1" class="text-center" style="dislpay:none;"></p>
						
						<div class="hr-sect">Or</div>
						<div class="g-signin2" data-onsuccess="onSignIn"></div>
						
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
