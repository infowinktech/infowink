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
<script src="resources/js/checkbox.js"></script>
<style type="text/css">
.form-group{
	margin-bottom: 0px;
}
.form-control-static{
padding-bottom: 0px;
}

.inputError{
		border-bottom: 2px solid #ff4c4c;
}

.form-horizontal .control-label {
   
    text-align: left;
}
</style>

<script type="text/javascript">
$(document).ready(function() {

	$("#updateID").click(function() {
		$status = $("#statusID").val();
		console.log("status:"+$status);
		$status = $status.trim();
		if($status.length>0){
			$.ajax({
				url : "updateUserRole",
				dataType : "xml",
				type : "POST",
				data : "role="+$status,
				success : function(xml){
					if($(xml).find("status").text()=='true'){
							$("#msgID").show();
						}
				},
				error : function(xhr, status, error) {
						console.log("Error occured...");
				}
			});
			}
	});
	
	$.ajax({
		url : "loadUserBasedOnId",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#firstNameID").html($(xml).find("firstName").text());
			$("#lastNameID").html($(xml).find("lastName").text());
			$("#emailID").html($(xml).find("email").text());
			$("#roleID").html($(xml).find("role").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});

	
});

function roleStatus(status){
	console.log("status:"+status);
	$("#statusID").val(status);
	$("#aStID").html(status+"&nbsp;&nbsp;<span class='caret'></span>");
}


</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
		
    	<div class="col-sm-9" style="min-height: 550px;">
    	
    	<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
			  <li><a href="manageusers">Manage Users</a></li>
			  <li class="active">View User</li>
		</ol>
			
			<form class="form-horizontal" enctype="multipart/form-data" target="iframe" action="applyJob" method="post" id="formID">
				  <div class="form-group">
				    <label class="col-sm-3 control-label text-left">First Name</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="firstNameID"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label text-left">Last Name</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="lastNameID"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Email</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="emailID"></p>
				    </div>
				  </div>
				  
				   <div class="form-group">
				    <label class="col-sm-3 control-label">Role</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="roleID"></p>
				    </div>
				  </div>
				
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Change Role</label>
				    <div class="col-sm-9">
				     	 <div class="dropdown">
							  <button class="btn btn-primary dropdown-toggle btn-sm" type="button" data-toggle="dropdown" id="aStID"> Application Status <span class="caret"></span></button>
							  <ul class="dropdown-menu">
							    <li><a href="javascript:roleStatus('Admin')">Admin</a></li>
							    <li><a href="javascript:roleStatus('User')">User</a></li>
							  </ul>
						</div>
				    </div>
				    <input type="hidden" id="statusID" value="" /> 
				    
				  </div>
				  
				
				
				
				<p style="margin-top: 20px;">  
				<button type="button" class="btn btn-primary btn-sm" id="updateID">Update User</button>
				</p>
				<p style="color: #18bc9c;display: none;" id="msgID" class="text-center"><span class="fa fa-check" style="padding-right: 10px;"></span>Successfully updated!</p>
			</form>			
				 
		</div>
		
  	</div>
  </div>
	
	
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Resume</h4>
      </div>
      <div class="modal-body">
        
        
        <div class="row">
        	<a href="#" id="iframeID"></a>
        </div>
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
