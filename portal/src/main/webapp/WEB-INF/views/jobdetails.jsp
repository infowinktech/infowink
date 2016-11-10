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
</style>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		url : "loadJobDetails",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			$("#overviewID").html($(xml).find("overviewContent").text());
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
});

function checkUser(){
	$.ajax({
		url : "checkUser",
		dataType : "text",
		type : "POST",
		success : function(data){
			if(data=='false'){
				$("#signInModalID").modal();
			}else{
				console.log("user logged in");
				$("#formID").submit();	
			}
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}
</script>
<title>Vensa Technologies | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	<form action ="apply" id="formID"></form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-9" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;">
			  <li><a href="careers">Careers</a></li>
			  <li class="active">Job Details</li>
			</ol>
			<div>
				  <table class="table jobTable">
				   <tbody id="jobsBodyID">
				     
				    </tbody>
				  </table>
				</div>		
				 
		</div>
		<div class="col-sm-3" style="border: 1px solid #e0e0e0;margin-top: 21px;background-color: #fdfdfd;" id="overviewID">
			
		</div>
  	</div>
  </div>
  		
  		
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
