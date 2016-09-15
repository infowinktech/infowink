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
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="YOUR_CLIENT_ID.apps.googleusercontent.com">
<link rel="stylesheet" href="resources/css/custom.css">
<link rel="stylesheet" href="resources/css/checkbox.css">
<style type="text/css">
.input-sm{font-size: 15px;}

.jobTable{
	border: none;
}

.jobTable tr td:first-child
{
    font-weight: bold;
}

.jobTable>tbody>tr>td{
	padding-top:0px; 
	padding-bottom:2px;
}

.jobtitle{
	font-weight:bold;font-size: 12px; color:#ffffff;padding:5px;margin-left: 10px;
}

.PART-TIME{
	background-color: #FF003F;
}
.CONTRACT{
	background-color: #FFD300;
}
.PERMANENT{
	background-color: #087830;
}
.FULL-TIME{
	background-color: #6495ED;
}


</style>
<script type="text/javascript">
$(document).ready(function() {

	
	
	$.ajax({
		url : "loadActiveJobs",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
	
});
function jobDetails(id){
	$data = 'jobId='+ id;
	$.ajax({
		url : "saveJobId",
		data : $data,
		dataType : "text",
		type : "POST",
		success : function(data){
			$("#formID").submit();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}
</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	
<form id="formID" action="jobdetails">
</form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
			<div class="row">
			<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;min-height: 600px;">
				<h3 style="margin-bottom: 20px;">Job Openings</h3>

				
				 	<ul class="list-group" id="jobsBodyID">
					 
					  
					</ul>
				 
				
				
			</div>

			<div class="col-sm-3" >
				<h3 style="margin-bottom: 21px;">Job Type</h3>
				<div class="checkbox">
			          <label>
			            <input type="checkbox" value="" checked>
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            Any Type
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="FULL-TIME">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            FULL-TIME
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="PERMANENT" >
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            PERMANENT
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="PART-TIME" >
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            PART-TIME
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="CONTRACTOR" >
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            CONTRACTOR
			          </label>
		        </div>
		        
		        <h3 style="margin-bottom: 21px;">Rate / Hr</h3>
				<div class="checkbox">
			          <label>
			            <input type="checkbox" value="Any Rate" checked>
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            Any Rate
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="$0 - $25">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            $0 - $25
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="$25 - $50">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            $25 - $50
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="$50 - $100">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            $50 - $100
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="$100 - $150">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            $100 - $150
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="$200+">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            $200+
			          </label>
		        </div>
		        
		        			
			</div>

		</div>
	</div>


	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
