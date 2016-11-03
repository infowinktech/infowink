/**
 * 
 */
$(document).ready(function() {

	FB.init({
		appId      : '200586337051347',
		xfbml      : true,
		version    : 'v2.2'
	});
 
	//check user session and refresh it
	FB.getLoginStatus(function(response) {
		if (response.status === 'connected') {
			console.log("response:"+response);
			getUserData();
		} else {
			//user is not authorized
		}
	});

	(function(d, s, id){
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {return;}
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	$("#loginBtn").click(function() {
		FB.login(function(response) {
			if (response.authResponse) {
				getUserData();
			}
		}, {'scope': 'email'});
	});
		
	});
function getUserData() {
	FB.api('/me', {fields: 'first_name,last_name,email'}, function(response) {
		$firstName = response.first_name;
		$lastName = response.last_name;
		$email = response.email;
		
		console.log($firstName);
		console.log($lastName);
		console.log($email);

		$data = "firstName="+$firstName+"&lastName="+$lastName+"&email="+$email;
		socialLogin($data);
	});
}
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
    socialLogin($data);
    var id_token = googleUser.getAuthResponse().id_token;
    console.log("ID Token: " + id_token);
  };

 function socialLogin(headerData){
	 $.ajax({
			url : "authenticateSocialLogin",
			data : headerData,
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
	 }
  
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