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


<style type="text/css">
.input-sm{
border:1px solid #dce4ec;
padding-left: 5px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$('#usersTable').DataTable();
	
	$.ajax({
		url : "loadJobs",
		dataType : "xml",
		type : "POST",
		success : function(xml){
			$("#jobsBodyID").html($(xml).find("tableContent").text());
			 $('#jobsTable').DataTable( {
			        "columnDefs": [
			            {
			                "targets": [ 6,7,2,5 ],
			                "visible": false,
			                "searchable": false
			            }
			        ]
			    } );
		},
		error : function(xhr, status, error) {
				console.log("Error occured...");
		}
	});
	
});

</script>
<title>Team Consultants | Solution for your IT needs</title>
</head>
<body style="background-color: #f7f7f7;">

	<jsp:include page="nav.jsp"></jsp:include>
	<form action ="apply" id="formID"></form>

	<!-- Content -->
	<div class="container" style="margin-top: 80px;">
	<div class="row">
		<div class="col-sm-12" style="padding-left: 0px;">
			<h3>Dashboard</h3>
		</div>
	</div>
	
	<div class="row">
	
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-6 fa fa-user fa-5x" style="background-color:  #008080 ;color: #ffffff"></div>
				<div class="col-sm-6"><h3 style="margin-top: 10px; margin-bottom: 0px;">2414</h3><p class="help-block">USERS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
		
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-7 fa fa-briefcase fa-5x" style="background-color: #8b9dc3;color: #ffffff"></div>
				<div class="col-sm-5"><h3 style="margin-top: 10px; margin-bottom: 0px;">245</h3><p class="help-block">JOBS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
	
		<div class="col-sm-3" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-5 fa fa-thumbs-up fa-5x" style="background-color: #D01A55;color: #ffffff"></div>
				<div class="col-sm-7"><h3 style="margin-top: 10px; margin-bottom: 0px;">78</h3><p class="help-block">APPLICATIONS</p></div>
		</div>
		
		<div class="col-sm-1"></div>
		
		
		<div class="col-sm-2" style="border: 1px solid #e0e0e0;padding-left: 0px;background-color: #ffffff;">
				<div class="col-sm-7 fa fa-envelope fa-5x" style="background-color:#65737e;color: #ffffff"></div>
				<div class="col-sm-5"><h3 style="margin-top: 10px; margin-bottom: 0px;">2414</h3><p class="help-block">INBOX</p></div>
		</div>
		
		
		
		<!-- 
		<div class="col-sm-1 fa fa-user fa-5x" style="border: 1px solid #e0e0e0;background-color: #2192d8;"></div>
		<div class="col-sm-1" style="border: 1px solid #e0e0e0;border-left: none;">
			<span class="fa fa-user fa-5x" style="display: none;"></span>
			<h4>2414</h4>
			<p class="help-block">Users</p>
		</div>
		 -->
	</div>
	
	<div class="row" style="padding-top: 20px;">
		<div class="col-sm-5" style="border: 1px solid #e0e0e0;background-color: #ffffff;">
			<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       		<div id="chart_div"></div>
       		<script>
            google.charts.load('current', { packages: [ 'bar','corechart'] });
            google.charts.setOnLoadCallback(
            	    function() { // Anonymous function that calls drawChart1 and drawChart2
           	         drawStuff();
                     drawChart1();
            	     drawChart();
            
            	         
            	      });

            function drawStuff() {
                console.log("drawstuff");
                var data = google.visualization.arrayToDataTable([
                             ['Jobs', 'CONTRACT', 'PERMANENT', 'FULL-TIME', 'PART-TIME'],
                             ['Jobs', 25,76,98,84],
                            
                           ]);

                var options = {
                        chart: {
                          title: 'Team Consultants | Solution for your IT needs',
                          subtitle: 'Jobs available',
                        },
                        bars: 'horizontal',
                        bar: {groupWidth: "50%"},
                        vAxis: {format: 'decimal'},
                        height: 400,
                        colors: ['#1b85b8','#673888','#ae5a41','#ef4f91']
                      };

              var chart = new google.charts.Bar(document.getElementById('dual_x_div'));
              chart.draw(data, options);
            };
  	      
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
                ['Month', 'User Registrations'],
                ['January', 20],
                ['February', 12],
                ['March', 14],
                ['April', 39]
              ]);

              var options = {
                chart: {
                  title: 'Team Consultants | Solution for your IT needs',
                  subtitle: 'New User Registrations for the last 4 months',
                },
                bars: 'vertical',
                vAxis: {format: 'decimal'},
                height: 400,
                colors: ['#1b9e77']
              };

              var chart = new google.charts.Bar(document.getElementById('chart_div'));

              chart.draw(data, google.charts.Bar.convertOptions(options));

              var btns = document.getElementById('btn-group');

              btns.onclick = function (e) {

                if (e.target.tagName === 'BUTTON') {
                  options.vAxis.format = e.target.id === 'none' ? '' : e.target.id;
                  chart.draw(data, google.charts.Bar.convertOptions(options));
                }
              }
              
              
            }

            function drawChart1() {
                var data = google.visualization.arrayToDataTable([
                  ['Task', 'Hours per Day'],
                  ['Open Jobs',     11],
                  ['Jobs closed',      2],
                  ['Jobs on hold',  2]
                  
                ]);

                var options = {
                  title: 'Jobs Overview',
                  titleTextStyle : { color: '#757575',fontSize: '18',bold: false},
                  colors: ['#005b96','#d41243','#ffcc5c'],
                  fontName : 'Questrial',
                  fontSize : '14',
                 
                  legend: {position: 'side', textStyle: {color: '#757575', fontSize: 16}},
                  
                  pieHole: 0.3
                };

                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);
              }
       		</script>
		</div>
		
		<div class="col-sm-1">
		</div>
		
		<div class="col-sm-6" style="border: 1px solid #e0e0e0;background-color: #ffffff;padding-top: 10px;">
       <div id="dual_x_div"></div>
		</div>
	</div>
	
	
	<div class="row" style="padding-top: 20px;">
		<div class="col-sm-5" style="border: 1px solid #e0e0e0;background-color: #ffffff;">
			<div id="donutchart" style=" height: 400px;"></div>
		</div>
		
		<div class="col-sm-1">
		</div>
		
		<div class="col-sm-6" style="border: 1px solid #e0e0e0;background-color: #ffffff;padding-top: 10px;">
			<table class="table table-bordered table-hover" id="jobsTable">
						<thead style="background-color: #f8f9fa;">
							<tr>
								<th>Sl.No</th>
								<th>Job Code</th>
								<th>Title</th>
								<th>Location</th>
								<th>Job Type</th>
								<th>Active</th>
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
								<th>Active</th>
								<th></th>
								<th></th>
							</tr>
						</tfoot>
						
						
						<tbody id="jobsBodyID">

							
						</tbody>
					</table>
				 
		</div>
	</div>
	
	
	
  	
  	
</div>
  		
  		
	
	<jsp:include page="signin.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<script src="resources/js/bootstrap.min.js"></script>
</body>
</html>
