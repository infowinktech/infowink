<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="//connect.facebook.net/en_US/sdk.js"></script>
<script>
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
			document.getElementById('loginBtn').style.display = 'none';
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
		$("#response").append("<p>"+response.first_name+"</p>");
		$("#response").append("<p>"+response.last_name+"</p>");
		$("#response").append("<p>"+response.email+"</p>");
	});
}

//load the JavaScript SDK


</script>

<!--
  Below we include the Login Button social plugin. This button uses
  the JavaScript SDK to present a graphical Login button that triggers
  the FB.login() function when clicked.
-->

<button id="loginBtn">Facebook Login</button>
<div id="response">

</div>

</body>
</html>