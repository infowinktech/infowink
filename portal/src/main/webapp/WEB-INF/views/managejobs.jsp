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

<!-- datatables -->
<script src="resources/js/jquery.dataTables.min.js"></script>
<script src="resources/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/dataTables.bootstrap.min.css">

<script src="resources/js/checkbox.js"></script>

<style type="text/css">
.input-sm{
border:1px solid #dce4ec;
padding-left: 5px;
}
.modal-footer {
    text-align: left;
}

</style>

<script type="text/javascript">

function validate(){
	$fileNameID = $("#fileNameID").val();
	
	if($fileNameID.length<=0){
		$("#fileNameID").addClass("inputError");		
	}else{
		$("#uploadBulkFormID").submit();
	}
}

function uploadBulkJobs(){
	$("#loadingIDUploadJobs").show();
	$.ajax({
		url : "processBulkJobs",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			
			//$("#jobsBodyID").html($(xml).find("tableContent").text());
			//$('#jobsTable').DataTable();
			$("#bulkBodyID").html($(xml).find("tableContent").text());
			$("#bulkTableID").show();
			$("#loadingIDUploadJobs").hide();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
				$("#loadingIDUploadJobs").hide();
		}
	});
}
$(document).ready(function() {

	$("#iframeID").unbind().load(function () {
		$output=$('#iframeID').contents().find('body').text();
		if($output=="true"){
			uploadBulkJobs();
		}
	});

	$("#fileID").change(function() {
		$("#fileNameID").val($("#fileID").val());	
		$("#fileNameID").removeClass("inputError");
	});

	$("#browseID","#fileNameID").bind("click", function() {
		$("#fileID").click();
	});
	$("#fileNameID").bind("click", function() {
		$("#fileID").click();
	});

	
	$open = "OPEN="+$('#openID').is(":checked");
	$closed = "CLOSED="+$('#closedID').is(":checked");
	$onHold = "ON-HOLD="+$('#onHoldID').is(":checked");

	loadJobs();
	
	$("#openID").change(function() {
		$open = "OPEN="+$('#openID').is(":checked");
		loadJobs();			
	});

	$("#closedID").change(function() {
		$closed = "CLOSED="+$('#closedID').is(":checked");
		loadJobs();
	});

	$("#onHoldID").change(function() {
		$onHold = "ON-HOLD="+$('#onHoldID').is(":checked");
		loadJobs();
	});
	
});

function exportRecords(){
	$("#loadingID").show();
	$.ajax({
		url : "exportJobs",
		data : $open+"&"+$closed+"&"+$onHold,
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#loadingID").hide();
			$("#hrefLinkID").attr("action",$(xml).find("hrefLink").text());
			$("#hrefLinkID").submit();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
				$("#loadingID").hide();
		}
	});	
}

function loadJobs(){
	$.ajax({
		url : "loadJobs",
		data : $open+"&"+$closed+"&"+$onHold,
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			$('#jobsTable').DataTable();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}

function editRecord(jobcode){
	console.log(jobcode);
	$.ajax({
		url : "saveJobCode",
		data : "jobcode="+jobcode,
		dataType : "text",
		type : "POST",
		success : function(xml){
			$("#formID").attr("action","editjob");
			$("#formID").submit();
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
}

function deleteRecord(jobcode){
	console.log(jobcode);
	$.ajax({
		url : "saveJobCodeforDelete",
		data : "jobcode="+jobcode,
		dataType : "text",
		type : "POST",
		success : function(xml){
			console.log("forwarding...");
			$("#formID").attr("action","deletejob");
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
	
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	<form method="GET" action="editjob" style="display: none;" id="formID"></form> 
	<div class="row">
		
    	<div class="col-sm-12" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Manage Jobs</li>
				</ol>
			
		<p class="text-right">
		<a href="" id="exportDownloadLinkID" style="display: nonne;"></a>
			<span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">OPEN Jobs</button>
		        <input type="checkbox" class="hidden" checked  id="openID" value="OPEN"/>
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">CLOSED Jobs</button>
		        <input type="checkbox" class="hidden" id="closedID" value="CLOSED"/>
		    </span>
		    
		    <span class="button-checkbox">
		        <button type="button" class="btn btn-primary btn-sm btn-success">ON-HOLD Jobs</button>
		        <input type="checkbox" class="hidden" id="onHoldID" value="ON-HOLD"/>
		    </span>
		    
		    <a href="addjob" class="btn btn-primary btn-sm " >Add a new Job</a>
		    <a href="#" class="btn btn-primary btn-sm " data-toggle="modal" data-target="#myModal">Add bulk Jobs</a>
		    <a href=# class="btn btn-primary btn-sm " onclick="javascript:exportRecords();" >Export</a>
		    <form action="" id="hrefLinkID" style="display:none;">Link</form>
        </p>
        <p class="text-center">
			<img alt="" src="resources/img/loading.gif" style="height: 40px;display: none;" id="loadingID" >
        </p>
			<table class="table table-bordered table-hover" id="jobsTable">
						<thead style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Job Code</th>
								<th>Title</th>
								<th>Location</th>
								<th>Job Type</th>
								<th>Job Status</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tfoot style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Job Code</th>
								<th>Title</th>
								<th>Location</th>
								<th>Job Type</th>
								<th>Job Status</th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						
						
						<tbody id="jobsBodyID">

							
						</tbody>
					</table>
				 
		</div>
		<div class="col-sm-3" >
			
		</div>
  	</div>
  </div>
  		
  		
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
		<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Add bulk Jobs</h4>
      </div>
      <div class="modal-body">
        <p><b>Note:</b></p>
        <p>Download the <a href="resources/job_upload_bulk_template.xlsx">template</a> and update new jobs in the Excel file. Do not change the format of the Excel!</p>
        
        <iframe id="iframeID" name="iframe" src="" style="width:800px;border: 1px solid #666666;display: none;"></iframe>
        
        <form class="form-horizontal" enctype="multipart/form-data" target="iframe" action="uploadBulkJobs" method="post" id="uploadBulkFormID">
        	<div class="input-group" style="margin-top: 20px;">
	                <label class="input-group-btn">
	                    <span class="btn btn-primary btn-sm" id="browseID">
	                        Browse&hellip; <input type="file" style="display: none;" name="jobTemplate" id="fileID" accept=".xlsx">
	                    </span>
	                </label>
	                <input type="text" class="form-control input-sm" readonly id="fileNameID" placeholder="Select template" style="padding-left: 10px;">
            	</div>
          <p class="text-center" style="padding-top: 10px;">
			<img alt="" src="resources/img/loading.gif" style="height: 40px;display: none;" id="loadingIDUploadJobs" >
        </p>
        
        <p><b>Upload Bulk Jobs Report:</b></p>
        
        <table class="table table-bordered" id="bulkTableID" style="display:none;">
		    <thead style="background-color: #2c3e50;color: #ffffff;opacity:0.8;">
		      <tr>
		        <th>Job Code</th>
		        <th>Job Title</th>
		        <th>Status</th>
		        <th>Comments</th>
		      </tr>
		    </thead>
		    <tbody id="bulkBodyID">
		      
		    </tbody>
  		</table>

        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-sm" onclick="javascript:validate();">Upload Jobs</button>
      </div>
    </div>

  </div>
</div>
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
