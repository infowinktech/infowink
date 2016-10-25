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
.form-group{
	margin-bottom: 0px; 
}

</style>

<script type="text/javascript">

function viewmsg(id){
	$.ajax({
		url : "loadContactMsgBasedOnId",
		dataType : "xml",
		data:"msgId="+id,
		type : "POST",
		async : false,
		success : function(xml){
			$("#NameID").html($(xml).find("NameID").text());
			$("#EmailID").html($(xml).find("EmailID").text());
			$("#CityID").html($(xml).find("CityID").text());
			$("#StateID").html($(xml).find("StateID").text());
			$("#AddressID").html($(xml).find("AddressID").text());
			$("#DateID").html($(xml).find("DateID").text());
			$("#CommentsID").html($(xml).find("CommentsID").text());
			$("#MobileID").html($(xml).find("MobileID").text());
			$("#msgModal").modal();	
			
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
}
$(document).ready(function() {

	$.ajax({
		url : "loadMsgs",
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
});

function exportRecords(){
	$("#loadingID").show();
	$.ajax({
		url : "exportMsgs",
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
</script>


<title>Team Consultants | Solution for your IT needs</title>
</head>
<body>

	<jsp:include page="nav.jsp"></jsp:include>
	

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	
	<div class="row">
		
    	<div class="col-sm-12" style="min-height: 550px;">
			<h3></h3>
			<ol class="breadcrumb" style="background-color: #ffffff;margin-top: 20px; padding-left: 0px;">
					  <li><a href="home">Home</a></li>
					  <li class="active">Manage Messages</li>
				</ol>
	
        	
		<p class="text-right">
			<a href=# class="btn btn-primary btn-sm " onclick="javascript:exportRecords();" >Export</a>
		    <form action="" id="hrefLinkID" style="display:none;">Link</form>
		    
        </p>
        <p class="text-center">
			<img alt="" src="resources/img/loading.gif" style="height: 40px;display:none;" id="loadingID">
        </p>
			<table class="table table-bordered table-hover" id="jobsTable">
						<thead style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Name</th>
								<th>Company</th>
								<th>Email</th>
								<th>City</th>
								<th>State</th>
								<th>Date</th>
								<th></th>
							</tr>
						</thead>
						<tfoot style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Name</th>
								<th>Company</th>
								<th>Email</th>
								<th>City</th>
								<th>State</th>
								<th>Date</th>
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
<div id="msgModal" class="modal fade" role="dialog">
  <div class="modal-dialog modal-lg">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Message</h4>
      </div>
      <div class="modal-body">
        
        <form class="form-horizontal" enctype="multipart/form-data" target="iframe" action="applyJob" method="post" id="formID">
				  <div class="form-group">
				    <label class="col-sm-3 control-label text-left">Name</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="NameID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label text-left">Email</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="EmailID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label text-left">Mobile</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="MobileID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">City</label>
				    <div class="col-sm-9">
				      <p class="form-control-static" id="CityID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">State</label>
				    <div class="col-sm-9">
				     	<p class="form-control-static" id="StateID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Address</label>
				    <div class="col-sm-9">
				     	<p class="form-control-static" id="AddressID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Date</label>
				    <div class="col-sm-9">
				     	<p class="form-control-static" id="DateID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				  
				  <div class="form-group">
				    <label class="col-sm-3 control-label">Comments</label>
				    <div class="col-sm-9">
				     	<p class="form-control-static" id="CommentsID" style="padding-bottom: 0px;"></p>
				    </div>
				  </div>
				
			</form>	
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
