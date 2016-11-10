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
<style type="text/css">
address {
    font-style: normal;
    line-height: 1.42857;
    margin-bottom: 20px;
}
address p {
    border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    margin-bottom: 7px;
    padding:10px;
}
</style>
<script type="text/javascript">
$(function() {
	console.log("ready");

	$( "#registerID" ).click(function() {
		$firstNameID=$('#firstNameID').val();
		$lastNameID=$('#lastNameID').val();
		$emailID=$('#emailID').val();
		$companyID=$('#companyID').val();
		$mobileID=$('#mobileID').val();

		$addressID=$('#addressID').val();
		$cityID=$('#cityID').val();
		$stateID=$('#stateID').val();
		$commentsID=$('#commentsID').val();

		if($firstNameID.trim().length==0){$("#firstNameID").addClass("inputError");}
		if($lastNameID.trim().length==0){$("#lastNameID").addClass("inputError");}
		if($emailID.trim().length==0){$("#emailID").addClass("inputError");}
		if($companyID.trim().length==0){$("#companyID").addClass("inputError");}
		if($mobileID.trim().length==0){$("#mobileID").addClass("inputError");}

		if($addressID.trim().length==0){$("#addressID").addClass("inputError");}
		if($cityID.trim().length==0){$("#cityID").addClass("inputError");}
		if($stateID.trim().length==0){$("#stateID").addClass("inputError");}
		if($commentsID.trim().length==0){$("#commentsID").addClass("inputError");}

		$("#firstNameID").keypress(function() {$(this).removeClass("inputError");});
		$("#lastNameID").keypress(function() {$(this).removeClass("inputError");});
		$("#emailID").keypress(function() {$(this).removeClass("inputError");});
		$("#companyID").keypress(function() {$(this).removeClass("inputError");});
		$("#mobileID").keypress(function() {$(this).removeClass("inputError");});

		$("#addressID").keypress(function() {$(this).removeClass("inputError");});
		$("#cityID").keypress(function() {$(this).removeClass("inputError");});
		$("#stateID").keypress(function() {$(this).removeClass("inputError");});
		$("#commentsID").keypress(function() {$(this).removeClass("inputError");});
		
		
		
		if($firstNameID.trim().length>0 &&
		   $lastNameID.trim().length>0 &&
		   $emailID.trim().length>0 &&
		   $companyID.trim().length>0 && 
		   $commentsID.trim().length>0 &&
		   $addressID.trim().length>0 &&
		   $cityID.trim().length>0 &&
		   $stateID.trim().length>0
		   ){
			submit(); 
			 
		}

	});

	function submit(){
		$( "#registerID" ).hide();
		$("#loadingID1").show();
		$.ajax({
			url : "submitMessage",
			data : $('#contactFormID').serialize(),
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : "xml",
			type : "POST",
			success : function(xml){
				$("#loadingID1").hide();
				$( "#registerID" ).show();
				console.log($(xml).find("status").text());
				
				$("#successMsg").html($(xml).find("status").text());
				
				if($(xml).find("statusCode").text()=="true"){
					 $("#successMsg").css("color", "#18bc9c");
				}else{
					$("#successMsg").css("color", "#ff4c4c");
				}
				
				 $("#myModal").modal(); 
			},
			error : function(xhr, status, error) {
					console.log("Erro occured...");
			}
		});
	}	  
});
</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		<div class="col-sm-12 col-md-5">
			<h3>Contact us!</h3>		
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12 col-md-5">
			<iframe src="https://www.google.com/maps/embed?pb=!1m16!1m10!1m3!1d47400.584644547016!2d-88.03659293739834!3d42.053117576521885!2m1!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x3d5c112988b2288f!2sRegus+Rolling+Meadows!5e0!3m2!1sen!2sin!4v1478777471958" width="100%" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>
			
			<address>
                            <p><i class="fa fa-map-marker fa-lg" style="color: #18bc9c;"></i> &nbsp;1600 Golf Road,Corporate Center, Suite 1200, Rolling Meadows, IL 60008,US</p>
                            <p><i class="fa fa-phone fa-lg" style="color: #18bc9c;"></i> &nbsp;(+1)-222-279-4923</p>
                            <p><i class="fa fa-envelope fa-lg" style="color: #18bc9c;"></i> &nbsp;hr@vensainc.com</p>
                            
            </address>
		</div>
		
		<div class="col-sm-12 col-md-7">
			<p>We appreciate your interest in Team Consultants and hope we can be of service to you. To learn more about Vensa Technologies and our services, please send us an e-mail at  hr@vensainc.com or call our toll free number (+1)-222-279-4923 . We look forward to hearing from you!</p>
			
			<h3>Send us a message!</h3>
			<form role="form" id="contactFormID">
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="First Name" name="firstName" id="firstNameID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Last Name" name="lastName" id="lastNameID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Email" name="email" id="emailID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Mobile" name="mobile" id="mobileID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Company" name="company" id="companyID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="Address" name="address" id="addressID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="City" name="city" id="cityID">
						</div>
						<div class="form-group">
							<input type="text" class="form-control input-sm"  placeholder="State" name="state" id="stateID">
						</div>
						<div class="form-group">
							<textarea class="form-control input-sm" rows="2" placeholder="Comments" name="comments" id="commentsID"></textarea>
						</div>

						<button id="registerID" type="button" class="btn btn-primary btn-sm">Submit</button>
						<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID1">
						
					</form>			
		</div>
	</div>
	
	
  </div>
  		
  		
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Contact Us</h4>
      </div>
      <div class="modal-body">
        <p id="successMsg" class="text-center"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
