
 google.charts.load('current', { packages: [ 'bar','corechart'] });
            google.charts.setOnLoadCallback(
            	    function() { // Anonymous function that calls drawChart1 and drawChart2
	           	         drawStuff();
	                     drawChart1();
	            	     drawChart();
            	      });

            function drawStuff() {
            	 var jsonData = $.ajax({
            		 url: "loadBarH",
            		 type:"POST",
            		 dataType: "json",
                     async: false
                     }).responseText;
                     
                 var data = new google.visualization.DataTable(jsonData);

                var options = {
                        chart: {
                          title: 'Team Consultants | Solution for your IT needs',
                          subtitle: 'Jobs available',
                        },
                        bars: 'horizontal',
                        groupWidth: "50%",
                        height:300,
                        vAxis: {format: 'decimal'},
                        colors: ['#1b85b8','#673888','#ae5a41','#ef4f91']
                      };

              var chart = new google.charts.Bar(document.getElementById('barHorizontal'));
              chart.draw(data, options);
            };
  	      
            function drawChart() {
            	 var jsonData = $.ajax({
            		 url: "loadBarV",
            		 type:"POST",
            		 dataType: "json",
                     async: false
                     }).responseText;
                     
                 var data = new google.visualization.DataTable(jsonData);

              var options = {
                chart: {
                  title: 'Team Consultants | Solution for your IT needs',
                  subtitle: 'Job applications received for last 4 months',
                },
                bars: 'vertical',
                vAxis: {format: 'decimal'},
                height: 400,
                colors: ['#1b9e77']
              };

              var chart = new google.charts.Bar(document.getElementById('barVertical'));

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
            	
            	 var jsonData = $.ajax({
            		 url: "loadPieChart",
            		 type:"POST",
                     dataType: "json",
                     async: false
                     }).responseText;
                     
                 var data = new google.visualization.DataTable(jsonData);

            	
                var options = {
                  title: 'Jobs Overview',
                  titleTextStyle : { color: '#757575',fontSize: '18',bold: false},
                  colors: ['#005b96','#d41243','#ffcc5c'],
                  fontName : 'Questrial',
                  fontSize : '12',
                  legend: {position: 'side', textStyle: {color: '#757575', fontSize: 16}},
                  pieHole: 0.3
                };

                var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
                chart.draw(data, options);
              }