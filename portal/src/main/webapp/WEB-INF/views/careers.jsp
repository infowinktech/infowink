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

	$fullTime = "FULL-TIME="+$('#FULL-TIMEID').is(":checked");
	$permanent = "PERMANENT="+$('#PERMANENTID').is(":checked");
	$partTime = "PART-TIME="+$('#PART-TIMEID').is(":checked");
	$contract = "CONTRACT="+$('#CONTRACTID').is(":checked");
	$anyType = "ANYTYPE="+$('#ANYTYPEID').is(":checked");

	$('#FULL-TIMEID').change(function() {$fullTime = "FULL-TIME="+$(this).is(":checked");loadJobs();});
	$("#PERMANENTID").change(function() {$permanent = "PERMANENT="+$(this).is(":checked");loadJobs();});
	$("#PART-TIMEID").change(function() {$partTime = "PART-TIME="+$(this).is(":checked");loadJobs();});
	$("#CONTRACTID").change(function() {$contract = "CONTRACT="+$(this).is(":checked");loadJobs();});
	$("#ANYTYPEID").change(function() {$anyType = "ANYTYPE="+$(this).is(":checked");loadJobs();});

	loadJobs();
});

function loadJobs(){
	$.ajax({
		url : "loadCareers",
		dataType : "xml",
		data : $fullTime+"&"+$permanent+"&"+$partTime+"&"+$contract+"&"+$anyType,
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
}
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
<title>Vensa Technologies | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>

	
<form id="formID" action="jobdetails">
</form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
			<div class="row">
			<div class="col-sm-9" style="border-right: 1px solid #e0e0e0;min-height: 600px;">
				
				<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Careers</li>
				</ol>
				<h3 style="margin-bottom: 20px;">Job Openings</h3>

				
				 	<ul class="list-group" id="jobsBodyID">
					 
					  
					</ul>
				 
				
				
			</div>

			<div class="col-sm-3" >
				<h3 style="margin-bottom: 21px;">Job Type</h3>
				<div class="checkbox">
			          <label>
			            <input type="checkbox" value="" checked id="ANYTYPEID">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            Any Type
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="FULL-TIME" id="FULL-TIMEID">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            FULL-TIME
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="PERMANENT" id="PERMANENTID" >
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            PERMANENT
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="PART-TIME" id="PART-TIMEID">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            PART-TIME
			          </label>
		        </div>
		        
		        <div class="checkbox">
			          <label>
			            <input type="checkbox" value="CONTRACT" id="CONTRACTID">
			            <span class="cr"><i class="cr-icon glyphicon glyphicon-ok"></i></span>
			            CONTRACT
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
