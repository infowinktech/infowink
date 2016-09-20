/**
 * 
 */
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
                        groupWidth: "50%",
                        height:300,
                        vAxis: {format: 'decimal'},
                        colors: ['#1b85b8','#673888','#ae5a41','#ef4f91']
                      };

              var chart = new google.charts.Bar(document.getElementById('barHorizontal'));
              chart.draw(data, options);
            };
  	      
            function drawChart() {
              var data = google.visualization.arrayToDataTable([
                ['Month', 'Job Applications'],
                ['January', 20],
                ['February', 12],
                ['March', 14],
                ['April', 39]
              ]);

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
                  fontSize : '12',
                 
                  legend: {position: 'side', textStyle: {color: '#757575', fontSize: 16}},
                  
                  pieHole: 0.3
                };

                var chart = new google.visualization.PieChart(document.getElementById('pieChart'));
                chart.draw(data, options);
              }